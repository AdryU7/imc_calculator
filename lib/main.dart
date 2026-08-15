import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:imc_calculator/core/app_color.dart';
import 'package:imc_calculator/screens/imc_home_screen.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        // Esto elimina el fondo blanco durante las transiciones
        pageTransitionsTheme: const PageTransitionsTheme(
          builders: {
            TargetPlatform.android: CupertinoPageTransitionsBuilder(),
            TargetPlatform.iOS: CupertinoPageTransitionsBuilder(),
          },
        ),
        // Configuración de color de fondo por defecto
        scaffoldBackgroundColor: AppColors.background,
      ),
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: AppColors.primary, 
          foregroundColor: Colors.white, 
          title: Text("Imc Calculator"),
        ),
        //backgroundColor: AppColors.background,
        body: ImcHomeScreen(),
      ),
    );
  }
}
