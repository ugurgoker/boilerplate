import '../../core/extensions/extension_string.dart';

class AppStrings {
  final String appName = 'Boilerplate Project';
  final String turkish = 'turkish'.tr();
  final String english = 'english'.tr();
  final String ok = 'ok'.tr();
  final String cancel = 'cancel'.tr();
  final String genericError = 'genericError'.tr();
  final String networkError = 'networkError'.tr();
  final String connectionTimeOut = 'connectionTimeOut'.tr();
  final String accessStoragePermission = 'accessStoragePermission'.tr();
  final String accessCameraPermission = 'accessCameraPermission'.tr();
  final String accessGalleryPermission = 'accessGalleryPermission'.tr();
  final String accessLocationPermission = 'accessLocationPermission'.tr();
  final String pleaseUpdateApp = 'pleaseUpdateApp'.tr();
  String versionCheckMessage(String value) => 'versionCheckMessage'.tr(namedArgs: {'value': value});
  final String logoutConfirmation = 'logoutConfirmation'.tr();
}
