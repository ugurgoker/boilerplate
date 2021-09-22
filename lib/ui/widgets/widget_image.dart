import 'package:flutter/material.dart';
import '../../core/resources/_r.dart';

class NetworkImageWithPlaceholder extends StatelessWidget {
  final String? imageUrl;
  final String? placeholderPath;
  final double size;
  final bool? isColorFilterActive;
  final bool isCircle;
  final BoxFit? boxFit;
  final BoxBorder? border;

  const NetworkImageWithPlaceholder(
      {Key? key,
      this.imageUrl,
      this.placeholderPath,
      required this.size,
      this.isColorFilterActive = false,
      this.isCircle = false,
      this.border,
      this.boxFit})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: border,
        borderRadius: BorderRadius.circular(isCircle ? size : 0.0),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(isCircle ? size : 0.0),
        child: ColorFiltered(
          colorFilter: ColorFilter.mode(
            isColorFilterActive! ? R.color.black.withOpacity(0.4) : R.color.transparent,
            BlendMode.darken,
          ),
          child: FadeInImage.assetNetwork(
            image: imageUrl!,
            placeholder: placeholderPath ?? R.drawable.placeholder,
            fit: boxFit ?? BoxFit.cover,
            height: size,
            width: size,
          ),
        ),
      ),
    );
  }
}