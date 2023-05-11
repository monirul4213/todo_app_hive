import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:path_provider/path_provider.dart';

import 'data_model.dart';
import 'home.dart';

Future<void> main() async {
  await Hive.initFlutter();

  Hive.registerAdapter(dataModelAdapter());

  await Hive.openBox('DB');

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Material App',
      theme: ThemeData(
        useMaterial3: true,
      ),
      home: home(),
    );
  }
}
