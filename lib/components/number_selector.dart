import 'package:flutter/material.dart';
import 'package:imc_calculator/core/app_color.dart';
import 'package:imc_calculator/core/text_styles.dart';

// Define un widget con estado (su interfaz o datos pueden cambiar).
class NumberSelector extends StatefulWidget {
  // Propiedad inmutable para almacenar el título que mostrará el widget.
  final String title;
  // Propiedad para el número que se va a mostrar.
  final int value;
  // Función callback que se ejecuta al presionar el botón de decrementar.
  final Function() onDecrement;
  // Función callback que se ejecuta al presionar el botón de incrementar.
  final Function() onIncrement;

  // Constructor que recibe las propiedades obligatorias y la clave del widget.
  const NumberSelector({
    super.key, // Pasa la clave (Key) a la clase base StatefulWidget.
    required this.title, // Parámetro requerido para el título.
    required this.onDecrement, // Parámetro requerido para decrementar.
    required this.onIncrement, // Parámetro requerido para incrementar.
    required this.value, // Parámetro requerido para el valor numérico.
  });
  // Indica qué estado gestionará la interfaz visual de este widget.
  @override
  State<NumberSelector> createState() => _NumberSelectorState();
}

// Clase de estado privada que maneja la lógica y renderizado de NumberSelector.
class _NumberSelectorState extends State<NumberSelector> {
  @override
  Widget build(BuildContext context) {
    // Devuelve un contenedor con estilos básicos (color, bordes, dimensiones).
    return Container(
      // Configura el estilo visual externo del contenedor.
      decoration: BoxDecoration(
          // Color de fondo personalizado.
          color: AppColors.backgroundComponent,
          // Redondea las esquinas.
          borderRadius: BorderRadius.circular(16),
        ),
      // Añade un margen interno alrededor de todo el contenido.
      child: Padding(
        // Aplica un espaciado uniforme de 12px en los 4 lados.
        padding: const EdgeInsets.all(12),
        // Organiza los elementos de forma vertical (uno sobre otro).
        child: Column(
          // Lista de widgets hijos alineados verticalmente.
          children: [
            // Muestra el título recibido desde la clase widget.
            Text(widget.title, style: TextStyles.bodyText),
            // Convierte el entero a String para mostrarlo como texto.
            Text(
              widget.value.toString(),
              // Aplica estilos al número (color, tamaño y grosor).
              style: TextStyle(
                color: Colors.white, // Color de letra blanco.
                fontSize: 38, // Tamaño de letra grande.
                fontWeight: FontWeight.bold, // Texto en negrita.
              ),
            ),
            // Organiza los botones horizontalmente (uno al lado del otro).
            Row(
              // Centra los elementos hijos a lo largo del eje horizontal.
              mainAxisAlignment: MainAxisAlignment.center,
              // Lista de widgets dentro de la fila (los 2 botones y el espacio).
              children: [
                // Botón flotante para la acción de restar.
                FloatingActionButton(
                  // Identificador unico que se utiliza al pasar de pantalla para vincular 
                  // animacion de pase de pantalla
                  heroTag: null,
                  // Acción a ejecutar al presionar el botón.
                  onPressed: () {
                    // Llama a la función recibida desde el widget padre.
                    widget.onDecrement();
                  },
                  shape: CircleBorder(), // Le da forma circular completa al botón.
                  backgroundColor: AppColors.primary, // Color de fondo del botón.
                  child: Icon(Icons.remove, color: Colors.white), // Icono de resta.
                ),
                // Crea un espacio transparente horizontal de 16px entre botones.
                SizedBox(width: 16),
                // Botón flotante para la acción de sumar.
                FloatingActionButton(
                  heroTag: null,
                  // Acción a ejecutar al presionar el botón.
                  onPressed: () {
                    // Llama a la función recibida desde el widget padre.
                    widget.onIncrement();
                  },
                  shape: CircleBorder(), // Le da forma circular completa al botón.
                  backgroundColor: AppColors.primary, // Color de fondo del botón.
                  child: Icon(Icons.add, color: Colors.white), // Icono de suma.
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}