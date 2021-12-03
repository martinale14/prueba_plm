import 'package:plm_prueba/register_module/application/register_screen.dart';
import 'package:plm_prueba/register_module/infraestructure/register_provider.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';

class RegisterInjection {
  RegisterInjection._();

  static Widget injection() {
    return ChangeNotifierProvider(
      create: (_) => RegisterProvider(),
      child: RegisterScreen(),
    );
  }
}
