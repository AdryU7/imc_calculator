import 'package:flutter/material.dart';
import 'package:imc_calculator/core/app_color.dart';
import 'package:imc_calculator/core/text_styles.dart';

class HeightSelector extends StatefulWidget {
  final double selectedHeight;
  final Function(double) onHeightChange;
  const HeightSelector(
    {super.key, required this.selectedHeight, required this.onHeightChange});

  @override
  State<HeightSelector> createState() => _HeightSelectorState();
}

class _HeightSelectorState extends State<HeightSelector> {

  @override
  Widget build(BuildContext context) {
    // Padding agrega espacio a los lados del componente.
    return Padding(
      padding: const EdgeInsets.only(left: 16, right: 16),
      // Container representa el bloque visual de la altura.
      child: Container(
        decoration: BoxDecoration(
          // Color de fondo personalizado.
          color: AppColors.backgroundComponent,
          // Redondea las esquinas.
          borderRadius: BorderRadius.circular(16),
        ),
        // Agrega espacio interno dentro de la tarjeta. (SOLO 8 PARA ARRIBA)
        child: Padding(
          padding: const EdgeInsets.only(top: 8),
          // Column coloca los elementos uno debajo de otro.
          child: Column(
            children: [
              Text("Altura", style: TextStyles.bodyText),
              // Muestra la altura actual en centímetros.
              // toStringAsFixed(0) elimina los decimales.
              Text("${widget.selectedHeight.toStringAsFixed(0)} cm", style: TextStyle(
                color: Colors.white,
                fontSize: 38,
                fontWeight: FontWeight.bold,
              )),
              // Slider permite seleccionar la altura.
              Slider(
                // Valor actual del Slider.
                value: widget.selectedHeight,
                // Se ejecuta cuando el usuario mueve el Slider.
                onChanged: (newHeight) {
                  // Actualiza la interfaz con el nuevo valor.
                  setState(() {
                    widget.onHeightChange(newHeight);
                  });
                },
                // Altura mínima: 150 cm; Altura máxima: 220 cm.
                min: 150,
                max: 220,
                // Divide el Slider en 70 pasos.
                divisions: 70,
                // Muestra el valor seleccionado.
                label: "${widget.selectedHeight.toStringAsFixed(0)} cm",
                // Color de la parte activa del Slider.
                activeColor: AppColors.primary,
              )
            ],
          ),
        ),
      ),
    );
  }
}