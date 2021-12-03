import 'package:plm_prueba/main_module/application/main_app.dart';
import 'package:plm_prueba/main_module/infraestructure/main_provider.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';

class MainInjection {
  MainInjection._();

  static Widget injection() {
    return ChangeNotifierProvider(
      create: (_) => MainProvider(),
      child: const MainApp(),
    );
  }
}
