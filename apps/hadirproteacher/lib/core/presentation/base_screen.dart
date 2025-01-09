import 'package:bitsdojo_window/bitsdojo_window.dart';
import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hadir_ui/hadir_ui.dart';

class BaseScreen extends ConsumerStatefulWidget {
  const BaseScreen({required this.child, super.key});
  final Widget child;

  @override
  ConsumerState<BaseScreen> createState() => _BaseScreenState();
}

class _BaseScreenState extends ConsumerState<BaseScreen> {
  @override
  Widget build(BuildContext context) {
    void maximizeOrRestore() {
      setState(() {
        appWindow.maximizeOrRestore();
      });
    }

    return ScaffoldPage(
      padding: EdgeInsets.zero,
      header: WindowTitleBarBox(
        child: Row(
          children: [
            Expanded(
              child: MoveWindow(
                child: Padding(
                  padding: const EdgeInsets.all(8),
                  child: Text(
                    'HadirPro Teacher',
                    style: FluentTheme.of(context).typography.body!.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                ),
              ),
            ),
            Row(
              children: [
                SwitchThemeButton(
                  onPressed: () async =>
                      ref.watch(dynamicThemeNotifierProvider.notifier).toggle(),
                ),
                MinimizeWindowButton(),
                if (appWindow.isMaximized)
                  RestoreWindowButton(onPressed: maximizeOrRestore)
                else
                  MaximizeWindowButton(onPressed: maximizeOrRestore),
                CloseWindowButton(),
              ],
            ),
          ],
        ),
      ),
      content: widget.child,
    );
  }
}

class SwitchThemeButton extends WindowButton {
  SwitchThemeButton({
    super.key,
    super.colors,
    super.onPressed,
    bool? animate,
  }) : super(
          animate: animate ?? false,
          iconBuilder: (buttonContext) {
            final isDarkMode =
                FluentTheme.of(buttonContext.context).brightness ==
                    Brightness.dark;
            return isDarkMode
                ? LightModeIcon(color: buttonContext.iconColor)
                : DarkModeIcon(color: buttonContext.iconColor);
          },
        );
}

class LightModeIcon extends StatelessWidget {
  const LightModeIcon({required this.color, super.key});
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Icon(
      FluentIcons.brightness,
      color: color,
      size: 12,
    );
  }
}

class DarkModeIcon extends StatelessWidget {
  const DarkModeIcon({required this.color, super.key});
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Icon(
      FluentIcons.clear_night,
      color: color,
      size: 12,
    );
  }
}
