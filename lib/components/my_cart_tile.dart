import 'package:dine_direct/components/my_quantity_selector.dart';
import 'package:dine_direct/models/cart_item.dart';
import 'package:dine_direct/models/restaurant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class MyCartTile extends ConsumerWidget {
  final CartItem cartItem;
  const MyCartTile({
    super.key,
    required this.cartItem,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.secondary,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
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
                    //food nameF
                    Text(cartItem.food.name),

                    //food price
                    Text(
                      '\$ ${cartItem.food.price}',
                      style: TextStyle(
                        color: Theme.of(context).colorScheme.primary,
                      ),
                    ),
                  ],
                ),
                const Spacer(),

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
            ),
          ),

          //addons
          SizedBox(
            height: cartItem.selectedAddons.isEmpty ? 0 : 60,
            child: ListView(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.only(left: 10, right: 10, bottom: 10),
              children: cartItem.selectedAddons
                  .map(
                    (addon) => Padding(
                      padding: const EdgeInsets.only(right: 10),
                      child: FilterChip(
                        label: Row(
                          children: [
                            //addon name
                            Text(addon.name),

                            //addon price
                            Text(' (\$ ${addon.price})')
                          ],
                        ),
                        onSelected: (value) {},
                        shape: StadiumBorder(
                          side: BorderSide(
                              color: Theme.of(context).colorScheme.primary),
                        ),
                        backgroundColor:
                            Theme.of(context).colorScheme.secondary,
                        labelStyle: TextStyle(
                            color: Theme.of(context).colorScheme.inversePrimary,
                            fontSize: 12),
                      ),
                    ),
                  )
                  .toList(),
            ),
          ),
        ],
      ),
    );
  }
}
