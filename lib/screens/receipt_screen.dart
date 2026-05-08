import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/cart_provider.dart';

class ReceiptScreen extends StatelessWidget {
  const ReceiptScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final cartProvider =
    Provider.of<CartProvider>(context);

    return Scaffold(
      backgroundColor: const Color(0xFFF8F3EE),

      appBar: AppBar(
        title: const Text("Recibo"),
        centerTitle: true,
      ),

      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            Image.asset(
              'assets/icons/paw.png',
              width: 100,
            ),

            const SizedBox(height: 20),

            const Text(
              "PetNest",
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 30),

            Expanded(
              child: ListView.builder(
                itemCount:
                cartProvider.cart.length,
                itemBuilder: (context, index) {
                  final item =
                  cartProvider.cart[index];

                  return ListTile(
                    title: Text(
                      item["name"],
                    ),
                    trailing: Text(
                      "\$${item["price"]}",
                    ),
                  );
                },
              ),
            ),

            const Divider(),

            Text(
              "Total: \$${cartProvider.total}",
              style: const TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 20),

            Text(
              "Fecha: ${DateTime.now()}",
            ),

            const SizedBox(height: 20),

            const Text(
              "Gracias por tu compra 🐾",
            ),
          ],
        ),
      ),
    );
  }
}