import 'package:flutter/material.dart';
import '../../core/resources/_r.dart';
import '../../core/utils/utilities.dart';

class BottomSheetBase extends StatelessWidget {
  final Widget child;
  const BottomSheetBase({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final bottomBarHeight = MediaQuery.of(context).padding.bottom;
    return GestureDetector(
      onTap: () => Utilities.hideKeyboard(context),
      child: Stack(
        children: [
          Container(
            width: size.width,
            margin: const EdgeInsets.only(top: 10.0),
            padding: EdgeInsets.only(bottom: bottomBarHeight),
            constraints: BoxConstraints(
              maxHeight: size.height * 0.9,
              minHeight: size.height * 0.2,
            ),
            decoration: BoxDecoration(
              color: R.color.white,
              borderRadius: const BorderRadius.vertical(top: Radius.circular(20.0)),
            ),
            child: child,
          ),
          Container(
            height: 10.0,
            width: size.width,
            margin: const EdgeInsets.symmetric(horizontal: 20.0),
            decoration: BoxDecoration(
              color: R.color.bottomSheetRadiusColor,
              borderRadius: const BorderRadius.vertical(top: Radius.circular(20.0)),
            ),
          ),
        ],
      ),
    );
  }
}
