import 'package:flutter/material.dart';
import 'package:kerja_mudah/core/data/datasource/build_config.dart';
import 'package:kerja_mudah/main.dart';
import 'package:kerja_mudah/main_module.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await MainModule.init(
    buildConfig: () => BuildConfig(baseUrl: "http://192.168.1.3:8000/api/", debug: true)
  );
  runApp(MyApp());
}