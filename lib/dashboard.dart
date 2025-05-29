import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hyeve/pages/ai.dart';
import 'package:hyeve/pages/favourite.dart';
import 'package:hyeve/pages/profile.dart';
import 'package:hyeve/pages/search.dart';
import 'package:hyeve/constant/constant.dart';

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
    favourite(),
    profile(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        backgroundColor: Colors.black,
        leading:
          IconButton(onPressed: () {},
              icon: AppIcons(iconcolor: Colors.grey,
                  iconsize: 24,
                  iconimage: Icons.history)),
        centerTitle: true,
        title: Container(height: 26, width: 160, decoration: BoxDecoration(
          image: DecorationImage(image: AssetImage("assets/img_1.png"))
        ),),
        actions: [
          IconButton(onPressed: () {},
              icon: AppIcons(iconcolor: Colors.grey,
                  iconsize: 24,
                  iconimage: Icons.add_box_outlined)),
        ],


      ),
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


