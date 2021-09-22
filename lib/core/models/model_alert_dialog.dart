class ModelAlertDialog {
  final String? title;
  final String description;
  final bool? isDismissible;
  final bool? isActiveCancelButton;
  final Function? onPressedButton;

  ModelAlertDialog({this.title, required this.description, this.isDismissible = true, this.isActiveCancelButton = false, this.onPressedButton});
}