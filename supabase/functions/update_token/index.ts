import { createClient } from "https://esm.sh/@supabase/supabase-js@2.47.10";

// Validate environment variables
const SUPABASE_URL = Deno.env.get("URL");
const SUPABASE_SERVICE_ROLE_KEY = Deno.env.get("SERVICE_ROLE_KEY");
const SECRET_KEY = Deno.env.get("SECRET_KEY");

if (!SUPABASE_URL || !SUPABASE_SERVICE_ROLE_KEY || !SECRET_KEY) {
  throw new Error("Missing required environment variables.");
}

// Initialize Supabase client
const supabase = createClient(SUPABASE_URL, SUPABASE_SERVICE_ROLE_KEY);

// Configuration
const TOKEN_EXPIRY_DURATION = parseInt(
  Deno.env.get("TOKEN_EXPIRY_DURATION") || "10000",
);

/**
 * Generates a secure token by hashing a UUID with a secret key using SHA-256.
 * @returns {Promise<string>} The generated secure token in hexadecimal format.
 */
async function generateSecureToken(): Promise<string> {
  const uuid = crypto.randomUUID();
  const data = new TextEncoder().encode(uuid + SECRET_KEY);
  const hashBuffer = await crypto.subtle.digest("SHA-256", data);
  return Array.from(new Uint8Array(hashBuffer))
    .map((b) => b.toString(16).padStart(2, "0"))
    .join("");
}

// Serve the function
Deno.serve(async () => {
  try {
    // Fetch active sessions
    const { data: sessions, error } = await supabase
      .from("sessions")
      .select("*")
      .eq("state", "active");

    if (error) {
      return new Response(
        JSON.stringify({ error: `Error fetching sessions: ${error.message}` }),
        {
          headers: { "Content-Type": "application/json" },
          status: 500,
        },
      );
    }

    if (!sessions || sessions.length === 0) {
      return new Response(
        JSON.stringify({ success: true, message: "No active sessions found." }),
        {
          headers: { "Content-Type": "application/json" },
        },
      );
    }

    // Prepare updates for active sessions
    const updates = sessions.map(async (session) => {
      const newToken = await generateSecureToken();
      const expiresAt = new Date(Date.now() + TOKEN_EXPIRY_DURATION)
        .toISOString();

      // Include all required fields in the update payload
      return {
        id: session.id,
        current_token: newToken,
        token_expires_at: expiresAt,
        course_id: session.course_id,
        teacher_id: session.teacher_id,
        start_time: session.start_time,
        end_time: session.end_time,
        state: session.state,
      };
    });

    // Wait for all token generation promises to resolve
    const updatedSessions = await Promise.all(updates);

    // Batch update sessions
    const { error: batchUpdateError } = await supabase
      .from("sessions")
      .upsert(updatedSessions, { onConflict: "id" });

    if (batchUpdateError) {
      return new Response(
        JSON.stringify({
          error: `Error updating sessions: ${batchUpdateError.message}`,
        }),
        {
          headers: { "Content-Type": "application/json" },
          status: 500,
        },
      );
    }

    // Return success response
    return new Response(
      JSON.stringify({
        success: true,
        updatedSessions: updatedSessions.length,
      }),
      {
        headers: { "Content-Type": "application/json" },
      },
    );
  } catch (err) {
    const errorMessage = (err instanceof Error)
      ? err.message
      : "Unexpected error";
    console.error("Error in function execution:", errorMessage);
    return new Response(
      JSON.stringify({ error: `Unexpected error: ${errorMessage}` }),
      {
        headers: { "Content-Type": "application/json" },
        status: 500,
      },
    );
  }
});
