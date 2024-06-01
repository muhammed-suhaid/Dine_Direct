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
        headerSliverBuilder: (context, innerBoxIsScrolled) =>[MySliverAppBar(
          child: Text('Hello'),
          title: Text('title'),
        ),] ,
        body: Container(
          color: Colors.blue,
        ),
       
      ),
    );
  }
}
