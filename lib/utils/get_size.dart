import 'package:flutter/material.dart';

double getWidth(context) {
  final size = MediaQuery.sizeOf(context);
  return size.width;
}

double getHeight(context) {
  final size = MediaQuery.sizeOf(context);
  return size.height;
}
