import 'package:dine_direct/components/my_current_location.dart';
import 'package:dine_direct/components/my_description_box.dart';
import 'package:dine_direct/components/my_drawer.dart';
import 'package:dine_direct/components/my_sliver_appbar.dart';
import 'package:dine_direct/components/my_tab_bar.dart';
import 'package:dine_direct/models/food.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  //tabBar controller
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController =
        TabController(length: FoodCategory.values.length, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.secondary,
      drawer: const MyDrawer(),
      body: NestedScrollView(
        headerSliverBuilder: (context, innerBoxIsScrolled) => [
          MySliverAppBar(
            title: MyTabBar(
              tabController: _tabController,
            ),
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
                const MyDescriptionBox()
              ],
            ),
          ),
        ],
        body: TabBarView(
          controller: _tabController,
          children: [
            Text('Hello1'),
            Text('Hello2'),
            Text('Hello3'),
            Text('Hello4'),
            Text('Hello5'),
          ],
        ),
      ),
    );
  }
}
