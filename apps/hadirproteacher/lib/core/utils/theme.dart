import 'package:fluent_ui/fluent_ui.dart';
import 'package:hadirproteacher/core/utils/colors.dart';

class AppTheme {
  static final lightTheme = FluentThemeData.light().copyWith(
    accentColor: AppColors.accentLight.toAccentColor(),
    scaffoldBackgroundColor: AppColors.backgroundLight,
    cardColor: AppColors.cardLight,
    typography: Typography.fromBrightness(
      brightness: Brightness.light,
      color: AppColors.textLight,
    ),
    buttonTheme: const ButtonThemeData.all(
      ButtonStyle(
        backgroundColor: WidgetStatePropertyAll(AppColors.accentLight),
        foregroundColor: WidgetStatePropertyAll(AppColors.textDark),
        elevation: WidgetStatePropertyAll(4),
        padding: WidgetStatePropertyAll(
          EdgeInsets.symmetric(vertical: 8, horizontal: 16),
        ),
      ),
    ),
    checkboxTheme: CheckboxThemeData(
      checkedDecoration: WidgetStatePropertyAll(
        BoxDecoration(
          color: AppColors.accentLight,
          borderRadius: BorderRadius.circular(4),
        ),
      ),
      uncheckedDecoration: WidgetStatePropertyAll(
        BoxDecoration(
          borderRadius: BorderRadius.circular(4),
          border: Border.all(color: AppColors.accentLight),
        ),
      ),
      checkedIconColor: const WidgetStatePropertyAll(AppColors.textDark),
    ),
    iconTheme: const IconThemeData(
      color: AppColors.accentLight,
    ),
  );
  static final darkTheme = FluentThemeData.dark().copyWith(
    accentColor: AppColors.accentDark.toAccentColor(),
    scaffoldBackgroundColor: AppColors.backgroundDark,
    cardColor: AppColors.cardDark,
    typography: Typography.fromBrightness(
      brightness: Brightness.dark,
      color: AppColors.textDark,
    ),
    buttonTheme: const ButtonThemeData.all(
      ButtonStyle(
        backgroundColor: WidgetStatePropertyAll(AppColors.accentDark),
        foregroundColor: WidgetStatePropertyAll(AppColors.textDark),
        elevation: WidgetStatePropertyAll(4),
        padding: WidgetStatePropertyAll(
          EdgeInsets.symmetric(vertical: 8, horizontal: 16),
        ),
      ),
    ),
    checkboxTheme: CheckboxThemeData(
      checkedDecoration: WidgetStatePropertyAll(
        BoxDecoration(
          color: AppColors.accentLight,
          borderRadius: BorderRadius.circular(4),
        ),
      ),
      uncheckedDecoration: WidgetStatePropertyAll(
        BoxDecoration(
          borderRadius: BorderRadius.circular(4),
          border: Border.all(color: AppColors.accentLight),
        ),
      ),
      checkedIconColor: const WidgetStatePropertyAll(AppColors.textDark),
    ),
    iconTheme: const IconThemeData(
      color: AppColors.accentLight,
    ),
  );
}
