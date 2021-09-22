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
      return CircularProgressIndicator(valueColor: AlwaysStoppedAnimation(R.color.white.withOpacity(0.7)));
    } else {
      return const CupertinoActivityIndicator();
    }
  }
}