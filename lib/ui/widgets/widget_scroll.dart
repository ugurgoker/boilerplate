import 'package:flutter/material.dart';

class ScrollWithNoGlowWidget extends StatelessWidget {
  final Widget child;
  final bool isActiveScroll;
  final Axis scrollDirection;
  final ScrollController? controller;
  final EdgeInsets? padding;

  const ScrollWithNoGlowWidget({
    Key? key,
    required this.child,
    this.isActiveScroll = true,
    this.scrollDirection = Axis.vertical,
    this.controller,
    this.padding,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return NotificationListener<OverscrollIndicatorNotification>(
      onNotification: (OverscrollIndicatorNotification overscroll) {
        overscroll.disallowIndicator();
        return true;
      },
      child: isActiveScroll
          ? SingleChildScrollView(
              keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
              padding: padding,
              controller: controller,
              scrollDirection: scrollDirection,
              child: child,
            )
          : child,
    );
  }
}
