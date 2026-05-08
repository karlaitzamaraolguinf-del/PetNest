import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/auth_provider.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final authProvider =
    Provider.of<AuthProvider>(context);

    return Scaffold(
      backgroundColor: const Color(0xFFF8F3EE),

      appBar: AppBar(
        title: const Text("Mi Perfil"),
        centerTitle: true,
      ),

      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            CircleAvatar(
              radius: 60,
              backgroundImage:
              authProvider.photoUrl != null &&
                  authProvider
                      .photoUrl!
                      .isNotEmpty
                  ? NetworkImage(
                authProvider.photoUrl!,
              )
                  : null,
            ),

            const SizedBox(height: 20),

            Text(
              authProvider.userName ??
                  "Sin nombre",
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 10),

            Text(
              authProvider.email ??
                  "Sin correo",
              style: const TextStyle(
                color: Colors.black54,
                fontSize: 16,
              ),
            ),

            const SizedBox(height: 30),

            profileCard(
              "Rol",
              authProvider.role ?? "N/A",
            ),

            profileCard(
              "Estado",
              "Activo",
            ),

            profileCard(
              "Mascotas adoptadas",
              "0",
            ),
          ],
        ),
      ),
    );
  }

  Widget profileCard(
      String title,
      String value,
      ) {
    return Container(
      width: double.infinity,
      margin:
      const EdgeInsets.symmetric(
        vertical: 8,
      ),
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius:
        BorderRadius.circular(15),
      ),
      child: Row(
        mainAxisAlignment:
        MainAxisAlignment.spaceBetween,
        children: [
          Text(title),
          Text(
            value,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}