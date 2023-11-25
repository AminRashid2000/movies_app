import 'package:flutter/material.dart';
import 'package:project1/views/homescreen.dart';
import 'package:project1/views/searchscreen.dart';

class MyBottomNavigationBar extends StatefulWidget {
  @override
  _MyBottomNavigationBarState createState() => _MyBottomNavigationBarState();
}

class _MyBottomNavigationBarState extends State<MyBottomNavigationBar> {
  int _currentIndex = 0;
  late PageController _pageController;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: _currentIndex);
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: _pageController,
        onPageChanged: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        children: [
          HomeScreen(),
          SearchSreen(),
        ],
      ),
      bottomNavigationBar: Container(
        color: Colors.black,
        child: BottomNavigationBar(
          elevation: 0,
          unselectedItemColor: Colors.grey,
          selectedItemColor: Colors.white,
          //fixedColor: Colors.transparent,
          backgroundColor: Colors.transparent,
          currentIndex: _currentIndex,
          onTap: (index) {
            setState(() {
              _currentIndex = index;
              _pageController.animateToPage(
                _currentIndex,
                duration: Duration(milliseconds: 300),
                curve: Curves.bounceInOut,
              );
            });
          },
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home ',
            ),
            BottomNavigationBarItem(icon: Icon(Icons.search), label: 'Search '),
          ],
        ),
      ),
    );
  }
}
