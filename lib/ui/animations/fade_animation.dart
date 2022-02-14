import 'package:flutter/material.dart';
import '/ui/packages/simple_anim.dart/controlled_animation.dart';
import '/ui/packages/simple_anim.dart/multi_track_tween.dart';

class FadeAnimation extends StatelessWidget {
  final double delay;
  final Widget child;

  const FadeAnimation({Key? key, required this.delay, required this.child}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    final tween = MultiTrackTween([
      Track("opacity").add(const Duration(milliseconds: 500), Tween(begin: 0.0, end: 1.0)),
      Track("translateY").add(
        const Duration(milliseconds: 500),
        Tween(begin: -130.0, end: 0.0),
        curve: Curves.easeOut,
      ),
    ]);

    return ControlledAnimation(
      delay: Duration(milliseconds: (500 * delay).round()),
      duration: tween.duration,
      tween: tween,
      child: child,
      builderWithChild: (context, child, Map<String, dynamic> animation) => Opacity(
        opacity: animation["opacity"],
        child: Transform.translate(
          offset: Offset(0, animation["translateY"]), 
          child: child
        ),
      ),
    );
  }
}