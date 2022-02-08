import 'package:flutter/material.dart';
import 'package:hospital/src/config/app_config.dart';
import 'package:hospital/src/screen/home/home.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: AppConfig.appName,
      theme: ThemeData(
        colorScheme: ColorScheme.light().copyWith(
          
        )
      ),
      home: const HomeView(),
    );
  }
}
