import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart'; // Importa syncfusion_flutter_charts

class StatisticsPage extends StatelessWidget {
  const StatisticsPage({super.key});

  // Datos para el gráfico de barras
  static List<ChartData> _createSampleData() {
    final data = [
      ChartData('Sprint 1', 5),
      ChartData('Sprint 2', 6),
      ChartData('Sprint 3', 7),
      ChartData('Sprint 4', 8),
    ];
    return data;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Statistics'),
        backgroundColor: Colors.orange,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Sprint Progress',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            // Gráfico de Barras usando syncfusion_flutter_charts
            SizedBox(
              height: 300, // Ajuste de altura para el gráfico
              child: SfCartesianChart(
                primaryXAxis: CategoryAxis(),
                series: <CartesianSeries>[
                  BarSeries<ChartData, String>(
                    dataSource: _createSampleData(),
                    xValueMapper: (ChartData sprint, _) => sprint.sprint,
                    yValueMapper: (ChartData sprint, _) => sprint.progress,
                    color: Colors.blue, // Puedes cambiar el color de las barras
                  ),
                ],
              ),
            ),
            const SizedBox(height: 32),
            const Text(
              'Members',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            // Sección de miembros con un GridView que tiene un tamaño fijo
            Container(
              height: 400,  // Establecer una altura fija para evitar el desbordamiento
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  crossAxisSpacing: 16,
                  mainAxisSpacing: 16,
                ),
                itemCount: 8,
                itemBuilder: (context, index) {
                  return Card(
                    color: Colors.orange[100],
                    child: Padding(
                      padding: const EdgeInsets.all(8.0), // Añadir padding interior a los cards
                      child: Column(
                        mainAxisSize: MainAxisSize.min,  // Ajustamos el tamaño del column
                        children: [
                          CircleAvatar(
                            radius: 30,
                            backgroundColor: Colors.grey[300],
                            child: const Icon(Icons.person, size: 40, color: Colors.white),
                          ),
                          const SizedBox(height: 8),
                          // Usamos un Text con un tamaño fijo para asegurar que se vea correctamente
                          Text(
                            'Member ${index + 1}',
                            style: const TextStyle(fontWeight: FontWeight.bold),
                            overflow: TextOverflow.ellipsis,
                            textAlign: TextAlign.center, // Centrado del texto
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// Clase para los datos del gráfico
class ChartData {
  final String sprint;
  final int progress;

  ChartData(this.sprint, this.progress);
}
