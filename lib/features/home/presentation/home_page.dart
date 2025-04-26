import 'package:flutter/material.dart';
import 'drawer_menu.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Builder(
          builder: (context) => IconButton(
            icon: const Icon(Icons.menu),
            onPressed: () => Scaffold.of(context).openDrawer(),
          ),
        ),
        title: Row(
          children: [
            Image.asset('assets/logo.png', height: 40),
            const SizedBox(width: 10),
            const Text(
              'ManageWise',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
      drawer: const DrawerMenu(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Lema atractivo
              const Text(
                'Optimiza el desarrollo y lidera con ManageWise',
                style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                  color: Colors.orange,
                ),
              ),
              const SizedBox(height: 10),
              const Text(
                'Acelera la colaboración y mantén el control total de proyectos de desarrollo de software.',
                style: TextStyle(fontSize: 18, color: Colors.grey),
              ),
              const SizedBox(height: 40),
              // Beneficios: Tarjetas informativas
              const Text(
                'Beneficios de ManageWise',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 20),
              // Tarjetas informativas de los beneficios
              GridView.count(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                crossAxisCount: 2,
                crossAxisSpacing: 20,
                mainAxisSpacing: 20,
                children: [
                  _buildInfoCard(
                    icon: Icons.group,
                    title: 'Colaboración Eficaz',
                    description:
                    'Mejora la colaboración entre equipos con herramientas intuitivas.',
                    color: Colors.blue,
                  ),
                  _buildInfoCard(
                    icon: Icons.autorenew,
                    title: 'Automatización de Tareas',
                    description:
                    'Reduce el tiempo invertido en tareas repetitivas mediante automatización.',
                    color: Colors.green,
                  ),
                  _buildInfoCard(
                    icon: Icons.analytics,
                    title: 'Análisis Predictivo',
                    description:
                    'Toma decisiones informadas con análisis de datos avanzados.',
                    color: Colors.orange,
                  ),
                  _buildInfoCard(
                    icon: Icons.settings,
                    title: 'Personalización Total',
                    description:
                    'Adapta ManageWise a las necesidades de tu empresa con configuraciones flexibles.',
                    color: Colors.purple,
                  ),
                ],
              ),
              const SizedBox(height: 40),
              // Misión en tarjeta
              _buildInfoCard(
                icon: Icons.business,
                title: 'Nuestra Misión',
                description:
                'Nuestra misión es elevar la eficiencia, calidad y rentabilidad de los proyectos en startups pequeñas de desarrollo de software mediante la optimización de sus procesos de gestión de iniciativas.',
                color: Colors.teal,
              ),
              const SizedBox(height: 20),
              // Visión en tarjeta
              _buildInfoCard(
                icon: Icons.visibility,
                title: 'Nuestra Visión',
                description:
                'Aspiramos a convertirnos en el referente principal en la optimización de la gestión de proyectos para startups de desarrollo de software, siendo reconocidos por nuestras soluciones innovadoras y nuestra capacidad para transformar empresas.',
                color: Colors.deepPurple,
              ),
              const SizedBox(height: 40),
              // Sección "Contáctenos"
              const Text(
                'Contáctenos',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 20),
              // Formulario de contacto
              _buildContactForm(),
              const SizedBox(height: 40),
              // Footer con enlaces y derechos de autor
              const Divider(),
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    '© 2025 ManageWise. Todos los derechos reservados.',
                    style: TextStyle(fontSize: 12, color: Colors.grey),
                  ),
                ],
              ),
              const SizedBox(height: 10),
            ],
          ),
        ),
      ),
    );
  }

  // Función para construir las tarjetas (Beneficios, Misión, Visión)
  Widget _buildInfoCard({
    required IconData icon,
    required String title,
    required String description,
    required Color color,
  }) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            spreadRadius: 2,
            blurRadius: 10,
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: 50, color: color),
            const SizedBox(height: 15),
            Text(
              title,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: color,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 10),
            Text(
              description,
              style: const TextStyle(fontSize: 14, color: Colors.grey),
              textAlign: TextAlign.center,
              overflow: TextOverflow.ellipsis,
              maxLines: 3, // Limitar el número de líneas
            ),
          ],
        ),
      ),
    );
  }

  // Función para crear el formulario de contacto
  Widget _buildContactForm() {
    return Column(
      children: [
        // Nombre
        TextField(
          decoration: const InputDecoration(
            labelText: 'Nombre',
            border: OutlineInputBorder(),
            prefixIcon: Icon(Icons.person),
          ),
        ),
        const SizedBox(height: 20),
        // Correo
        TextField(
          decoration: const InputDecoration(
            labelText: 'Correo Electrónico',
            border: OutlineInputBorder(),
            prefixIcon: Icon(Icons.email),
          ),
        ),
        const SizedBox(height: 20),
        // Mensaje
        TextField(
          maxLines: 4,
          decoration: const InputDecoration(
            labelText: 'Mensaje',
            border: OutlineInputBorder(),
            prefixIcon: Icon(Icons.message),
          ),
        ),
        const SizedBox(height: 20),
        // Botón Enviar
        ElevatedButton(
          onPressed: () {
            // Acción para enviar mensaje
          },
          style: ElevatedButton.styleFrom(
            padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
            backgroundColor: Colors.orange, // Corrected from 'primary' to 'backgroundColor'
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          child: const Text(
            'Enviar Mensaje',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
        ),
      ],
    );
  }
}
