import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class CameraScreen extends StatefulWidget {
  const CameraScreen({super.key});

  @override
  State<CameraScreen> createState() =>
      _CameraScreenState();
}

class _CameraScreenState
    extends State<CameraScreen> {
  File? imageFile;

  Future<void> takePhoto() async {
    final picker = ImagePicker();

    final pickedImage =
    await picker.pickImage(
      source: ImageSource.camera,
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
        title: const Text("Cámara"),
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
              "No hay imagen",
            ),

            const SizedBox(height: 20),

            ElevatedButton.icon(
              onPressed: takePhoto,
              icon: const Icon(
                Icons.camera_alt,
              ),
              label: const Text(
                "Tomar foto",
              ),
            ),
          ],
        ),
      ),
    );
  }
}