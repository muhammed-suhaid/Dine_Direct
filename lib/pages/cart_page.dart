import 'package:dine_direct/components/my_cart_tile.dart';
import 'package:dine_direct/models/restaurant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CartPage extends ConsumerWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    //user cart
    final userCart = ref.watch(restaurantProvider).cart;
    //scaffold UI
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cart'),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        foregroundColor: Theme.of(context).colorScheme.inversePrimary,
        actions: [
          userCart.isNotEmpty
              ? IconButton(
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (context) => AlertDialog(
                        title: const Text(
                            'Are you sure you want to clear the cart?'),
                        actions: [
                          //cancel button
                          TextButton(
                            onPressed: () => Navigator.pop(context),
                            child: const Text('Cancel'),
                          ),

                          //yes button
                          TextButton(
                            onPressed: () {
                              Navigator.pop(context);
                              ref.read(restaurantProvider).clearCart();
                            },
                            child: const Text('yes'),
                          ),
                        ],
                      ),
                    );
                  },
                  icon: const Icon(Icons.delete),
                )
              : const SizedBox(),
        ],
      ),
      body: userCart.isEmpty
          ? const Center(
              child: Text('No item in cart..'),
            )
          : Column(
              children: [
                Expanded(
                  child: ListView.builder(
                    itemCount: userCart.length,
                    itemBuilder: (context, index) {
                      //get individual cart item
                      final cartItem = userCart[index];

                      //return cart tile
                      return MyCartTile(cartItem: cartItem);
                    },
                  ),
                ),
              ],
            ),
    );
  }
}
