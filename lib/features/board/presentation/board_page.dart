// lib/features/board/presentation/board_page.dart
import 'package:flutter/material.dart';

class BoardPage extends StatelessWidget {
  const BoardPage({super.key});

  // Datos dummy
  List<Map<String, String>> get _toDoStories => List.generate(5, (i) => {
    'US#': 'US${i + 1}',
    'Título': 'Historia ${i + 1}',
    'Descripción': 'Descripción breve ${i + 1}',
    'Responsable': 'Dev ${i + 1}',
    'Estimado': '${(i + 1) * 2}h',
    'Estado': 'To-Do',
  });

  List<Map<String, String>> get _inProgressStories => List.generate(3, (i) => {
    'US#': 'US${i + 6}',
    'Título': 'Historia ${i + 6}',
    'Descripción': 'Descripción breve ${i + 6}',
    'Responsable': 'Dev ${i + 6}',
    'Estimado': '${(i + 1) * 3}h',
    'Estado': 'In-Progress',
  });

  List<Map<String, String>> get _doneStories => List.generate(4, (i) => {
    'US#': 'US${i + 9}',
    'Título': 'Historia ${i + 9}',
    'Descripción': 'Descripción breve ${i + 9}',
    'Responsable': 'Dev ${i + 9}',
    'Estimado': '${(i + 1) * 1}h',
    'Estado': 'Done',
  });

  Widget _buildColumn(String title, List<Map<String, String>> stories) {
    return Container(
      width: 300, // ancho fijo para cada columna
      margin: const EdgeInsets.only(right: 16.0),
      padding: const EdgeInsets.all(12.0),
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        children: [
          Text(
            title,
            style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),
          Expanded(
            child: ListView.builder(
              itemCount: stories.length,
              itemBuilder: (context, idx) {
                final story = stories[idx];
                return Card(
                  margin: const EdgeInsets.only(bottom: 12),
                  child: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Stack(
                      children: [
                        // Detalles de la historia
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              story['US#']!,
                              style: const TextStyle(fontWeight: FontWeight.bold),
                            ),
                            const SizedBox(height: 4),
                            Text(
                              story['Título']!,
                              style: const TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.w600),
                            ),
                            const SizedBox(height: 4),
                            Text('Descripción: ${story['Descripción']!}'),
                            const SizedBox(height: 4),
                            Text('Responsable: ${story['Responsable']!}'),
                            const SizedBox(height: 4),
                            Text('Estimado: ${story['Estimado']!}'),
                            const SizedBox(height: 4),
                            Text('Estado: ${story['Estado']!}'),
                          ],
                        ),
                        // Botón borrar (arriba derecha)
                        Positioned(
                          top: 0,
                          right: 0,
                          child: IconButton(
                            icon: const Icon(Icons.close, size: 20),
                            onPressed: () {
                              // TODO: borrar acción
                            },
                          ),
                        ),
                        // Botón editar (abajo derecha)
                        Positioned(
                          bottom: 0,
                          right: 0,
                          child: IconButton(
                            icon: const Icon(Icons.edit, size: 20),
                            onPressed: () {
                              // TODO: editar acción
                            },
                          ),
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
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Board'),
        backgroundColor: Colors.orange,
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal, // permite el scroll horizontal
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildColumn('To-Do', _toDoStories),
              _buildColumn('In-Progress', _inProgressStories),
              _buildColumn('Done', _doneStories),
            ],
          ),
        ),
      ),
    );
  }
}
