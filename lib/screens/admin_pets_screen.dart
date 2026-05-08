import 'package:flutter/material.dart';

class AdminPetsScreen extends StatelessWidget {
  const AdminPetsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8F3EE),

      appBar: AppBar(
        title: const Text(
          "Administrar Mascotas",
        ),
        centerTitle: true,
      ),

      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            ElevatedButton.icon(
              onPressed: () {},
              icon: const Icon(Icons.add),
              label: const Text(
                "Agregar Mascota",
              ),
            ),

            const SizedBox(height: 20),

            Expanded(
              child: ListView(
                children: const [
                  Card(
                    child: ListTile(
                      leading: Icon(Icons.pets),
                      title: Text("Luna"),
                      subtitle: Text("Golden Retriever"),
                    ),
                  ),

                  Card(
                    child: ListTile(
                      leading: Icon(Icons.pets),
                      title: Text("Max"),
                      subtitle: Text("Husky"),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}