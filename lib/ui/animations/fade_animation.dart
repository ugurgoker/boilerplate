import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';

class FadeInLeftBasic extends StatelessWidget {
  final Widget child;
  final Duration? duration;
  final Duration? delay;
  const FadeInLeftBasic({ Key? key, required this.child, this.duration, this.delay}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FadeInLeft(
      duration: duration ?? const Duration(milliseconds: 500),
      delay: delay ?? const Duration(milliseconds: 0),
      child: child,
    );
  }
}

class FadeInRightBasic extends StatelessWidget {
  final Widget child;
  final Duration? duration;
  final Duration? delay;
  const FadeInRightBasic({ Key? key, required this.child, this.duration, this.delay}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FadeInRight(
      duration: duration ?? const Duration(milliseconds: 500),
      delay: delay ?? const Duration(milliseconds: 0),
      child: child,
    );
  }
}

class FadeInUpBasic extends StatelessWidget {
  final Widget child;
  final Duration? duration;
  final Duration? delay;
  const FadeInUpBasic({ Key? key, required this.child, this.duration, this.delay}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FadeInUp(
      duration: duration ?? const Duration(milliseconds: 500),
      delay: delay ?? const Duration(milliseconds: 0),
      child: child,
    );
  }
}

class FadeInDownBasic extends StatelessWidget {
  final Widget child;
  final Duration? duration;
  final Duration? delay;
  const FadeInDownBasic({ Key? key, required this.child, this.duration, this.delay}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FadeInDown(
      duration: duration ?? const Duration(milliseconds: 500),
      delay: delay ?? const Duration(milliseconds: 0),
      child: child,
    );
  }
}