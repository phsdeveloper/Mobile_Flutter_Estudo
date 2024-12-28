import 'package:flutter/material.dart';
import '../components/main_drawer.dart';
class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Configuracoes'),
      ),
      drawer: const MainDrawer(),
      body: const Center(child: Text('config') ),
    );
  }
}