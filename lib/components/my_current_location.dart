import 'package:dine_direct/models/restaurant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class MyCurrentLocation extends ConsumerWidget {
  const MyCurrentLocation({super.key});

  void openLocationSearchBox(BuildContext context, WidgetRef ref) {
    TextEditingController textController = TextEditingController();
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Your location'),
        content: TextField(
          controller: textController,
          decoration: const InputDecoration(
            hintText: 'Enter address..',
          ),
        ),
        actions: [
          //cancel button
          MaterialButton(
            onPressed: () {
              Navigator.pop(context);
              textController.clear();
            },
            child: const Text('Cancel'),
          ),

          //save button
          MaterialButton(
            onPressed: () {
              Navigator.pop(context);
              //update delivery address
              ref
                  .read(restaurantProvider)
                  .updateDeliveryAddress(textController.text);
              textController.clear();
            },
            child: const Text('Save'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final String address = ref.watch(restaurantProvider).deliveryAddress;
    return Padding(
      padding: const EdgeInsets.all(25),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Deliver now',
            style: TextStyle(
              color: Theme.of(context).colorScheme.primary,
            ),
          ),
          GestureDetector(
            onTap: () => openLocationSearchBox(context, ref),
            child: Row(
              children: [
                //address
                Text(
                  address,
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.inversePrimary,
                  ),
                ),

                //drop down menu
                const Icon(Icons.keyboard_arrow_down_rounded),
              ],
            ),
          )
        ],
      ),
    );
  }
}
