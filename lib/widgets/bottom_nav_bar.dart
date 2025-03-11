import 'package:flutter/material.dart';
import 'package:netflix_clone/screens/home_screen.dart';
import 'package:netflix_clone/screens/new_and_hot_screen.dart';
import 'package:netflix_clone/screens/search_screen.dart';

class BottomNavBar extends StatelessWidget {
  const BottomNavBar({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        bottomNavigationBar: Container(
          color: Colors.black,
          height: 70,
          child: TabBar(
            tabs: [
              Tab(icon: Icon(Icons.home), text: "Home"),
              Tab(icon: Icon(Icons.search), text: "Search"),
              Tab(icon: Icon(Icons.photo_library_outlined), text: "New & Hot"),
            ],
            indicator: BoxDecoration(),
            labelColor: Colors.white,
            unselectedLabelColor: Color(0xFF999999),
          ),
        ),
        body: TabBarView(
          children: [HomeScreen(), SearchScreen(), NewAndHotScreen()],
        ),
      ),
    );
  }
}
