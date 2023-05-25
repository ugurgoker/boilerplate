// ignore_for_file: unused_field

import 'package:flutter/material.dart';
import '../../core/resources/_r.dart';

class TransitionSplash extends StatefulWidget {
  final Widget child;
  final Function onFinish;
  const TransitionSplash({Key? key, required this.child, required this.onFinish}) : super(key: key);

  @override
  State<TransitionSplash> createState() => _TransitionSplashState();
}

class _TransitionSplashState extends State<TransitionSplash> with TickerProviderStateMixin {
  late AnimationController _scaleController;
  late AnimationController _scale2Controller;
  late AnimationController _widthController;
  late AnimationController _positionController;

  late Animation<double> _scaleAnimation;
  late Animation<double> _scale2Animation;
  late Animation<double> _widthAnimation;
  late Animation<double> _positionAnimation;

  bool hideIcon = false;

  @override
  void initState() {
    super.initState();

    _scaleController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
    );

    _scaleAnimation =
        Tween<double>(begin: 1.0, end: 0.8).animate(_scaleController)
          ..addStatusListener(
            (status) {
              if (status == AnimationStatus.completed) {
                _widthController.forward();
              }
            },
          );

    _widthController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 600),
    );

    _widthAnimation =
        Tween<double>(begin: 80.0, end: 300.0).animate(_widthController)
          ..addStatusListener(
            (status) {
              if (status == AnimationStatus.completed) {
                _positionController.forward();
              }
            },
          );

    _positionController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 2000),
    );

    _positionAnimation =
        Tween<double>(begin: 0.0, end: 215.0).animate(_positionController)
          ..addStatusListener(
            (status) {
              if (status == AnimationStatus.completed) {
                setState(() {
                  hideIcon = true;
                });
                _scale2Controller.forward();
                widget.onFinish();
              }
            },
          );

    _scale2Controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
    );

    _scale2Animation =
        Tween<double>(begin: 1.0, end: 32.0).animate(_scale2Controller)
          ..addStatusListener(
            (status) {
              if (status == AnimationStatus.completed) {
                // widget.onFinish();
              }
            },
          );

    _scaleController.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Center(
          child: widget.child,
        ),
        AnimatedBuilder(
          animation: _positionController,
          builder: (context, child) => Positioned(
            left: 0.0,
            bottom: 0.0,
            right: 0.0,
            child: AnimatedBuilder(
              animation: _scale2Controller,
              builder: (context, child) => Transform.scale(
                scale: _scale2Animation.value,
                child: Container(
                  width: 60,
                  height: 60,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: hideIcon ? R.color.white : R.color.transparent,
                  ),
                  child: Container(),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
