import 'package:flutter/material.dart';
import 'package:purple/bottom_navigation/categories.dart';
import 'package:purple/bottom_navigation/brands.dart';
import 'package:purple/bottom_navigation/offers.dart';
import 'package:purple/bottom_navigation/home.dart';
import 'package:purple/bottom_navigation/studio.dart';

class first_screen extends StatefulWidget {
  const first_screen({Key? key}) : super(key: key);

  @override
  State<first_screen> createState() => first_screen1();
}

class first_screen1 extends State<first_screen> {
  int _currentIndex = 0;
  List _screens = [home(), categories(), brands(), IndexPage(), studio()];

  void _updateIndex(int value) {
    setState(() {
      _currentIndex = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: _currentIndex,
        onTap: _updateIndex,
        selectedItemColor: Colors.pinkAccent,
        selectedFontSize: 13,
        unselectedFontSize: 13,
        iconSize: 30,
        items: [
          BottomNavigationBarItem(
            label: "home",
            icon: Icon(Icons.home),
          ),
          BottomNavigationBarItem(
            label: "categories",
            icon: Container(
              child: ImageIcon(
                AssetImage("assets/img/cate.jpg"),
                //color: Color(0xFF3A5A98),
              ),
            ),
          ),
          BottomNavigationBarItem(
            label: "brands",
            icon: Container(
              child: ImageIcon(
                AssetImage("assets/img/brand4.png"),
                //color: Color(0xFF3A5A98),
              ),
            ),
          ),
          BottomNavigationBarItem(
            label: "offers",
            icon: Container(
              child: ImageIcon(
                AssetImage("assets/img/offers.png"),
                //color: Color(0xFF3A5A98),
              ),
            ),
          ),
          BottomNavigationBarItem(
            label: "studio",
            icon: Container(
              child: ImageIcon(
                AssetImage("assets/img/studio1.png"),
                //color: Color(0xFF3A5A98),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
