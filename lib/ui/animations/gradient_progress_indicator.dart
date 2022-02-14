import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import '/core/resources/_r.dart';
import '/ui/widgets/widgets_text.dart';

class GradientProgressIndicator extends StatefulWidget {
  final double value;
  final LinearGradient gradient;
  final double? borderRadius;

  const GradientProgressIndicator({Key? key, required this.value, required this.gradient, this.borderRadius}) : super(key: key);

  @override
  _GradientProgressIndicatorState createState() => _GradientProgressIndicatorState();
}

class _GradientProgressIndicatorState extends State<GradientProgressIndicator> with SingleTickerProviderStateMixin {
  AnimationController? _controller;
  late Animation<double> pAnimation;
  List<Color> colors = [];

  double? prevValue = 0.0;

  late CurvedAnimation curvedAnimation;

  @override
  void initState() {
    super.initState();
    _setColorsArray();


    _controller = AnimationController(
      duration: const Duration(milliseconds: 1800),
      vsync: this,
    );

    _setControllerListener();

    curvedAnimation =  CurvedAnimation(parent: _controller!, curve: Curves.fastOutSlowIn);
    pAnimation = Tween<double>(begin: prevValue, end: widget.value).animate(curvedAnimation);
    prevValue = widget.value;

    _controller!.forward();
  }

  void _setColorsArray() {
    colors.clear();
    colors.addAll(widget.gradient.colors);
    colors.add(R.color.grayLightIce);
  }

  void _setControllerListener() {
      _controller!.addStatusListener((status) {
      if (status == AnimationStatus.dismissed) {
        _controller!.forward();
      } else if (status == AnimationStatus.completed) {
        _controller!.stop();
      }
    });
  }

  @override
  void didUpdateWidget(GradientProgressIndicator oldWidget) {
    super.didUpdateWidget(oldWidget);

    _setColorsArray();

    _setControllerListener();

    if (!_controller!.isAnimating) {
      _controller!.reset();
    } else {
      pAnimation = Tween<double>(begin: prevValue, end: widget.value).animate(curvedAnimation);
      _controller!..reset()..forward();
      prevValue = widget.value;
    }
  }

  @override
  void dispose() {
    _controller!.dispose();
    super.dispose();
  }

  Widget _buildIndicator(BuildContext context, double animationValue) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: widget.borderRadius != null ? BorderRadius.circular(widget.borderRadius!) : null,
        gradient: LinearGradient(
          begin: widget.gradient.begin,
          end: widget.gradient.end,
          stops: <double>[
            0.0,
            animationValue,
            animationValue + 0.01,
          ],
          colors: colors,
        ),
      ),
      child: Center(
        child: TextBasic(
          text: '%${widget.value == 1 ? '100' : widget.value.toString().split('.').last.length == 1 ? widget.value.toString().split('.').last + '0' : widget.value.toString().split('.').last.substring(0, 1) == '0' ? widget.value.toString().split('.').last.replaceFirst('0', '') : widget.value.toString().split('.').last}',
          color: R.color.midnight,
          fontSize: 10.0,
          fontWeight: FontWeight.w700,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: pAnimation,
      builder: (BuildContext context, Widget? child) {
        return _buildIndicator(context, pAnimation.value);
      },
    );
  }
}
