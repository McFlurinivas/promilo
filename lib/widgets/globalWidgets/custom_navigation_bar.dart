import 'package:flutter/material.dart';

class CustomBottomNavigationBar extends StatelessWidget {

  const CustomBottomNavigationBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.1,
      child: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        iconSize: 30,
        backgroundColor: Colors.white,
        currentIndex: 2,
        fixedColor: const Color(0xFF4bdee4),
        unselectedItemColor: const Color(0xFF07283a),
        unselectedFontSize: 15,
        selectedFontSize: 15,
        selectedLabelStyle: const TextStyle(fontWeight: FontWeight.w500),
        unselectedLabelStyle: const TextStyle(fontWeight: FontWeight.w500),
        items: [
          const BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: SizedBox(
              width: 30,
              height: 30,
              child: Image.asset('assets/images/homePage/prolet.png', scale: 2,), // Replace with your image
            ),
            label: 'Prolet',
          ),
          const BottomNavigationBarItem(
            icon: Icon(Icons.handshake_outlined),
            label: 'Meetup',
          ),
          const BottomNavigationBarItem(
            icon: Icon(Icons.search_outlined),
            label: 'Search',
          ),
          const BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}
