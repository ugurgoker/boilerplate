import '../resources/color.dart';
import '../resources/dimens.dart';
import '../resources/drawable.dart';
import '../resources/fonts.dart';
import '../resources/strings.dart';

class R {
  static Drawable? _drawable;
  static Drawable get drawable => _drawable ??= Drawable();

  static AppColor? _color;
  static AppColor get color => _color ??= AppColor();

  static Fonts? _fonts;
  static Fonts get fonts => _fonts ??= Fonts();

  static AppStrings? _string;
  static AppStrings get string => _string ??= AppStrings();

  static Dimens? _dimens;
  static Dimens get dimens => _dimens ??= Dimens();
}