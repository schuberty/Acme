import 'package:acme/src/app_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  _appProperties();

  runApp(const AcmeApp());
}

void _appProperties() {
  WidgetsFlutterBinding.ensureInitialized();

  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
}
