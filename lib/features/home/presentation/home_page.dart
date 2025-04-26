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
            const Text('ManageWise')
          ],
        ),
      ),
      drawer: const DrawerMenu(),
      body: const Center(child: Text('Welcome to ManageWise!')),
    );
  }
}