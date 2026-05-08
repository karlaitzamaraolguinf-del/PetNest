import 'package:flutter/material.dart';

class AdminAdoptionsScreen extends StatelessWidget {
  const AdminAdoptionsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8F3EE),

      appBar: AppBar(
        title: const Text(
          "Adopciones",
        ),
        centerTitle: true,
      ),

      body: ListView(
        padding: const EdgeInsets.all(20),
        children: const [
          Card(
            child: ListTile(
              leading: Icon(Icons.favorite),
              title: Text("Solicitud de Luna"),
              subtitle: Text("Pendiente"),
            ),
          ),

          Card(
            child: ListTile(
              leading: Icon(Icons.favorite),
              title: Text("Solicitud de Max"),
              subtitle: Text("Aprobada"),
            ),
          ),
        ],
      ),
    );
  }
}