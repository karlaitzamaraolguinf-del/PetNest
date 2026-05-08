import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/cart_provider.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final cartProvider =
    Provider.of<CartProvider>(context);

    return Scaffold(
      backgroundColor: const Color(0xFFF8F3EE),

      appBar: AppBar(
        title: const Text("Carrito"),
        centerTitle: true,
      ),

      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount:
                cartProvider.cart.length,
                itemBuilder: (context, index) {
                  final item =
                  cartProvider.cart[index];

                  return Card(
                    child: ListTile(
                      leading: Image.network(
                        item["image"],
                        width: 50,
                        fit: BoxFit.cover,
                      ),
                      title: Text(
                        item["name"],
                      ),
                      subtitle: Text(
                        "\$${item["price"]}",
                      ),
                      trailing: IconButton(
                        onPressed: () {
                          cartProvider
                              .removeFromCart(
                            index,
                          );
                        },
                        icon: const Icon(
                          Icons.delete,
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),

            const SizedBox(height: 20),

            Text(
              "Total: \$${cartProvider.total}",
              style: const TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 20),

            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(
                    context,
                    '/receipt',
                  );
                },
                child: const Text(
                  "Finalizar compra",
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}