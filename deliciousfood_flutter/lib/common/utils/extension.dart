import 'package:flutter/material.dart';

extension ColorExtension on String {
  Color rgbToColor({double alpha = 1}) {
    if (isEmpty) {
      return Colors.white;
    }
    final rgb = split(',');
    int r = int.parse(rgb[0]);
    int g = int.parse(rgb[1]);
    int b = int.parse(rgb[2]);
    return Color.fromARGB((255 * alpha).round(), r, g, b);
  }
}

extension GlobalContextX on BuildContext {
  static BuildContext? _rootContext;

  static set rootContext(BuildContext context) {
    _rootContext = context;
  }

  static BuildContext get rootContext => _rootContext!;
}
