import 'package:flutter/material.dart';
import 'package:imc_calculator/core/app_color.dart';
import 'package:imc_calculator/core/text_styles.dart';

class ImcResultScreen extends StatelessWidget {
  // Propiedades requeridas: peso en kg y altura en metros/cm
  final int weight;
  final double height;
  // Constructor constante con parámetros requeridos e ID único de widget (key)
  const ImcResultScreen({super.key, required this.weight, required this.height});
  // Método build que describe la estructura de la interfaz gráfica
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Estructura principal de la pantalla con barra superior y cuerpo
      //backgroundColor: AppColors.background,
      appBar: toolbarResult(), // Llama a la función que construye el AppBar
      body: bodyResult(), // Llama a la función que construye el contenido principal
    );
  }
  // Método que retorna el contenido principal envuelto en un Padding de 16px
  Padding bodyResult() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start, // Alinea los elementos a la izquierda
        children: [
          // Título principal de la sección de resultados
          Text("Tu resultado", style: TextStyle(
            fontSize: 38,
            color: Colors.white,
            fontWeight: FontWeight.bold
          )),
          // Contenedor expandido para ocupar todo el espacio vertical disponible
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(top: 32, bottom: 32), // Espaciado vertical
              child: Container(
                width: double.infinity, // Ocupa todo el ancho disponible
                decoration: BoxDecoration(
                  color: AppColors.backgroundComponent, // Color de fondo del componente
                  borderRadius: BorderRadius.circular(16) // Bordes redondeados de 16px
                ),
                child: Text("data"),
              ),
            ),
          ),
          // Botón inferior para finalizar o volver a la pantalla anterior
          SizedBox(
            height: 60, // Altura fija del botón
            width: double.infinity, // Botón a ancho completo
            child: ElevatedButton(
              // Acción al presionar el botón
              onPressed: () {},
              // Establece bordes redondeados de 8px al botón
              style: ButtonStyle(
                shape: WidgetStateProperty.all(RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                )),
                // Asigna el color principal de la app al fondo del botón
                backgroundColor: WidgetStateProperty.all(AppColors.primary),
              ),
              // Texto dentro del botón
              child: Text("Finalizar", style: TextStyles.bodyText),
            ),
          )
        ],
      ),
    );
  }

  AppBar toolbarResult() {
    return AppBar(
      title: Text("Resultado"),
      backgroundColor: AppColors.primary,
      foregroundColor: Colors.white,
    );
  }
}