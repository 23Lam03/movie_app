import 'package:device_preview/device_preview.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:movie_app/app/my_app.dart';

void main(List<String> args) {
  runApp(
    DevicePreview(
      enabled: kReleaseMode,
      builder: (context) => const MyApp(), // Wrap your app
    ),
  );
}
