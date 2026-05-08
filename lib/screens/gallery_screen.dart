import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class GalleryScreen extends StatefulWidget {
  const GalleryScreen({super.key});

  @override
  State<GalleryScreen> createState() =>
      _GalleryScreenState();
}

class _GalleryScreenState
    extends State<GalleryScreen> {
  File? imageFile;

  Future<void> pickImage() async {
    final picker = ImagePicker();

    final pickedImage =
    await picker.pickImage(
      source: ImageSource.gallery,
    );

    if (pickedImage != null) {
      setState(() {
        imageFile = File(
          pickedImage.path,
        );
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:
      const Color(0xFFF8F3EE),

      appBar: AppBar(
        title: const Text("Galería"),
        centerTitle: true,
      ),

      body: Center(
        child: Column(
          mainAxisAlignment:
          MainAxisAlignment.center,
          children: [
            imageFile != null
                ? Image.file(
              imageFile!,
              width: 250,
            )
                : const Text(
              "No hay imagen seleccionada",
            ),

            const SizedBox(height: 20),

            ElevatedButton.icon(
              onPressed: pickImage,
              icon: const Icon(
                Icons.photo,
              ),
              label: const Text(
                "Elegir imagen",
              ),
            ),
          ],
        ),
      ),
    );
  }
}