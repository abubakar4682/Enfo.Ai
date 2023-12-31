import 'package:flutter/material.dart';

import '../screens/login.dart';

class BottomPage extends StatefulWidget {
  BottomPage({Key? key}) : super(key: key);

  @override
  State<BottomPage> createState() => _BottomPageState();
}

class _BottomPageState extends State<BottomPage> {
  int currentIndex = 0;
  List<Widget> pages = [
    Login(),
    Login(),
    Login(),
    Login(),
  ];

  onTapped(int index) {
    setState(() {
      currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
        type: BottomNavigationBarType.fixed,
        onTap: onTapped,
        items: [
          _buildNavigationBarItem('home', 'assets/images/Overview.png', 0),
          _buildNavigationBarItem('contacts', 'assets/images/Historical.png', 1),
          _buildNavigationBarItem('chats', 'assets/images/Last 24 Hours.png', 2),
          _buildNavigationBarItem('Profile', 'assets/images/RFID Signal.png', 3),
        ],
      ),
    );
  }

  BottomNavigationBarItem _buildNavigationBarItem(
      String label, String imagePath, int index) {
    return BottomNavigationBarItem(
      label: label,
      icon: Image.asset(
        imagePath,
        width: 30,
        height: 30,
        color: currentIndex == index ? Colors.blue : Colors.grey,
      ),
      backgroundColor:
      currentIndex == index ? Colors.lightBlueAccent : Colors.white,
    );
  }
}
