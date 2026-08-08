import 'package:flutter/material.dart';
import 'package:imc_calculator/core/app_color.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: AppColors.primary, 
          foregroundColor: Colors.white, 
          title: Text("Imc Calculator"),
        ),
        backgroundColor: AppColors.background,
        body: Center(
          child: Text('Hello World!'),
        ),
      ),
    );
  }
}
