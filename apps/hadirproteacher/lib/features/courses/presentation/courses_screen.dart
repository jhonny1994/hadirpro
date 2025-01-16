import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hadir_core/hadir_core.dart';
import 'package:hadirproteacher/core/core.dart';
import 'package:sizer/sizer.dart';

class CoursesScreen extends ConsumerStatefulWidget {
  const CoursesScreen({super.key});

  @override
  ConsumerState<CoursesScreen> createState() => _CoursesScreenState();
}

class _CoursesScreenState extends ConsumerState<CoursesScreen> {
  final descriptionController = TextEditingController();
  final nameController = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    nameController.dispose();
    descriptionController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final coursesFuture = ref.watch(coursesProvider);
    return ScaffoldPage(
      header: CommandBar(
        mainAxisAlignment: MainAxisAlignment.end,
        primaryItems: [
          CommandBarButton(
            icon: const Icon(FluentIcons.clipboard_list_add),
            label: const Text('New course'),
            onPressed: () => showDialog(
              context: context,
              barrierDismissible: true,
              builder: (context) {
                return ContentDialog(
                  title: const Text('Create course'),
                  content: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      InfoLabel(
                        label: 'Name',
                        child: TextBox(
                          controller: nameController,
                          minLines: 2,
                          maxLines: 2,
                        ),
                      ),
                      InfoLabel(
                        label: 'Description',
                        child: TextBox(
                          controller: descriptionController,
                          minLines: 5,
                          maxLines: 5,
                        ),
                      ),
                    ],
                  ),
                  actions: [
                    Button(
                      style: const ButtonStyle(
                        backgroundColor:
                            WidgetStatePropertyAll(Colors.successPrimaryColor),
                      ),
                      child: const Text('Create'),
                      onPressed: () async {
                        final course = Course(
                          name: nameController.text.trim().trim(),
                          description: descriptionController.text.trim(),
                          teacherId:
                              ref.read(authNotifierProvider.notifier).userId,
                        );
                        final result = await ref
                            .read(courseManagementProvider)
                            .createCourse(course);

                        nameController.clear();
                        descriptionController.clear();

                        result.fold((failure) {
                          displayInfoBar(
                            context,
                            builder: (context, close) {
                              return InfoBar(
                                title: const Text(
                                  'Could not create course',
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
                        }, (course) {
                          displayInfoBar(
                            context,
                            builder: (context, close) {
                              return InfoBar(
                                title: const Text(
                                  'Successfully created course',
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
                          ref.invalidate(coursesProvider);
                          Navigator.pop(context);
                        });
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
      content: coursesFuture.when(
        data: (data) => data.fold(
          (failure) => ErrorScreen(message: failure.message),
          (courses) => courses.isEmpty
              ? const Center(
                  child: Text('No courses found, try creating one first.'),
                )
              : ListView.builder(
                  itemCount: courses.length,
                  itemBuilder: (context, index) {
                    final course = courses.elementAt(index);
                    return ListTile(
                      title: Text(course.name),
                      subtitle: Text(course.description),
                      trailing: Row(
                        spacing: 1.w,
                        children: [
                          IconButton(
                            style: ButtonStyle(
                              backgroundColor: const WidgetStatePropertyAll(
                                Colors.successPrimaryColor,
                              ),
                              foregroundColor: WidgetStatePropertyAll(
                                FluentTheme.of(context).activeColor,
                              ),
                            ),
                            icon: const Icon(FluentIcons.edit),
                            onPressed: () => showDialog(
                              context: context,
                              barrierDismissible: true,
                              builder: (context) {
                                return StatefulBuilder(
                                  builder: (
                                    BuildContext context,
                                    StateSetter setState,
                                  ) {
                                    nameController.text = course.name;
                                    descriptionController.text =
                                        course.description;

                                    return ContentDialog(
                                      title: const Text('Course Details'),
                                      content: Column(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          InfoLabel(
                                            label: 'Name',
                                            child: TextBox(
                                              controller: nameController,
                                            ),
                                          ),
                                          InfoLabel(
                                            label: 'Description',
                                            child: TextBox(
                                              controller: descriptionController,
                                            ),
                                          ),
                                        ],
                                      ),
                                      actions: [
                                        Button(
                                          style: const ButtonStyle(
                                            backgroundColor:
                                                WidgetStatePropertyAll(
                                              Colors.successPrimaryColor,
                                            ),
                                          ),
                                          onPressed: () async {
                                            final newCourse = course.copyWith(
                                              name: nameController.text.trim(),
                                              description: descriptionController
                                                  .text
                                                  .trim(),
                                            );
                                            final result = await ref
                                                .read(courseManagementProvider)
                                                .updateCourse(newCourse);

                                            nameController.clear();
                                            descriptionController.clear();

                                            result.fold(
                                              (failure) {
                                                displayInfoBar(
                                                  context,
                                                  builder: (context, close) {
                                                    return InfoBar(
                                                      title: const Text(
                                                        'Could not update course',
                                                      ),
                                                      content:
                                                          Text(failure.message),
                                                      action: IconButton(
                                                        icon: const Icon(
                                                          FluentIcons.clear,
                                                        ),
                                                        onPressed: close,
                                                      ),
                                                      severity:
                                                          InfoBarSeverity.error,
                                                    );
                                                  },
                                                );
                                              },
                                              (course) {
                                                displayInfoBar(
                                                  context,
                                                  builder: (context, close) {
                                                    return InfoBar(
                                                      title: const Text(
                                                        'Successfully updated course',
                                                      ),
                                                      action: IconButton(
                                                        icon: const Icon(
                                                          FluentIcons.clear,
                                                        ),
                                                        onPressed: close,
                                                      ),
                                                      severity: InfoBarSeverity
                                                          .success,
                                                    );
                                                  },
                                                );
                                                ref.invalidate(coursesProvider);
                                                Navigator.pop(context);
                                              },
                                            );
                                          },
                                          child: const Text('Edit'),
                                        ),
                                        Button(
                                          style: const ButtonStyle(
                                            backgroundColor:
                                                WidgetStatePropertyAll(
                                              Colors.errorPrimaryColor,
                                            ),
                                          ),
                                          child: const Text('Close'),
                                          onPressed: () {
                                            nameController.clear();
                                            descriptionController.clear();
                                            Navigator.pop(context);
                                          },
                                        ),
                                      ],
                                    );
                                  },
                                );
                              },
                            ),
                          ),
                          IconButton(
                            style: ButtonStyle(
                              backgroundColor: const WidgetStatePropertyAll(
                                Colors.errorPrimaryColor,
                              ),
                              foregroundColor: WidgetStatePropertyAll(
                                FluentTheme.of(context).activeColor,
                              ),
                            ),
                            icon: const Icon(FluentIcons.delete),
                            onPressed: () => showDialog(
                              context: context,
                              barrierDismissible: true,
                              builder: (context) => StatefulBuilder(
                                builder: (context, setState) => ContentDialog(
                                  title: const Text('Delete course'),
                                  content: const Text(
                                    'Are you sure you want to delete this course?',
                                  ),
                                  actions: [
                                    Button(
                                      style: const ButtonStyle(
                                        backgroundColor: WidgetStatePropertyAll(
                                          Colors.successPrimaryColor,
                                        ),
                                      ),
                                      onPressed: () async {
                                        final result = await ref
                                            .read(courseManagementProvider)
                                            .deleteCourse(course.id!);
                                        result.fold(
                                          (failure) {
                                            displayInfoBar(
                                              context,
                                              builder: (context, close) {
                                                return InfoBar(
                                                  title: const Text(
                                                    'Could not delete course',
                                                  ),
                                                  content:
                                                      Text(failure.message),
                                                  action: IconButton(
                                                    icon: const Icon(
                                                      FluentIcons.clear,
                                                    ),
                                                    onPressed: close,
                                                  ),
                                                  severity:
                                                      InfoBarSeverity.error,
                                                );
                                              },
                                            );
                                          },
                                          (course) {
                                            displayInfoBar(
                                              context,
                                              builder: (context, close) {
                                                return InfoBar(
                                                  title: const Text(
                                                    'Successfully deleted course',
                                                  ),
                                                  action: IconButton(
                                                    icon: const Icon(
                                                      FluentIcons.clear,
                                                    ),
                                                    onPressed: close,
                                                  ),
                                                  severity:
                                                      InfoBarSeverity.success,
                                                );
                                              },
                                            );
                                            ref.invalidate(coursesProvider);
                                            Navigator.pop(context);
                                          },
                                        );
                                      },
                                      child: const Text('Delete'),
                                    ),
                                    Button(
                                      style: const ButtonStyle(
                                        backgroundColor: WidgetStatePropertyAll(
                                          Colors.errorPrimaryColor,
                                        ),
                                      ),
                                      child: const Text('Close'),
                                      onPressed: () {
                                        Navigator.pop(context);
                                      },
                                    ),
                                  ],
                                ),
                              ),
                            ),
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
