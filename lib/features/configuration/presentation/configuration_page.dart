// lib/features/configuration/presentation/configuration_page.dart
import 'package:flutter/material.dart';

class ConfigurationPage extends StatelessWidget {
  const ConfigurationPage({super.key});

  void _logout(BuildContext context) {
    // Aquí aquí añadir lógica de logout (limpiar tokens, etc.)
    // Luego navegar a la pantalla de login y limpiar el historial:
    Navigator.pushNamedAndRemoveUntil(context, '/login', (route) => false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Configuration'),
        backgroundColor: Colors.orange,
      ),
      body: ListView(
        children: [
          const SizedBox(height: 16),
          // Opción 1 (no funcional)
          ListTile(
            leading: const Icon(Icons.person),
            title: const Text('Profile'),
            onTap: () {
              // futura funcionalidad
            },
          ),
          const Divider(),

          // Opción 2 (no funcional)
          ListTile(
            leading: const Icon(Icons.notifications),
            title: const Text('Notifications'),
            onTap: () {
              // futura funcionalidad
            },
          ),
          const Divider(),

          // Opción 3 (no funcional)
          ListTile(
            leading: const Icon(Icons.palette),
            title: const Text('Theme'),
            onTap: () {
              // futura funcionalidad
            },
          ),
          const Divider(),

          // Salir (funcional)
          ListTile(
            leading: const Icon(Icons.exit_to_app, color: Colors.red),
            title: const Text('Salir', style: TextStyle(color: Colors.red)),
            onTap: () => _logout(context),
          ),
        ],
      ),
    );
  }
}
