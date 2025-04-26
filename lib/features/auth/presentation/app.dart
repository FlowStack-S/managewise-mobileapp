import 'package:flutter/material.dart';
import 'login_page.dart';

class ManageWiseApp extends StatelessWidget {
  const ManageWiseApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ManageWise',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.white,
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepOrange),
        useMaterial3: true,
        inputDecorationTheme: const InputDecorationTheme(
          filled: true,
          fillColor: Colors.white, // inputs también blancos (ya combina)
          border: OutlineInputBorder(),
          hintStyle: TextStyle(color: Colors.black54),
          labelStyle: TextStyle(color: Colors.black),
        ),
      ),
      home: const LoginPage(),
    );
  }
}
