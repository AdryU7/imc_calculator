import 'package:flutter/material.dart';
import 'package:imc_calculator/components/gender_selector.dart';
import 'package:imc_calculator/components/height_selector.dart';
import 'package:imc_calculator/components/number_selector.dart';

class ImcHomeScreen extends StatefulWidget {
  const ImcHomeScreen({super.key});

  @override
  State<ImcHomeScreen> createState() => _ImcHomeScreenState();
}

class _ImcHomeScreenState extends State<ImcHomeScreen> {
  int selectedAge = 20; // Variable de estado mutable para almacenar la edad seleccionada (inicial en 20).
  int selectedWeight = 80; // Variable de estado mutable para almacenar el peso seleccionado (inicial en 80).

  @override
  Widget build(BuildContext context) {
    // Organiza los elementos verticales principales de la pantalla.
    return Column(
      // Lista de widgets ordenados verticalmente de arriba a abajo.
      children: [
        // Componente para seleccionar el género (masculino/femenino).
        GenderSelector(),
        // Componente para seleccionar la altura mediante un deslizador (slider).
        HeightSelector(),
        // Agrega un margen externo uniforme alrededor de los selectores numéricos.
        Padding(
          // Define un espacio interno/externo de 16px en todos los lados.
          padding: const EdgeInsets.all(16),
          // Dispone los dos selectores (Peso y Edad) lado a lado en horizontal.
          child: Row(
            // Elementos ubicados dentro de la fila horizontal.
            children: [
              // Obliga al selector de peso a ocupar el 50% del espacio disponible.
              Expanded(
                // Reutiliza el componente NumberSelector configurado para el peso.
                child: NumberSelector(
                  title: "Peso", // Título identificador.
                  value: selectedWeight, // Pasa el valor del peso actual.
                  // Callback que disminuye el peso cuando se presiona restar.
                  onDecrement: () {
                    // Notifica a Flutter que el estado cambió para redibujar el widget.
                    setState(() {
                      selectedWeight--; // Resta 1 al peso.
                    });
                  },
                  // Callback que incrementa el peso cuando se presiona sumar.
                  onIncrement: () {
                    // Notifica a Flutter que el estado cambió para redibujar el widget.
                    setState(() {
                      selectedWeight++; // Suma 1 al peso.
                    });
                  },
                ),
              ),
              // Añade una separación horizontal transparente de 16px entre componentes.
              SizedBox(width: 16),
              // Obliga al selector de edad a ocupar el otro 50% del espacio horizontal.
              Expanded(
                // Reutiliza el componente NumberSelector configurado para la edad.
                child: NumberSelector(
                  title: "Edad", // Título identificador.
                  value: selectedAge, // Pasa el valor de la edad actual.
                  // Callback que disminuye la edad cuando se presiona restar.
                  onDecrement: () {
                    // Notifica a Flutter que el estado cambió para redibujar el widget.
                    setState(() {
                      selectedAge--; // Resta 1 a la edad.
                    });
                  },
                  // Callback que incrementa la edad cuando se presiona sumar.
                  onIncrement: () {
                    // Notifica a Flutter que el estado cambió para redibujar el widget.
                    setState(() {
                      selectedAge++; // Suma 1 a la edad.
                    });
                  },
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
