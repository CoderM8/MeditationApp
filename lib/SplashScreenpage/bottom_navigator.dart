import 'dart:ui';

import 'package:flutter/material.dart';

import '../views/screens/sleep/sleep_screen.dart';
import 'HomeScreen.dart';
import 'Meditationpage.dart';
import 'Musicpage.dart';
import 'Profilepage.dart';

class bottom_navigatorpage extends StatefulWidget {
  const bottom_navigatorpage({Key? key}) : super(key: key);
  @override
  State<bottom_navigatorpage> createState() => _bottom_navigatorpageState();
}

/// This is the private State class that goes with bottom_navigatorpage.
class _bottom_navigatorpageState extends State<bottom_navigatorpage> {
  int _selectedIndex = 0;
  static TextStyle optionStyle = TextStyle();
  static List<Widget> _widgetOptions = <Widget>[
    Homescreen(),
    Meditationpage(),
    // Meditationpage(),
    SleepScreen(),
    Musicpage(),
    Profilepage(),
  ];
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Align(
        alignment: Alignment.bottomCenter,
        child: ClipRRect(
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 10, sigmaY: 5),
            child: BottomNavigationBar(
              backgroundColor: Colors.transparent,
              elevation: 0,
              items: const <BottomNavigationBarItem>[
                BottomNavigationBarItem(
                  icon: Icon(Icons.home),
                  label: 'Home',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.accessibility_outlined),
                  label: 'Meditation',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.mood_rounded),
                  label: 'Sleep',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.library_music_outlined),
                  label: 'Music',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.person),
                  label: 'Profile',
                ),
              ],
              currentIndex: _selectedIndex,
              type: BottomNavigationBarType.fixed,
              selectedItemColor: Colors.white,
              unselectedItemColor: Colors.white60,
              unselectedLabelStyle: const TextStyle(color: Colors.black),
              onTap: _onItemTapped,
            ),
          ),
        ),
      ),
      extendBody: false,
      body: Column(
        children: [
          _widgetOptions.elementAt(_selectedIndex),
          SizedBox(
            height: 80,
          )
        ],
      ),
    );
  }
}
