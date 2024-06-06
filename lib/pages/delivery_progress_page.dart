import 'package:dine_direct/components/my_receipt.dart';
import 'package:flutter/material.dart';

class DeliveryProgresspage extends StatelessWidget {
  const DeliveryProgresspage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Delivery in progress..'),
        backgroundColor: Colors.transparent,
        centerTitle: true,
      ),
      body: const Column(
        children: [
          MyReceipt(),
        ],
      ),
      bottomNavigationBar: _buildBottomNavBar(context),
    );
  }

  //custom Bottom Nav Bar- Message delivery driver
  Widget _buildBottomNavBar(BuildContext context) {
    return Container(
      height: 100,
      padding: const EdgeInsets.all(25),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.secondary,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(40),
          topRight: Radius.circular(40),
        ),
      ),
      child: Row(
        children: [
          //profile picture of driver
          Container(
            decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.background,
                shape: BoxShape.circle),
            child: IconButton(
              onPressed: () {},
              icon: const Icon(Icons.person),
            ),
          ),

          const SizedBox(width: 10),

          //driver details
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Driver Name',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                  color: Theme.of(context).colorScheme.inversePrimary,
                ),
              ),
              Text(
                'Driver',
                style: TextStyle(
                  color: Theme.of(context).colorScheme.primary,
                ),
              ),
            ],
          ),

          const Spacer(),

          Row(
            children: [
              //message button
              IconButton(
                onPressed: () {},
                icon: const Icon(Icons.message),
                color: Colors.blue,
              ),

              //call button
              IconButton(
                onPressed: () {},
                icon: const Icon(Icons.call),
                color: Colors.green,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
