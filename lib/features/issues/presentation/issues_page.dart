import 'package:flutter/material.dart';

class IssuesPage extends StatefulWidget {
  const IssuesPage({super.key});

  @override
  State<IssuesPage> createState() => _IssuesPageState();
}

class _IssuesPageState extends State<IssuesPage> {
  final TextEditingController _searchController = TextEditingController();
  List<Map<String, String>> _allIssues = List.generate(5, (i) => {
    'title': 'Error al procesar pagos con tarjeta de crédito ${i + 1}',
    'id': '${i + 1}',
    'estado': 'Nueva',
    'prioridad': 'Alta',
    'asignado': 'Equipo Backend',
    'fecha': '2025-04-2${i + 1}',
  });
  List<Map<String, String>> _filteredIssues = [];

  @override
  void initState() {
    super.initState();
    _filteredIssues = List.from(_allIssues);
    _searchController.addListener(_onSearchChanged);
  }

  void _onSearchChanged() {
    final query = _searchController.text.toLowerCase();
    setState(() {
      _filteredIssues = _allIssues
          .where((issue) =>
      issue['title']!.toLowerCase().contains(query) ||
          issue['id']!.contains(query))
          .toList();
    });
  }

  @override
  void dispose() {
    _searchController.removeListener(_onSearchChanged);
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Issues'),
        backgroundColor: Colors.orange,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // Barra de búsqueda
            TextField(
              controller: _searchController,
              decoration: InputDecoration(
                hintText: 'Buscar...',
                prefixIcon: const Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                contentPadding: const EdgeInsets.symmetric(vertical: 0, horizontal: 12),
              ),
            ),
            const SizedBox(height: 16),
            // Lista de issues
            Expanded(
              child: _filteredIssues.isEmpty
                  ? const Center(child: Text('No se encontraron issues.'))
                  : ListView.builder(
                itemCount: _filteredIssues.length,
                itemBuilder: (context, index) {
                  final issue = _filteredIssues[index];
                  return Card(
                    margin: const EdgeInsets.only(bottom: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    color: Colors.grey[100],
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // Título
                          Text(
                            issue['title']!,
                            style: const TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(height: 8),
                          // Detalles
                          Text('ID: ${issue['id']}'),
                          Text('Estado: ${issue['estado']}'),
                          Text('Prioridad: ${issue['prioridad']}'),
                          Text('Asignado a: ${issue['asignado']}'),
                          Text('Fecha de creación: ${issue['fecha']}'),
                          const SizedBox(height: 12),
                          // Botones
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              TextButton.icon(
                                onPressed: () {
                                  // editar acción
                                },
                                icon: const Icon(Icons.edit, size: 20),
                                label: const Text('Editar'),
                                style: TextButton.styleFrom(
                                  foregroundColor: Colors.grey[800],
                                ),
                              ),
                              const SizedBox(width: 8),
                              TextButton.icon(
                                onPressed: () {
                                  // borrar acción
                                },
                                icon: const Icon(Icons.delete, size: 20),
                                label: const Text('Delete'),
                                style: TextButton.styleFrom(
                                  foregroundColor: Colors.black,
                                ),
                              ),
                            ],
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
