import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '/core/resources/_r.dart';
import '/ui/widgets/widgets_text.dart';

class TextFieldBasic extends StatefulWidget {
  final String? title;
  final String? labelText;
  final FocusNode? focusNode;
  final TextInputType? keyboardType;
  final TextInputAction? textInputAction;
  final Function(String)? onFieldSubmitted;
  final String? Function(String?)? validator;
  final TextEditingController? controller;
  final bool? isPassword;
  final bool? isRequired;
  final int? maxLength;
  final int? maxLines;
  final bool? enabled;
  final Color? textColor;
  final Color? labelTextColor;
  final String? labelTextFont;
  final String? fontFamily;
  final FontWeight? fontWeight;
  final String? hintText;
  final double? fontSize;
  final double? elevation;
  final Widget? suffixIcon;
  final bool hasError;
  final String? errorLabel;
  final Widget? prefixIcon;
  final Color? bgColor;
  final Color? fillColor;
  final Color? borderColor;
  final Color? focusedBorderColor;
  final Color? errorBorderColor;
  final double borderWith;
  final double radius;
  final TextAlignVertical? textAlignVertical;
  final TextAlign? textAlign;
  final bool? isDense;
  final double? contentPaddingVertical;
  final List<TextInputFormatter>? inputFormatters;
  final Widget? titleSuffix;

  const TextFieldBasic({
    Key? key,
    this.title,
    this.labelText,
    this.focusNode,
    this.keyboardType,
    this.textInputAction = TextInputAction.done,
    this.onFieldSubmitted,
    this.validator,
    this.controller,
    this.isPassword = false,
    this.isRequired = false,
    this.maxLength,
    this.maxLines = 1,
    this.enabled = true,
    this.textColor,
    this.labelTextColor,
    this.labelTextFont,
    this.fontFamily,
    this.fontWeight = FontWeight.w700,
    this.hintText,
    this.fontSize,
    this.elevation = 0.0,
    this.suffixIcon,
    this.hasError = false,
    this.errorLabel,
    this.prefixIcon,
    this.bgColor,
    this.fillColor,
    this.borderColor,
    this.focusedBorderColor,
    this.errorBorderColor,
    this.borderWith = 0.5,
    this.radius = 8.0,
    this.textAlignVertical,
    this.textAlign,
    this.isDense,
    this.contentPaddingVertical,
    this.inputFormatters,
    this.titleSuffix,
  }) : super(key: key);

  @override
  State<TextFieldBasic> createState() => _TextFieldBasicState();
}

class _TextFieldBasicState extends State<TextFieldBasic> {
  late FocusNode focusNode;
  bool? obscureText;

  @override
  void initState() {
    super.initState();
    obscureText = widget.isPassword;
    focusNode = widget.focusNode ?? FocusNode();
  }

  void setObscureText() {
    obscureText = !obscureText!;
    notifyListener();
  }

  void notifyListener() => setState(() {});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        widget.title == null
            ? Container()
            : Container(
                margin: const EdgeInsets.symmetric(horizontal: 4.0),
                child: Row(
                  children: [
                    Expanded(
                      child: TextBasic(
                        text: widget.title!,
                        color: R.color.dateGray,
                        fontFamily: R.fonts.interMedium,
                        fontSize: 14.0,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    widget.titleSuffix ?? Container(),
                  ],
                ),
              ),
        SizedBox(height: widget.title == null ? 0.0 : 6.0),
        Material(
          elevation: widget.elevation ?? 1.0,
          borderRadius: BorderRadius.circular(widget.radius),
          child: Container(
            color: widget.bgColor ?? R.color.white,
            child: Stack(
              children: [
                focusNode.hasFocus
                    ? Positioned(
                        top: 0.0,
                        left: 0.0,
                        right: 0.0,
                        bottom: 0.0,
                        child: Container(
                          decoration: BoxDecoration(
                            color: R.themeColor.primary,
                            borderRadius: BorderRadius.circular(widget.radius),
                          ),
                        ),
                      )
                    : Container(),
                Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: TextFormField(
                    inputFormatters: widget.inputFormatters,
                    enabled: widget.enabled ?? true,
                    cursorColor: R.themeColor.primary,
                    focusNode: focusNode,
                    keyboardType: widget.keyboardType,
                    textInputAction: widget.textInputAction,
                    maxLength: widget.maxLength,
                    onFieldSubmitted: widget.onFieldSubmitted,
                    controller: widget.controller,
                    obscureText: obscureText!,
                    maxLines: widget.maxLines,
                    validator: widget.validator,
                    textAlignVertical: widget.textAlignVertical ?? TextAlignVertical.center,
                    textAlign: widget.textAlign ?? TextAlign.start,
                    style: TextStyle(
                      color: widget.textColor ?? R.color.dateGray,
                      fontSize: widget.fontSize ?? 16.0,
                      fontFamily: widget.fontFamily ?? R.fonts.interRegular,
                      fontWeight: widget.fontWeight ?? FontWeight.w400,
                    ),
                    decoration: InputDecoration(
                      hintText: widget.hintText,
                      fillColor: widget.fillColor ?? R.color.white,
                      isDense: widget.isDense,
                      filled: true,
                      contentPadding: EdgeInsets.symmetric(
                        vertical: widget.contentPaddingVertical ?? 10.0,
                        horizontal: 14.0,
                      ),
                      labelText: widget.labelText,
                      labelStyle: TextStyle(
                        color: widget.labelTextColor ?? R.color.dateGray,
                        fontSize: 16.0,
                        fontFamily: widget.labelTextFont ?? R.fonts.interRegular,
                        fontWeight: FontWeight.w400,
                      ),
                      hintStyle: TextStyle(
                        color: widget.labelTextColor ?? R.color.dateGray,
                        fontSize: 16.0,
                        fontFamily: widget.labelTextFont ?? R.fonts.interRegular,
                        fontWeight: FontWeight.w400,
                      ),
                      suffixIcon: widget.suffixIcon ?? _getSuffixIcon(),
                      prefixIcon: widget.prefixIcon,
                      border: _getBorder(),
                      focusedBorder: _getFocusedBorder(),
                      enabledBorder: _getBorder(),
                      errorBorder: _getErrorBorder(),
                      focusedErrorBorder: _getBorder(),
                      disabledBorder: _getBorder(),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        widget.errorLabel == null
            ? Container()
            : !widget.hasError
                ? Container()
                : Container(
                    margin: const EdgeInsets.symmetric(horizontal: 4.0),
                    child: TextBasic(
                      text: widget.errorLabel!,
                      color: R.themeColor.error,
                      fontFamily: R.fonts.interMedium,
                      fontSize: 14.0,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
      ],
    );
  }

  OutlineInputBorder _getBorder() {
    if (widget.hasError) {
      return _getErrorBorder();
    }
    return OutlineInputBorder(
      borderSide: widget.borderWith == 0
          ? BorderSide.none
          : BorderSide(
              color: widget.borderColor ?? R.color.dateGray,
              width: widget.borderWith,
            ),
      borderRadius: BorderRadius.circular(widget.radius),
    );
  }

  OutlineInputBorder _getFocusedBorder() {
    if (widget.hasError) {
      return _getErrorBorder();
    }
    return OutlineInputBorder(
      borderSide: widget.borderWith == 0
          ? BorderSide.none
          : BorderSide(
              color: widget.focusedBorderColor ?? widget.borderColor ?? R.themeColor.primary,
              width: widget.borderWith,
            ),
      borderRadius: BorderRadius.circular(widget.radius),
    );
  }

  OutlineInputBorder _getErrorBorder() {
    return OutlineInputBorder(
      borderSide: BorderSide(
        color: widget.errorBorderColor ?? R.themeColor.error,
        width: 1.0,
      ),
      borderRadius: BorderRadius.circular(widget.radius),
    );
  }

  Widget? _getSuffixIcon() {
    if (widget.hasError) {
      return SizedBox(
        height: 24.0,
        width: 24.0,
        child: IconButton(
          icon: Icon(
            Icons.error_outline,
            color: R.themeColor.error,
          ),
          iconSize: 16.0,
          onPressed: () {},
        ),
      );
    }
    if (widget.isRequired! && widget.isPassword!) {
      return SizedBox(
        height: 24.0,
        width: 24.0,
        child: IconButton(
          icon: Icon(
            obscureText! ? Icons.visibility : Icons.visibility_off,
            color: R.color.dateGray,
          ),
          iconSize: 16.0,
          onPressed: () => setObscureText(),
        ),
      );
    } else if (widget.isRequired!) {
      return SizedBox(
        height: 24.0,
        width: 24.0,
        child: Center(
          child: TextBasic(
            text: '*',
            color: R.themeColor.error,
            fontSize: 16.0,
          ),
        ),
      );
    } else {
      return null;
    }
  }
}
