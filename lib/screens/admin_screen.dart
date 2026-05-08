import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/auth_provider.dart';

class AdminScreen extends StatelessWidget {
  const AdminScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final authProvider =
    Provider.of<AuthProvider>(context);

    return Scaffold(
      backgroundColor:
      const Color(0xFFF8F3EE),

      appBar: AppBar(
        title: const Text(
          "Panel Administrador",
        ),
        centerTitle: true,
      ),

      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment:
          CrossAxisAlignment.start,
          children: [
            const Text(
              "Bienvenido Admin 🐾",
              style: TextStyle(
                fontSize: 26,
                fontWeight:
                FontWeight.bold,
              ),
            ),

            const SizedBox(height: 10),

            Text(
              "Rol actual: ${authProvider.role}",
              style: const TextStyle(
                color: Colors.black54,
              ),
            ),

            const SizedBox(height: 30),

            Expanded(
              child: GridView.count(
                crossAxisCount: 2,
                crossAxisSpacing: 15,
                mainAxisSpacing: 15,
                children: [
                  adminCard(
                    context,
                    Icons.pets,
                    "Mascotas",
                    '/admin-pets',
                  ),

                  adminCard(
                    context,
                    Icons.store,
                    "Productos",
                    '/admin-products',
                  ),

                  adminCard(
                    context,
                    Icons.favorite,
                    "Adopciones",
                    '/admin-adoptions',
                  ),

                  adminCard(
                    context,
                    Icons.people,
                    "Usuarios",
                    '/admin-users',
                  ),
                ],
              ),
            ),

            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  authProvider.logout();

                  Navigator.pushReplacementNamed(
                    context,
                    '/login',
                  );
                },
                child: const Text(
                  "Cerrar sesión",
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget adminCard(
      BuildContext context,
      IconData icon,
      String title,
      String route,
      ) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(
          context,
          route,
        );
      },
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius:
          BorderRadius.circular(20),
          boxShadow: const [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 5,
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment:
          MainAxisAlignment.center,
          children: [
            Icon(
              icon,
              size: 45,
              color:
              const Color(0xFFC8A27A),
            ),

            const SizedBox(height: 10),

            Text(
              title,
              style: const TextStyle(
                fontWeight:
                FontWeight.bold,
                fontSize: 16,
              ),
            ),
          ],
        ),
      ),
    );
  }
}