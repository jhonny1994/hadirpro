import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hadir_core/hadir_core.dart';
import 'package:hadirproteacher/hadir_pro_teacher.dart';
import 'package:sizer/sizer.dart';

class DashboardNavigationScreen extends ConsumerStatefulWidget {
  const DashboardNavigationScreen({
    required this.child,
    super.key,
  });
  final Widget child;

  @override
  ConsumerState<DashboardNavigationScreen> createState() =>
      _DashboardNavigationScreenState();
}

class _DashboardNavigationScreenState
    extends ConsumerState<DashboardNavigationScreen> {
  int index = 2;
  @override
  Widget build(BuildContext context) {
    final profileData = ref.watch(profileProvider);
    return profileData.when(
      data: (profile) => NavigationView(
        pane: NavigationPane(
          onChanged: (i) => setState(() => index = i),
          selected: index,
          header: Padding(
            padding: EdgeInsets.all(2.h),
            child: Center(
              child: Column(
                children: [
                  const Text('Welcome'),
                  Text(profile.name),
                ],
              ),
            ),
          ),
          items: [
            PaneItem(
              icon: const Icon(FluentIcons.view_dashboard),
              title: const Text('Dashboard'),
              body: const DashboardScreen(),
            ),
            PaneItem(
              icon: const Icon(FluentIcons.clipboard_list),
              title: const Text('Courses'),
              body: const CoursesScreen(),
            ),
            PaneItem(
              icon: const Icon(FluentIcons.check_list),
              title: const Text('Sessions'),
              body: const SessionsScreen(),
            ),
          ],
          footerItems: [
            PaneItem(
              icon: const Icon(FluentIcons.settings),
              title: const Text('Settings'),
              body: const SizedBox.shrink(),
            ),
            PaneItem(
              icon: const Icon(FluentIcons.sign_out),
              title: const Text('Sign Out'),
              body: const SizedBox.shrink(),
              onTap: () => ref.read(authNotifierProvider.notifier).signOut(),
            ),
          ],
        ),
      ),
      error: (error, stackTrace) => ErrorScreen(message: error.toString()),
      loading: () => const LoadingScreen(),
    );
  }
}
