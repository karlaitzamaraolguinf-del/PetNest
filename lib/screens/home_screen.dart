import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/auth_provider.dart';
import '../services/auth_service.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final authProvider =
    Provider.of<AuthProvider>(context);

    final authService = AuthService();

    return Scaffold(
      appBar: AppBar(
        title: const Text("PetNest"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            CircleAvatar(
              radius: 45,
              backgroundImage:
              authProvider.photoUrl != null &&
                  authProvider
                      .photoUrl!
                      .isNotEmpty
                  ? NetworkImage(
                authProvider
                    .photoUrl!,
              )
                  : null,
            ),

            const SizedBox(height: 15),

            Text(
              authProvider.userName ??
                  "Usuario",
              style: const TextStyle(
                fontSize: 24,
                fontWeight:
                FontWeight.bold,
              ),
            ),

            const SizedBox(height: 8),

            Text(
              authProvider.email ?? "",
              style: const TextStyle(
                color: Colors.black54,
              ),
            ),

            const SizedBox(height: 40),

            Expanded(
              child: GridView.count(
                crossAxisCount: 2,
                crossAxisSpacing: 15,
                mainAxisSpacing: 15,
                children: [
                  moduleCard(
                    context,
                    Icons.pets,
                    "Adopción",
                    '/adoption',
                  ),
                  moduleCard(
                    context,
                    Icons.store,
                    "Tienda",
                    '/shop',
                  ),
                  moduleCard(
                    context,
                    Icons.camera_alt,
                    "Cámara",
                    '/camera',
                  ),
                  moduleCard(
                    context,
                    Icons.photo,
                    "Galería",
                    '/gallery',
                  ),
                  moduleCard(
                    context,
                    Icons.brush,
                    "Pintar",
                    '/paint',
                  ),
                  moduleCard(
                    context,
                    Icons.person,
                    "Perfil",
                    '/profile',
                  ),
                  moduleCard(
                    context,
                    Icons.link,
                    "Enlaces",
                    '/links',
                  ),
                
                ],
              ),
            ),

            ElevatedButton(
              onPressed: () async {
                await authService.signOut();

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
          ],
        ),
      ),
    );
  }

  Widget moduleCard(
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
          BorderRadius.circular(
            20,
          ),
        ),
        child: Column(
          mainAxisAlignment:
          MainAxisAlignment.center,
          children: [
            Icon(
              icon,
              size: 40,
              color:
              const Color(0xFFC8A27A),
            ),
            const SizedBox(height: 10),
            Text(
              title,
              style: const TextStyle(
                fontWeight:
                FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}