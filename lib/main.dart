import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'telas/calculadora.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]);
  runApp(const Calculatora());
}
