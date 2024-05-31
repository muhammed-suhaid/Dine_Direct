import 'package:dine_direct/components/my_drawer_tile.dart';
import 'package:dine_direct/pages/settings_page.dart';
import 'package:flutter/material.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Theme.of(context).colorScheme.background,
      child: Column(
        children: [
          //App logo
          Padding(
            padding: const EdgeInsets.only(top: 80),
            child: Icon(
              Icons.dinner_dining,
              size: 100,
              color: Theme.of(context).colorScheme.inversePrimary,
            ),
          ),

          Padding(
            padding: const EdgeInsets.all(25),
            child: Divider(
              color: Theme.of(context).colorScheme.secondary,
            ),
          ),

          //Home list title
          MyDrawerTile(
            text: 'HOME',
            icon: Icons.home,
            onTap: () => Navigator.pop(context),
          ),

          //Settings list tile
          MyDrawerTile(
            text: 'SETTINGS',
            icon: Icons.settings,
            onTap: () {
              Navigator.pop(context);
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const SettingsPage(),
                ),
              );
            },
          ),

          //Logout list tile
          MyDrawerTile(
            text: 'LOGOUT',
            icon: Icons.logout,
            onTap: () {},
          ),
        ],
      ),
    );
  }
}
