import 'package:dine_direct/components/my_current_location.dart';
import 'package:dine_direct/components/my_description_box.dart';
import 'package:dine_direct/components/my_drawer.dart';
import 'package:dine_direct/components/my_sliver_appbar.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      // appBar: AppBar(
      //   title: const Text('Home'),
      //   centerTitle: true,
      //   backgroundColor: Theme.of(context).colorScheme.background,
      // ),
      drawer: const MyDrawer(),
      body: NestedScrollView(
        headerSliverBuilder: (context, innerBoxIsScrolled) => [
          MySliverAppBar(
            title: Text('title'),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Divider(
                  indent: 25,
                  endIndent: 25,
                  color: Theme.of(context).colorScheme.secondary,
                ),
                //my current location
                const MyCurrentLocation(),

                //description box
                MyDescriptionBox()
              ],
            ),
          ),
        ],
        body: Container(
          color: Colors.blue,
        ),
      ),
    );
  }
}
