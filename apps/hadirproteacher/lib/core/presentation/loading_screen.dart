import 'package:fluent_ui/fluent_ui.dart';
import 'package:hadirproteacher/core/presentation/base_screen.dart';

class LoadingScreen extends StatelessWidget {
  const LoadingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const BaseScreen(
      child: Center(
        child: ProgressRing(),
      ),
    );
  }
}
