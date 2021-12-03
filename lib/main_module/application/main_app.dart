import 'package:flutter/material.dart';
import 'package:plm_prueba/home_module/application/home_injection.dart';
import 'package:plm_prueba/utils/theme.dart';

class MainApp extends StatelessWidget {
  const MainApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'PLM Register',
      theme: PlmTheme.generateTheme(),
      home: HomeInjection.injection(),
    );
  }
}
