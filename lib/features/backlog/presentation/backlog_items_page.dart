import 'backlog_page.dart';
import 'package:flutter/material.dart';

class BacklogItemsPage extends StatelessWidget {
  const BacklogItemsPage({super.key});

  // Generadores de datos dummy
  List<Map<String,String>> get userStories => List.generate(3, (i) => {
    'US#': 'US${i+1}',
    'Título': 'Historia ${i+1}',
    'Descripción': 'Descripción de la historia ${i+1}',
    'Responsable': 'Persona ${i+1}',
    'Estimado': '${(i+1)*2}h',
    'Estado': 'Abierto',
  });

  List<Map<String,String>> get epics => List.generate(3, (i) => {
    'Epic#': 'EP${i+1}',
    'Título': 'Épica ${i+1}',
    'Descripción': 'Descripción de la épica ${i+1}',
    'Responsable': 'Equipo ${i+1}',
    'Estimado': '${(i+1)*5}h',
    'Estado': 'Planificado',
  });

  Widget _buildHorizontalList(List<Map<String,String>> items, List<String> keys) {
    return SizedBox(
      height: 200,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: items.length,
        separatorBuilder: (_, __) => const SizedBox(width: 12),
        itemBuilder: (context, idx) {
          final data = items[idx];
          return Card(
            color: Colors.grey[100],
            child: Container(
              width: 200,
              padding: const EdgeInsets.all(12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  for (var k in keys)
                    Padding(
                      padding: const EdgeInsets.only(bottom: 4),
                      child: Text(
                        '$k: ${data[k]}',
                        style: const TextStyle(fontSize: 14),
                      ),
                    ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Backlog'),
        backgroundColor: Colors.orange,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      // <- Cambiamos Column rígido por ListView
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            // User Stories Section
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text('User Stories',
                    style:
                    TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                ElevatedButton(
                  onPressed: () {
                    // lógica de crear User Story
                  },
                  child: const Text('Create'),
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue),
                ),
              ],
            ),
            const SizedBox(height: 8),
            _buildHorizontalList(userStories, [
              'US#',
              'Título',
              'Descripción',
              'Responsable',
              'Estimado',
              'Estado'
            ]),
            const SizedBox(height: 24),

            // Epics Section
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text('Epics',
                    style:
                    TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                ElevatedButton(
                  onPressed: () {
                    // lógica de crear Epic
                  },
                  child: const Text('Create'),
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.green),
                ),
              ],
            ),
            const SizedBox(height: 8),
            _buildHorizontalList(epics, [
              'Epic#',
              'Título',
              'Descripción',
              'Responsable',
              'Estimado',
              'Estado'
            ]),
          ],
        ),
      ),
    );
  }
}