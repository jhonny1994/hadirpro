import 'package:fluent_ui/fluent_ui.dart';
import 'package:hadirproteacher/hadir_pro_teacher.dart';

class ErrorScreen extends StatelessWidget {
  const ErrorScreen({super.key, this.message});
  final String? message;
  @override
  Widget build(BuildContext context) {
    return const BaseScreen(
      child: Placeholder(),
    );
  }
}
