import 'package:dine_direct/components/my_quantity_selector.dart';
import 'package:dine_direct/models/cart_item.dart';
import 'package:dine_direct/models/restaurant.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class MyCartTile extends ConsumerWidget {
  final CartItem cartItem;
  const MyCartTile({
    super.key,
    required this.cartItem,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      children: [
        Row(
          children: [
            //food image
            ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Image.asset(
                cartItem.food.imagePath,
                height: 100,
              ),
            ),

            const SizedBox(width: 10),

            //name and price
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                //food name
                Text(cartItem.food.name),

                //food price
                Text('\$ ${cartItem.food.price}'),
              ],
            ),

            //increment or decrement quantity
            QuantitySelector(
              quantity: cartItem.quantity,
              food: cartItem.food,
              onIncrement: () {
                ref
                    .watch(restaurantProvider)
                    .addToCart(cartItem.food, cartItem.selectedAddons);
              },
              onDecrement: () {
                ref.watch(restaurantProvider).removeFromCart(cartItem);
              },
            ),
          ],
        )
      ],
    );
  }
}
