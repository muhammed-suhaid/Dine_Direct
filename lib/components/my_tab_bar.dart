import 'package:flutter/material.dart';

class MyTabBar extends StatelessWidget {
  final TabController tabController;
  const MyTabBar({
    super.key,
    required this.tabController,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      child: TabBar(
        controller: tabController,
        tabs: [
          // home tab
          Tab(
            child: Icon(Icons.home),
          ),
          //settings tab
          Tab(
            child: Icon(Icons.settings),
          ),
          //profile tab
          Tab(
            child: Icon(Icons.person),
          ),
        ],
      ),
    );
  }
}
