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
      body: Column(
        children: [
          MyReceipt(),
        ],
      ),
    );
  }
}
