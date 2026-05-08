import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class LinksScreen extends StatelessWidget {
  const LinksScreen({super.key});

  Future<void> openUrl(
      BuildContext context,
      String url,
      ) async {
    final Uri uri = Uri.parse(url);

    if (!await launchUrl(
      uri,
      mode:
      LaunchMode.externalApplication,
    )) {
      ScaffoldMessenger.of(context)
          .showSnackBar(
        const SnackBar(
          content: Text(
            "No se pudo abrir el enlace",
          ),
        ),
      );
    }
  }

  Widget linkButton(
      BuildContext context,
      String title,
      String url,
      IconData icon,
      ) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton.icon(
        onPressed: () async {
          await openUrl(
            context,
            url,
          );
        },
        icon: Icon(icon),
        label: Text(title),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:
      const Color(0xFFF8F3EE),

      appBar: AppBar(
        title: const Text(
          "Enlaces útiles",
        ),
        centerTitle: true,
      ),

      body: Padding(
        padding:
        const EdgeInsets.all(20),
        child: Column(
          children: [
            linkButton(
              context,
              "Veterinarias",
              "https://www.google.com/maps",
              Icons.local_hospital,
            ),

            const SizedBox(height: 15),

            linkButton(
              context,
              "Refugios",
              "https://www.google.com",
              Icons.home,
            ),

            const SizedBox(height: 15),

            linkButton(
              context,
              "Tienda PetNest",
              "https://flutter.dev",
              Icons.store,
            ),
          ],
        ),
      ),
    );
  }

}