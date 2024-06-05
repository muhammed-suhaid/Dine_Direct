import 'package:dine_direct/components/my_current_location.dart';
import 'package:dine_direct/components/my_description_box.dart';
import 'package:dine_direct/components/my_drawer.dart';
import 'package:dine_direct/components/my_sliver_appbar.dart';
import 'package:dine_direct/components/my_tab_bar.dart';
import 'package:dine_direct/models/food.dart';
import 'package:dine_direct/models/restaurant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

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

  //sort out and return a list of food items that belong to a specific category
  List<Food> _filterMenuByCategory(FoodCategory category, List<Food> fullMenu) {
    return fullMenu.where((food) => food.category == category).toList();
  }

  //return list of foods in given category
  List<Widget> getFoodinThisCategory(List<Food> fullMenu) {
    return FoodCategory.values.map((category) {
      List<Food> categoryMenu = _filterMenuByCategory(category, fullMenu);
      return ListView.builder(
          itemCount: categoryMenu.length,
          itemBuilder: (context, index) {
            return ListTile(
              title: Text(categoryMenu[index].name),
            );
          });
    }).toList();
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
        body: Consumer(builder: (context, ref, child) {
          List<Food> fullMenu = ref.read(restaurantProvider).menu;
          return TabBarView(
            controller: _tabController,
            children: getFoodinThisCategory(fullMenu),
          );
        }),
      ),
    );
  }
}
