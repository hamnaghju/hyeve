import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hyeve/ui/ai.dart';
import 'package:hyeve/ui/caretakerScreen.dart';
import 'package:hyeve/ui/lodgeDetails.dart';
import 'package:hyeve/ui/profile.dart';
import 'package:hyeve/ui/reviewScreen.dart';
import 'package:hyeve/ui/search.dart';
import 'chatDetail.dart';
import 'favourite.dart';


class dashboard extends StatefulWidget {
  const dashboard({super.key});

  @override
  State<dashboard> createState() => _dashboardState();
}

class _dashboardState extends State<dashboard> {
  int _selectedIndex = 0;

  final List<Widget> _pages = [
    search(),
    Ai(),
    Favourite(),
    Profile(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(


      bottomNavigationBar: CustomBottomNavBar(selectedIndex:  _selectedIndex, onTap: (index) => setState(() => _selectedIndex = index),),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height:MediaQuery.of(context).size.height,
        child: _pages[_selectedIndex],
      ),
    );

  }
}

class CustomBottomNavBar extends StatelessWidget {
  final int selectedIndex;
  final Function(int) onTap;

  const CustomBottomNavBar({
    super.key,
    required this.selectedIndex,
    required this.onTap,
  });

  Widget _icon(String path, int index) {
    return Image.asset(
      path,
      height: 24,
      width: 24,
      color: selectedIndex == index ? Colors.white : Colors.grey,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(

      decoration: BoxDecoration(
        color: Color(0xFF1C1C1E),
        borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
        boxShadow: [
          BoxShadow(
            color: Colors.black26,
            blurRadius: 10,
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
        child: BottomNavigationBar(
          backgroundColor: Color(0xFF1C1C1E),
          type: BottomNavigationBarType.fixed,
          selectedItemColor: Colors.white,
          unselectedItemColor: Colors.grey,
          currentIndex: selectedIndex,
          onTap: onTap,
          showSelectedLabels: false,
          showUnselectedLabels: false,
          items: [
            BottomNavigationBarItem(
              icon: _icon('assets/icons/img.png', 0),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: _icon('assets/icons/img_1.png', 1),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: _icon('assets/icons/img_2.png', 2),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: _icon('assets/icons/img_3.png', 3),
              label: '',
            ),
          ],
        ),
      ),
    );
  }
}


