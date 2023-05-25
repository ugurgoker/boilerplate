import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '/core/resources/_r.dart';
import 'widgets_text.dart';

class ButtonBasic extends StatelessWidget {
  final TextBasic? textBasic;
  final Color? bgColor;
  final Color? disabledColor;
  final double radius;
  final double? elevation;
  final BorderSide borderSide;
  final VoidCallback? onPressed;
  final String? text;
  final Color? textColor;
  final String? fontFamily;
  final FontWeight? fontWeight;
  final double? fontSize;
  final Widget? child;
  final EdgeInsets? padding;

  const ButtonBasic({
    Key? key,
    this.textBasic,
    this.bgColor,
    this.disabledColor,
    this.radius = 8.0,
    this.elevation = 1.0,
    this.borderSide = BorderSide.none,
    this.onPressed,
    this.text,
    this.textColor,
    this.fontFamily,
    this.fontWeight,
    this.fontSize,
    this.child,
    this.padding,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return MaterialButton(
      elevation: elevation,
      shape: OutlineInputBorder(
        borderRadius: BorderRadius.circular(radius),
        borderSide: borderSide,
      ),
      color: bgColor ?? R.themeColor.primary,
      padding: padding ?? EdgeInsets.symmetric(horizontal: size.width * 0.04, vertical: 10.0),
      disabledColor: disabledColor,
      onPressed: onPressed,
      child: textBasic ??
          child ??
          TextBasic(
            text: text ?? '',
            color: textColor ?? R.color.white,
            fontFamily: fontFamily ?? R.fonts.interBold,
            fontSize: fontSize ?? 16.0,
            fontWeight: fontWeight,
          ),
    );
  }
}

class AppbarBackButton extends StatelessWidget {
  final Color? bgColor;
  final Color? iconColor;
  final Function? onPressed;

  const AppbarBackButton({Key? key, this.bgColor, this.iconColor, this.onPressed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: 40.0,
        height: 40.0,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8.0),
          color: bgColor,
        ),
        child: IconButton(
          iconSize: 16.0,
          padding: EdgeInsets.zero,
          icon: Icon(
            Icons.arrow_back_ios_new_rounded,
            color: iconColor,
          ),
          onPressed: () => onPressed!(),
        ),
      ),
    );
  }
}

class AppBarButton extends StatelessWidget {
  final Color? bgColor;
  final Color? iconColor;
  final String? iconPath;
  final String? iconSvgPath;
  final double? size;
  final double? iconSize;
  final Widget? icon;
  final Function onPressed;

  const AppBarButton({
    Key? key,
    this.bgColor,
    this.iconColor,
    this.iconPath,
    this.iconSvgPath,
    this.size = 40.0,
    this.iconSize = 24.0,
    this.icon,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: size,
        height: size,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8.0),
          color: bgColor ?? R.color.white,
        ),
        child: IconButton(
          padding: EdgeInsets.zero,
          onPressed: () => onPressed(),
          icon: icon != null
              ? icon!
              : iconPath == null
                  ? iconSvgPath == null
                      ? Container()
                      : SvgPicture.asset(
                          iconSvgPath!,
                          colorFilter: iconColor == null ? null : ColorFilter.mode(iconColor!, BlendMode.srcIn),
                          width: iconSize,
                          height: iconSize,
                        )
                  : Image.asset(
                      iconPath!,
                      color: iconColor,
                      width: iconSize,
                      height: iconSize,
                    ),
        ),
      ),
    );
  }
}

class ActionButtonBasic extends StatelessWidget {
  final String iconPath;
  final String title;
  final Function() onTap;
  final Color? textColor;

  const ActionButtonBasic({Key? key, required this.iconPath, required this.title, required this.onTap, this.textColor}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 16.0),
        decoration: BoxDecoration(
          border: Border.symmetric(horizontal: BorderSide(width: 1.0, color: R.color.dateGray)),
        ),
        child: Row(
          children: [
            SvgPicture.asset(iconPath),
            const SizedBox(width: 12.0),
            TextBasic(
              text: title,
              color: textColor ?? R.color.dateGray,
              fontWeight: FontWeight.w500,
              fontSize: 14.0,
              fontFamily: R.fonts.interMedium,
            ),
          ],
        ),
      ),
    );
  }
}
