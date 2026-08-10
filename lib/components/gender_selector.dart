import 'package:flutter/material.dart';
import 'package:imc_calculator/core/app_color.dart';
import 'package:imc_calculator/core/text_styles.dart';

class GenderSelector extends StatefulWidget {
  const GenderSelector({super.key});

  @override
  State<GenderSelector> createState() => _GenderSelectorState();
}

class _GenderSelectorState extends State<GenderSelector> {
  // Guarda el género seleccionado mediante un String de tipo null ?.
  String? selectedGender;

  @override
  Widget build(BuildContext context) {
    // Row coloca sus elementos hijos horizontalmente: Hombre | Mujer
    return Row(
      children: [
        // ==== HOMBRE ====
        // Expanded hace que este widget ocupe el espacio disponible proporcionalmente
        // dentro del Row. Como hay dos Expanded, cada uno ocupa aproximadamente la 
        // mitad del ancho disponible.
        Expanded(
          // GestureDetector permite detectar gestos del usuario. En este caso 
          // detectaremos cuando el usuario toca la tarjeta de Hombre.
          child: GestureDetector(
            // onTap se ejecuta cuando el usuario toca la tarjeta.
            onTap: () {
              setState(() {
                // Guardamos "Hombre" como género seleccionado.
                // Después de ejecutar setState(), Flutter vuelve a ejecutar build() 
                // y cambia el color de la tarjeta.
                selectedGender = "Hombre";
              });
            },
            // Agrega espacio alrededor de la tarjeta de Hombre con Padding.
            child: Padding(
              // EdgeInsets define cuánto espacio habrá en cada lado:
              padding: const EdgeInsets.only(left: 16, top: 16, bottom: 16, right: 8),
              // Container representa visualmente la tarjeta.
              child: Container(
                // decoration permite darle estilos al Container, como color, bordes y 
                // bordes redondeados.
                decoration: BoxDecoration(
                  // Esta condicion permite que la tarjeta cambie de color cuando el 
                  // usuario la selecciona. Ademas, utiliza colores personalizados.
                  color: selectedGender == "Hombre"
                    ? AppColors.backgroundComponentSelected
                    : AppColors.backgroundComponent,
                  // BorderRadius hace que las esquinas de la tarjeta sean redondeadas.
                  borderRadius: BorderRadius.circular(16),
                ),
                // Agrega espacio interno dentro de la tarjeta.
                child: Padding(
                  // Agrega 12 píxeles de espacio en los cuatro lados.
                  padding: const EdgeInsets.all(12),
                  // Column coloca sus elementos verticalmente.
                  child: Column(
                    children: [
                      Image.asset("assets/images/male.png", height: 100),
                      // SizedBox agrega 8 píxeles de espacio vertical entre la imagen y el texto.
                      SizedBox(height: 8),
                      // Muestra el texto utilizando el estilo personalizado.
                      Text("Hombre", style: TextStyles.bodyText),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
        // ==== MUJER ====
        Expanded(
          child: GestureDetector(
            onTap: () {
              setState(() {
                selectedGender = "Mujer";
              });
            },
            child: Padding(
              padding: const EdgeInsets.only(top: 16, bottom: 16, right: 16, left: 8),
              child: Container(
                decoration: BoxDecoration(
                  color: selectedGender == "Mujer"
                  ? AppColors.backgroundComponentSelected
                  : AppColors.backgroundComponent,
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(12),
                  child: Column(
                    children: [
                      Image.asset("assets/images/female.png", height: 100),
                      SizedBox(height: 8),
                      Text("Mujer", style: TextStyles.bodyText),
                    ],
                  ),
                ),
              ),
            ),
          ),
        )
      ],
    );
  }
}