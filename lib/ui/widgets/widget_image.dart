import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import '/core/extensions/extension_string.dart';
import '/ui/widgets/widgets_text.dart';
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
            isColorFilterActive!
                ? R.color.black.withOpacity(0.4)
                : R.color.transparent,
            BlendMode.darken,
          ),
          child: CachedNetworkImage(
            imageUrl: imageUrl!,
            fit: boxFit ?? BoxFit.cover,
            height: size,
            width: size,
            placeholder: (ctx, str) => Image.asset(
              placeholderPath ?? R.drawable.placeholder,
              fit: BoxFit.cover,
              height: size,
              width: size,
            ),
          ),
        ),
      ),
    );
  }
}

class ProfilePhotoBasic extends StatelessWidget {
  final double size;
  final String? imageUrl;
  final File? file;
  final String? iconSvgPath;
  final String profileName;
  final Color? bgColor;
  final Color? borderColor;
  final Color? iconColor;
  final List<BoxShadow>? boxShadow;
  final bool isCorporation;

  const ProfilePhotoBasic({Key? key, this.size = 70.0, this.imageUrl, this.file, this.iconSvgPath, required this.profileName, this.bgColor, this.borderColor, this.iconColor, this.boxShadow, this.isCorporation = false}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: bgColor ?? (isCorporation ? R.color.grayLightIce : null),
        boxShadow: boxShadow,
        border: Border.all(width: 3.0, color: borderColor ?? R.color.white),
        image: imageUrl != null ? DecorationImage(image: NetworkImage(imageUrl!)) : file != null ? DecorationImage(image: FileImage(file!)) : null,
      ),
      child: imageUrl == null || file == null
          ? iconSvgPath != null || isCorporation
              ? Center(
                  child: Image.asset(
                    iconSvgPath ?? R.drawable.placeholder,
                    width: size / 3,
                    height: size / 3,
                    color: iconColor ?? R.color.grayLightBlue,
                  ),
                )
              : Center(
              child: TextBasic(
                text: profileName.getFirstCharacter(),
                color: R.color.midnight,
                fontWeight: FontWeight.w400,
                fontSize: size / 2.5,
              ),
            )
          : null,
    );
  }
}
