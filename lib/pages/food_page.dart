import 'package:dine_direct/components/my_button.dart';
import 'package:dine_direct/models/food.dart';
import 'package:flutter/material.dart';

class FoodPage extends StatefulWidget {
  final Food food;

  const FoodPage({
    super.key,
    required this.food,
  });

  @override
  State<FoodPage> createState() => _FoodPageState();
}

class _FoodPageState extends State<FoodPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          children: [
            //food image
            Image.asset(widget.food.imagePath),

            Padding(
              padding: const EdgeInsets.all(25),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  //food name
                  Text(
                    widget.food.name,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),

                  //food Price
                  Text(
                    '\$ ${widget.food.price.toString()}',
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.primary,
                      fontSize: 16,
                    ),
                  ),

                  const SizedBox(height: 10),

                  //food description
                  Text(widget.food.description),

                  const SizedBox(height: 10),
                  Divider(color: Theme.of(context).colorScheme.tertiary),
                  const SizedBox(height: 10),

                  //addons
                  Text(
                    'Add-ons',
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.inversePrimary,
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),

                  const SizedBox(height: 10),

                  Container(
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Theme.of(context).colorScheme.tertiary,
                      ),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: ListView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      padding: EdgeInsets.zero,
                      itemCount: widget.food.availableAddons.length,
                      itemBuilder: (context, index) {
                        //get individual addon
                        Addon addon = widget.food.availableAddons[index];

                        //check box
                        return CheckboxListTile(
                          title: Text(addon.name),
                          subtitle: Text(
                            '\$ ${addon.price}',
                            style: TextStyle(
                              color: Theme.of(context).colorScheme.primary,
                            ),
                          ),
                          value: false,
                          onChanged: (value) {},
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),

            //btton -> add to cart
            MyButton(
              onTap: () {},
              text: 'Add to cart',
            ),

            const SizedBox(height: 25),
          ],
        ),
      ),
    );
  }
}
