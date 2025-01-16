import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hadir_core/hadir_core.dart';
import 'package:hadirproteacher/core/core.dart';
import 'package:intl/intl.dart';
import 'package:sizer/sizer.dart';

TableRow _buildTableRow({
  required String label,
  required String value,
  required BuildContext context,
}) {
  return TableRow(
    decoration: BoxDecoration(
      border: Border(
        bottom: BorderSide(
          color: Colors.grey[50],
        ),
      ),
    ),
    children: [
      Padding(
        padding: const EdgeInsets.symmetric(vertical: 8),
        child: Text(
          label,
          style: FluentTheme.of(context).typography.bodyStrong,
        ),
      ),
      Padding(
        padding: const EdgeInsets.symmetric(vertical: 8),
        child: Text(value),
      ),
    ],
  );
}

Widget getSessionStateWidget(SessionState state) {
  switch (state) {
    case SessionState.active:
      return Row(
        children: [
          const Text('Active'),
          SizedBox(width: 1.w),
          Icon(
            FluentIcons.circle_fill,
            color: Colors.green,
            size: 15,
          ),
        ],
      );
    case SessionState.cancelled:
      return Row(
        children: [
          const Text('Cancelled'),
          SizedBox(width: 1.w),
          Icon(
            FluentIcons.circle_fill,
            color: Colors.red,
          ),
        ],
      );

    case SessionState.finished:
      return Row(
        children: [
          const Text('Active'),
          SizedBox(width: 1.w),
          const Icon(
            FluentIcons.circle_fill,
            color: Colors.grey,
            size: 15,
          ),
        ],
      );
  }
}

class SessionsScreen extends ConsumerStatefulWidget {
  const SessionsScreen({super.key});
  @override
  ConsumerState<SessionsScreen> createState() => _SessionsScreenState();
}

class _SessionsScreenState extends ConsumerState<SessionsScreen> {
  List<Course> courses = [];
  Course? selectedCourse;
  DateTime selectedDate = DateTime.now();
  DateTime startTime = DateTime.now();
  DateTime endTime = DateTime.now().add(const Duration(hours: 1));

  @override
  Widget build(BuildContext context) {
    final sessionsFuture = ref.watch(sessionsProvider);
    ref.watch(coursesProvider).whenData(
          (value) => value.fold(
            (l) => null,
            (r) => setState(() {
              courses
                ..clear()
                ..addAll(r);
            }),
          ),
        );

    return ScaffoldPage(
      header: CommandBar(
        mainAxisAlignment: MainAxisAlignment.end,
        primaryItems: [
          CommandBarButton(
            icon: const Icon(FluentIcons.clipboard_list_add),
            label: const Text('New session'),
            onPressed: () => showDialog(
              context: context,
              barrierDismissible: true,
              builder: (context) {
                return ContentDialog(
                  title: const Text('Creat session'),
                  content: Form(
                    autovalidateMode: AutovalidateMode.always,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        InfoLabel(
                          label: 'Course',
                          child: ComboboxFormField(
                            isExpanded: true,
                            value: selectedCourse ?? courses.first,
                            onChanged: (course) =>
                                setState(() => selectedCourse = course),
                            items: courses
                                .map(
                                  (e) => ComboBoxItem(
                                    value: e,
                                    child: Text(e.name),
                                  ),
                                )
                                .toList(),
                          ),
                        ),
                        InfoLabel(
                          label: 'Date',
                          child: DatePicker(
                            onChanged: (value) {
                              setState(() {
                                selectedDate = value;
                                startTime = DateTime(
                                  value.year,
                                  value.month,
                                  value.day,
                                  startTime.hour,
                                  startTime.minute,
                                );
                                endTime = DateTime(
                                  value.year,
                                  value.month,
                                  value.day,
                                  endTime.hour,
                                  endTime.minute,
                                );
                              });
                            },
                            selected: selectedDate,
                            startDate: selectedDate,
                            showYear: false,
                          ),
                        ),
                        InfoLabel(
                          label: 'Start time',
                          child: TimePicker(
                            onChanged: (value) => setState(
                              () => startTime = DateTime(
                                selectedDate.year,
                                selectedDate.month,
                                selectedDate.day,
                                value.hour,
                                value.minute,
                              ),
                            ),
                            selected: startTime,
                            hourFormat: HourFormat.HH,
                          ),
                        ),
                        InfoLabel(
                          label: 'End time',
                          child: TimePicker(
                            onChanged: (value) => setState(
                              () => endTime = DateTime(
                                selectedDate.year,
                                selectedDate.month,
                                selectedDate.day,
                                value.hour,
                                value.minute,
                              ),
                            ),
                            selected: endTime,
                            hourFormat: HourFormat.HH,
                          ),
                        ),
                      ],
                    ),
                  ),
                  actions: [
                    Button(
                      style: const ButtonStyle(
                        backgroundColor:
                            WidgetStatePropertyAll(Colors.successPrimaryColor),
                      ),
                      child: const Text('Create'),
                      onPressed: () async {
                        final session = CourseSession(
                          courseId: selectedCourse!.id!,
                          teacherId:
                              ref.read(authNotifierProvider.notifier).userId,
                          startTime: startTime,
                          endTime: endTime,
                        );

                        final result = await ref
                            .read(attendanceManagementProvider)
                            .createSession(session);

                        result.fold(
                          (failure) {
                            displayInfoBar(
                              context,
                              builder: (context, close) {
                                return InfoBar(
                                  title: const Text(
                                    'Could not create session',
                                  ),
                                  content: Text(failure.message),
                                  action: IconButton(
                                    icon: const Icon(
                                      FluentIcons.clear,
                                    ),
                                    onPressed: close,
                                  ),
                                  severity: InfoBarSeverity.error,
                                );
                              },
                            );
                            Navigator.pop(context);
                          },
                          (_) {
                            displayInfoBar(
                              context,
                              builder: (context, close) {
                                return InfoBar(
                                  title: const Text(
                                    'Successfully created session',
                                  ),
                                  action: IconButton(
                                    icon: const Icon(
                                      FluentIcons.clear,
                                    ),
                                    onPressed: close,
                                  ),
                                  severity: InfoBarSeverity.success,
                                );
                              },
                            );
                            ref.invalidate(sessionsProvider);
                            Navigator.pop(context);
                          },
                        );
                      },
                    ),
                    Button(
                      style: const ButtonStyle(
                        backgroundColor:
                            WidgetStatePropertyAll(Colors.errorPrimaryColor),
                      ),
                      child: const Text('Close'),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    ),
                  ],
                );
              },
            ),
          ),
        ],
      ),
      content: sessionsFuture.when(
        data: (data) => data.fold(
          (failure) => ErrorScreen(message: failure.message),
          (sessions) => sessions.isEmpty
              ? const Center(
                  child: Text('No courses found, try creating one first.'),
                )
              : ListView.builder(
                  itemCount: sessions.length,
                  itemBuilder: (context, index) {
                    final session = sessions.elementAt(index);
                    return Expander(
                      trailing: getSessionStateWidget(session.state),
                      header: Text(DateFormat.yMd().format(session.startTime)),
                      content: Column(
                        children: [
                          Table(
                            columnWidths: const {
                              0: FlexColumnWidth(),
                              1: FlexColumnWidth(4),
                            },
                            children: [
                              _buildTableRow(
                                label: 'Course',
                                value: session.course!.name,
                                context: context,
                              ),
                              _buildTableRow(
                                label: 'Date',
                                value:
                                    DateFormat.yMd().format(session.startTime),
                                context: context,
                              ),
                              _buildTableRow(
                                label: 'Start time',
                                value:
                                    DateFormat.Hm().format(session.startTime),
                                context: context,
                              ),
                              _buildTableRow(
                                label: 'End time',
                                value: DateFormat.Hm().format(session.endTime),
                                context: context,
                              ),
                              _buildTableRow(
                                label: 'State',
                                value: session.state.name,
                                context: context,
                              ),
                            ],
                          ),
                          const SizedBox(height: 8),
                          CommandBar(
                            mainAxisAlignment: MainAxisAlignment.end,
                            primaryItems: [
                              CommandBarButton(
                                icon: const Icon(FluentIcons.edit),
                                label: const Text('Edit'),
                                onPressed: () {},
                              ),
                              CommandBarButton(
                                icon: const Icon(FluentIcons.delete),
                                label: const Text('Delete'),
                                onPressed: () async {
                                  final result = await ref
                                      .read(attendanceManagementProvider)
                                      .deleteSession(session.id!);

                                  result.fold(
                                    (failure) {
                                      displayInfoBar(
                                        context,
                                        builder: (context, close) {
                                          return InfoBar(
                                            title: const Text(
                                              'Could not delete session',
                                            ),
                                            content: Text(failure.message),
                                            action: IconButton(
                                              icon: const Icon(
                                                FluentIcons.clear,
                                              ),
                                              onPressed: close,
                                            ),
                                            severity: InfoBarSeverity.error,
                                          );
                                        },
                                      );
                                    },
                                    (success) {
                                      displayInfoBar(
                                        context,
                                        builder: (context, close) {
                                          return InfoBar(
                                            title: const Text(
                                              'Session deleted successfully',
                                            ),
                                            action: IconButton(
                                              icon: const Icon(
                                                FluentIcons.clear,
                                              ),
                                              onPressed: close,
                                            ),
                                            severity: InfoBarSeverity.success,
                                          );
                                        },
                                      );
                                      ref.invalidate(sessionsProvider);
                                    },
                                  );
                                },
                              ),
                              CommandBarButton(
                                icon: const Icon(FluentIcons.q_r_code),
                                label: const Text('QR Code'),
                                onPressed: () async {
                                  final result = await ref
                                      .watch(attendanceManagementProvider)
                                      .createQrCode(session);

                                  result.fold(
                                    (failure) {
                                      displayInfoBar(
                                        context,
                                        builder: (context, close) {
                                          return InfoBar(
                                            title: const Text(
                                              'Could not create QR code',
                                            ),
                                            content: Text(failure.message),
                                            action: IconButton(
                                              icon: const Icon(
                                                FluentIcons.clear,
                                              ),
                                              onPressed: close,
                                            ),
                                            severity: InfoBarSeverity.error,
                                          );
                                        },
                                      );
                                    },
                                    (qrCode) {
                                      showDialog(
                                        context: context,
                                        builder: (context) {
                                          return ContentDialog(
                                            content: qrCode,
                                          );
                                        },
                                      );
                                    },
                                  );
                                },
                              ),
                            ],
                          ),
                        ],
                      ),
                    );
                  },
                ),
        ),
        error: (error, stackTrace) => ErrorScreen(message: error.toString()),
        loading: () => const LoadingScreen(),
      ),
    );
  }
}
