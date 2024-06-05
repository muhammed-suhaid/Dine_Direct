import 'package:dine_direct/models/cart_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class MyCartTile extends StatelessWidget {
  final CartItem cartItem;
  const MyCartTile({
    super.key,
    required this.cartItem,
  });

  @override
  Widget build(BuildContext context) {
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
          ],
        )
      ],
    );
  }
}
