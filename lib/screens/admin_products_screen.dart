import 'package:flutter/material.dart';

class AdminProductsScreen extends StatelessWidget {
  const AdminProductsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8F3EE),

      appBar: AppBar(
        title: const Text(
          "Administrar Productos",
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
                "Agregar Producto",
              ),
            ),

            const SizedBox(height: 20),

            Expanded(
              child: ListView(
                children: const [
                  Card(
                    child: ListTile(
                      leading: Icon(Icons.pets),
                      title: Text("Croquetas Premium"),
                      subtitle: Text("\$350"),
                    ),
                  ),

                  Card(
                    child: ListTile(
                      leading: Icon(Icons.pets),
                      title: Text("Juguete para perro"),
                      subtitle: Text("\$120"),
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