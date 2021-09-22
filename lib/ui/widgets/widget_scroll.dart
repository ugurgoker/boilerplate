import 'package:flutter/material.dart';

class ScrollWithNoGlowWidget extends StatelessWidget {
  final Widget child;

  const ScrollWithNoGlowWidget({Key? key, required this.child}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return NotificationListener<OverscrollIndicatorNotification>(
      onNotification: (OverscrollIndicatorNotification overscroll) {
        overscroll.disallowGlow();
        return true;
      },
      child: child,
    );
  }
}
