import 'package:flutter/cupertino.dart';
import 'package:plm_prueba/home_module/application/home_screen.dart';
import 'package:plm_prueba/home_module/infraestructure/home_provider.dart';
import 'package:provider/provider.dart';

class HomeInjection {
  HomeInjection._();

  static Widget injection() {
    return ChangeNotifierProvider(
      create: (_) => HomeProvider(),
      child: const HomeScreen(),
    );
  }
}
