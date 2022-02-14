import 'package:flutter/material.dart';
import '/core/resources/_r.dart';
import '/core/utils/utilities.dart';
import '/ui/widgets/widget_button.dart';
import '/ui/widgets/widgets_text.dart';

class AppBarBasic extends StatelessWidget implements PreferredSize {
  final Widget? title;
  final String? titleText;
  final Widget? trailing;
  final Function? onPressedBackButton;
  final Color? bgColor;
  final EdgeInsetsGeometry? padding;
  final bool? isActiveTrailingPadding;
  final TextAlign? textAlign;

  const AppBarBasic({
    Key? key,
    this.title,
    this.titleText,
    this.trailing,
    this.onPressedBackButton,
    this.bgColor,
    this.padding,
    this.isActiveTrailingPadding = true,
    this.textAlign = TextAlign.center,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return PreferredSize(
      preferredSize: preferredSize,
      child: Container(
        padding: padding ?? const EdgeInsets.only(left: 20.0, top: 40.0, right: 20.0),
        color: bgColor ?? R.color.transparent,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            AppbarBackButton(
              bgColor: R.color.white,
              iconColor: R.color.midnight,
              onPressed: () {
                if(onPressedBackButton == null) {
                  Utilities.onBackPressed(context);
                }else {
                  onPressedBackButton!();
                }
              },
            ),
            Expanded(
              child: Container(
                padding: EdgeInsets.only(right: isActiveTrailingPadding! ? 12.0 : 0.0, left: 12.0),
                margin: EdgeInsets.only(right: trailing == null ? 40.0 : 0.0),
                child: title ??
                    (titleText == null
                        ? Container()
                        : TextBasic(
                            text: titleText!,
                            color: R.color.midnight,
                            fontFamily: R.fonts.interBold,
                            fontWeight: FontWeight.w700,
                            fontSize: 16.0,
                            textAlign: textAlign,
                          )),
              ),
            ),
            trailing != null ? trailing! : Container(),
          ],
        ),
      ),
    );
  }

  @override
  Widget get child => Container();

  @override
  Size get preferredSize => const Size(double.infinity, 72.0);
}
