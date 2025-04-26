import 'package:flutter/material.dart';

class MembersPage extends StatelessWidget {
   MembersPage({super.key});

  // Simulamos una lista de miembros como ejemplo
  final List<Map<String, String>> members = [
    {
      'name': 'Carlos Pérez',
      'role': 'Desarrollador Frontend',
      'email': 'carlos.perez@email.com',
      'address': 'Madrid, España',
    },
    {
      'name': 'Ana Martínez',
      'role': 'Gerente de Proyectos',
      'email': 'ana.martinez@email.com',
      'address': 'Barcelona, España',
    },
    {
      'name': 'Juan Gómez',
      'role': 'Desarrollador Backend',
      'email': 'juan.gomez@email.com',
      'address': 'Sevilla, España',
    },
    {
      'name': 'Marta Fernández',
      'role': 'Diseñadora UX/UI',
      'email': 'marta.fernandez@email.com',
      'address': 'Valencia, España',
    },
    {
      'name': 'Pedro López',
      'role': 'Administrador de Sistemas',
      'email': 'pedro.lopez@email.com',
      'address': 'Zaragoza, España',
    },
    {
      'name': 'Elena García',
      'role': 'Marketing Digital',
      'email': 'elena.garcia@email.com',
      'address': 'Madrid, España',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Members'),
        backgroundColor: Colors.orange,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Barra de búsqueda
            const TextField(
              decoration: InputDecoration(
                labelText: 'Search Members',
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 20),

            // Lista de miembros
            Expanded(
              child: ListView.builder(
                itemCount: members.length,
                itemBuilder: (context, index) {
                  return Card(
                    elevation: 4,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    margin: const EdgeInsets.only(bottom: 10),
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // Información del miembro
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Name: ${members[index]['name']}',
                                  style: const TextStyle(
                                      fontSize: 16, fontWeight: FontWeight.bold),
                                ),
                                Text('Role: ${members[index]['role']}'),
                                Text('Email: ${members[index]['email']}'),
                                Text('Address: ${members[index]['address']}'),
                              ],
                            ),
                          ),
                          // Botón Eliminar
                          IconButton(
                            icon: const Icon(Icons.delete, color: Colors.red),
                            onPressed: () {
                              // Lógica para eliminar miembro
                              // Puedes implementar la eliminación desde la lista
                            },
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
      // Barra de navegación inferior
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.orange,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.black,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.list),
            label: 'Tasks',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.people),
            label: 'Members',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Settings',
          ),
        ],
      ),
      // Botón "Add Member"
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Lógica para agregar un nuevo miembro
        },
        backgroundColor: Colors.orange,
        child: const Icon(Icons.add),
      ),
    );
  }
}
