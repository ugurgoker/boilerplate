import '../enums/enum_app.dart';
import '../utils/general_data.dart';

class ThemeController {
  static ThemeController? _instance;
  static ThemeController getInstance() => _instance ??= ThemeController();
  
  ThemeApperance currentAppTheme = ThemeApperance.light;

  void setTheme(ThemeApperance theme) {
    currentAppTheme = theme;
    if(GeneralData.getInstance().getDarkMode() != theme) {
      GeneralData.getInstance().setDarkMode(theme);
    }
  }

  void getTheme() {
    setTheme(GeneralData.getInstance().getDarkMode());
  }
}
