import 'package:flutter/material.dart';
import '../../core/resources/_r.dart';

class Shadows {
  static Shadows? _instance;
  static Shadows getInstance() => _instance ??= Shadows();

  final light = BoxShadow(
    color: R.color.black.withOpacity(0.07),
    spreadRadius: 0,
    blurRadius: 0,
    offset: const Offset(0.5, 2.5),
  );

  final drop = BoxShadow(
    color: R.color.black.withOpacity(0.1),
    spreadRadius: 0,
    blurRadius: 14,
    offset: const Offset(0, 14),
  );

  final yellowLighting = BoxShadow(
    color: R.color.orangeJuice,
    spreadRadius: 0,
    blurRadius: 0,
    offset: const Offset(0, 1),
  );

  final extraBig = BoxShadow(
    color: R.color.black.withOpacity(0.3),
    spreadRadius: 0,
    blurRadius: 44,
    offset: const Offset(0, 34),
  );

  final profile = BoxShadow(
    color: R.color.black.withOpacity(0.05),
    spreadRadius: 0,
    blurRadius: 30,
    offset: const Offset(0, 23),
  );

  final blueLigth = BoxShadow(
    color: R.color.black.withOpacity(0.24),
    spreadRadius: 0,
    blurRadius: 0,
    offset: const Offset(0, 2),
  );
}
