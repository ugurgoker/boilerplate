import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../core/resources/_r.dart';

class ActivityIndicator extends StatelessWidget {
  const ActivityIndicator({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      width: size.width,
      height: size.height,
      decoration: BoxDecoration(color: R.color.black.withOpacity(0.2)),
      child: Center(child: _getActivityIndicator()),
    );
  }

  Widget _getActivityIndicator() {
    if (Platform.isAndroid) {
      return const AndroidIndicator();
    } else {
      return const IOSIndicator();
    }
  }
}

class AndroidIndicator extends StatelessWidget {
  final Color? color;
  final double strokeWidth;

  const AndroidIndicator({Key? key, this.color, this.strokeWidth = 4.0})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CircularProgressIndicator(
      valueColor: AlwaysStoppedAnimation(color ?? R.color.white.withOpacity(0.7)),
      strokeWidth: strokeWidth,
    );
  }
}

class IOSIndicator extends StatelessWidget {
  const IOSIndicator({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const CupertinoActivityIndicator();
  }
}
