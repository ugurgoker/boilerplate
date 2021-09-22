import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'widgets_text.dart';

class RaisedButtonForText extends StatelessWidget {
  final TextBasic? textBasic;
  final Color? bgColor;
  final Color? disabledColor;
  final double? radius;
  final double? elevation;
  final BorderSide? borderSide;
  final VoidCallback? onPressed;

  const RaisedButtonForText(
      {Key? key,
      this.textBasic,
      this.bgColor,
      this.disabledColor,
      this.radius = 0.0,
      this.elevation = 0.0,
      this.borderSide = BorderSide.none,
      this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return MaterialButton(
      elevation: elevation,
      shape: OutlineInputBorder(borderRadius: BorderRadius.circular(radius!), borderSide: borderSide!),
      color: bgColor,
      padding: EdgeInsets.symmetric(horizontal: size.width * 0.04, vertical: size.height * 0.02),
      disabledColor: disabledColor,
      onPressed: onPressed,
      child: textBasic,
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
          borderRadius: BorderRadius.circular(15.0),
          color: bgColor,
        ),
        child: IconButton(
          iconSize: 20.0,
          padding: EdgeInsets.zero,
          icon: Icon(
            Icons.arrow_back,
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
  final double? size;
  final Function? onPressed;

  const AppBarButton({Key? key, this.bgColor, this.iconColor, this.iconPath, this.size = 40.0, this.onPressed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: size,
        height: size,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15.0),
          color: bgColor,
        ),
        child: IconButton(
          padding: EdgeInsets.zero,
          icon: Image.asset(
            iconPath!,
          ),
          onPressed: () => onPressed!(),
        ),
      ),
    );
  }
}