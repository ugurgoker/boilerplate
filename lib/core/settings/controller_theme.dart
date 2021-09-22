import '../enums/enum_app.dart';
import '../utils/general_data.dart';

class ThemeController {
  static ThemeApperance currentAppTheme = ThemeApperance.light;

  static void setTheme(ThemeApperance theme) {
    currentAppTheme = theme;
    if(GeneralData.getDarkMode() != theme) {
      GeneralData.setDarkMode(theme);
    }
  }

  static void getTheme() {
    setTheme(GeneralData.getDarkMode());
  }
}
