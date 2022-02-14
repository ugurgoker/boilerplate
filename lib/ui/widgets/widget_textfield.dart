import 'package:flutter/material.dart';
import '/core/resources/_r.dart';
import '/ui/widgets/widgets_text.dart';

class TextFieldBasic extends StatefulWidget {
  final String? title;
  final String? labelText;
  final FocusNode? focusNode;
  final TextInputType? keyboardType;
  final TextInputAction? textInputAction;
  final Function(String)? onFieldSubmitted;
  final Function(String)? validator;
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
  final Widget? prefixIcon;
  final Color? bgColor;
  final Color? borderColor;
  final Color? focusedBorderColor;
  final Color? errorBorderColor;
  final double borderWith;
  final double? radius;
  final TextAlignVertical? textAlignVertical;
  final TextAlign? textAlign;
  final bool? isDense;
  final double? contentPaddingVertical;

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
    this.prefixIcon,
    this.bgColor,
    this.borderColor,
    this.focusedBorderColor,
    this.errorBorderColor,
    this.borderWith = 1.0,
    this.radius,
    this.textAlignVertical,
    this.textAlign,
    this.isDense,
    this.contentPaddingVertical,
  }) : super(key: key);
  @override
  _TextFieldBasicState createState() => _TextFieldBasicState();
}

class _TextFieldBasicState extends State<TextFieldBasic> {
  bool? obscureText;

  @override
  void initState() {
    super.initState();
    obscureText = widget.isPassword;
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
              : TextBasic(
                  text: widget.title!,
                  color: R.color.midnight,
                  fontSize: 16.0,
                  fontWeight: FontWeight.w400,
                ),
          SizedBox(height: widget.title == null ? 0.0 : 10.0),
          Material(
            elevation: widget.elevation ?? 1.0,
            borderRadius: BorderRadius.circular(10.0),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: TextFormField(
                enabled: widget.enabled ?? true,
                cursorColor: R.color.primary,
                focusNode: widget.focusNode,
                keyboardType: widget.keyboardType,
                textInputAction: widget.textInputAction,
                onFieldSubmitted: widget.onFieldSubmitted,
                controller: widget.controller,
                obscureText: obscureText!,
                maxLines: widget.maxLines,
                validator: (v) => widget.validator!(v!),
                textAlignVertical: widget.textAlignVertical ?? TextAlignVertical.center,
                textAlign: widget.textAlign ?? TextAlign.start,
                style: TextStyle(
                  color: widget.textColor ?? R.color.midnight,
                  fontSize: widget.fontSize ?? 14.0,
                  fontFamily: widget.fontFamily ?? R.fonts.interRegular,
                  fontWeight: widget.fontWeight,
                  // letterSpacing: -1.0,
                ),
                decoration: InputDecoration(
                  hintText: widget.hintText,
                  fillColor: widget.bgColor ?? R.color.white,
                  isDense: widget.isDense,
                  filled: true,
                  contentPadding: EdgeInsets.symmetric(
                      vertical: widget.contentPaddingVertical ?? 8.0, horizontal: 20.0),
                  labelText: widget.labelText,
                  labelStyle: TextStyle(
                    color: widget.labelTextColor ?? R.color.midnight,
                    fontSize: 14.0,
                    fontFamily: widget.labelTextFont ?? R.fonts.interRegular,
                    letterSpacing: -1.0,
                  ),
                  hintStyle: TextStyle(
                    color: widget.labelTextColor ?? R.color.grayLight,
                    fontSize: 14.0,
                    fontFamily: widget.labelTextFont ?? R.fonts.interRegular,
                    fontWeight: FontWeight.normal,
                    letterSpacing: -1.0,
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
          ),
        ],
      );
  }

  OutlineInputBorder _getBorder() {
    return OutlineInputBorder(
      borderSide: widget.borderWith == 0 ? BorderSide.none : BorderSide(
          color: widget.borderColor ?? R.color.grayLightBlue,
          width: widget.borderWith),
      borderRadius: BorderRadius.circular(widget.radius ?? 14.0),
    );
  }

  OutlineInputBorder _getFocusedBorder() {
    return OutlineInputBorder(
      borderSide: widget.borderWith == 0 ? BorderSide.none : BorderSide(
          color:
              widget.focusedBorderColor ?? widget.borderColor ?? R.color.primary,
          width: widget.borderWith),
      borderRadius: BorderRadius.circular(widget.radius ?? 14.0),
    );
  }

  OutlineInputBorder _getErrorBorder() {
    return OutlineInputBorder(
      borderSide: BorderSide(
          color: widget.errorBorderColor ?? R.color.radicalRed, width: 1.0),
      borderRadius: BorderRadius.circular(widget.radius ?? 14.0),
    );
  }

  Widget? _getSuffixIcon() {
    if (widget.isRequired! && widget.isPassword!) {
      return SizedBox(
        height: 24.0,
        width: 24.0,
        child: IconButton(
          icon: Icon(
            obscureText! ? Icons.visibility : Icons.visibility_off,
            color: R.color.grayLight,
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
            color: R.color.radicalRed,
            fontSize: 16.0,
          ),
        ),
      );
    } else {
      return null;
    }
  }
}
