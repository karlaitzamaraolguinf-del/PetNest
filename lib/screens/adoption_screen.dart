import 'package:flutter/material.dart';

class AdoptionScreen extends StatelessWidget {
  const AdoptionScreen({super.key});

  final List<Map<String, String>> pets = const [
    {"name": "Max", "age": "2 años"},
    {"name": "Luna", "age": "1 año"},
    {"name": "Rocky", "age": "3 años"},
    {"name": "Milo", "age": "6 meses"},
    {"name": "Bella", "age": "4 años"},
    {"name": "Coco", "age": "1 año"},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8F3EE),
      appBar: AppBar(
        title: const Text("Adopción"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: GridView.builder(
          itemCount: pets.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 12,
            mainAxisSpacing: 12,
            childAspectRatio: 0.72, // 👈 ajustado para evitar overflow
          ),
          itemBuilder: (context, index) {
            final pet = pets[index];
            final imageName = pet["name"]!.toLowerCase();

            return Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(18),
                boxShadow: const [
                  BoxShadow(
                    color: Colors.black12,
                    blurRadius: 4,
                    offset: Offset(0, 2),
                  ),
                ],
              ),
              child: Column(
                children: [
                  Expanded(
                    flex: 6,
                    child: ClipRRect(
                      borderRadius: const BorderRadius.vertical(
                        top: Radius.circular(18),
                      ),
                      child: Image.asset(
                        'assets/images/$imageName.png',
                        fit: BoxFit.cover,
                        width: double.infinity,
                      ),
                    ),
                  ),

                  Expanded(
                    flex: 4,
                    child: Padding(
                      padding: const EdgeInsets.all(6),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            pet["name"]!,
                            style: const TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 2),
                          Text(
                            pet["age"]!,
                            style: const TextStyle(
                              fontSize: 12,
                              color: Colors.black54,
                            ),
                          ),
                          const SizedBox(height: 6),

                          SizedBox(
                            width: double.infinity,
                            height: 30,
                            child: ElevatedButton(
                              onPressed: () {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    content: Text(
                                      "Adoptaste a ${pet["name"]}",
                                    ),
                                  ),
                                );
                              },
                              child: const Text(
                                "Adoptar",
                                style: TextStyle(fontSize: 11),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}