import 'package:flutter/material.dart';

class AdminUsersScreen extends StatelessWidget {
  const AdminUsersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8F3EE),

      appBar: AppBar(
        title: const Text(
          "Usuarios",
        ),
        centerTitle: true,
      ),

      body: ListView(
        padding: const EdgeInsets.all(20),
        children: const [
          Card(
            child: ListTile(
              leading: Icon(Icons.person),
              title: Text("usuario@gmail.com"),
              subtitle: Text("Cliente"),
            ),
          ),

          Card(
            child: ListTile(
              leading: Icon(Icons.admin_panel_settings),
              title: Text("admin@gmail.com"),
              subtitle: Text("Administrador"),
            ),
          ),
        ],
      ),
    );
  }
}