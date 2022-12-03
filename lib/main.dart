import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:guide_selective_process/src/core/views/main.view.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations(
    [DeviceOrientation.portraitUp],
  );
  runApp(const MyAppView());
}
