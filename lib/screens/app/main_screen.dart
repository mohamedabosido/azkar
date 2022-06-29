import 'package:azkar/constants.dart';
import 'package:azkar/screens/app/about_us_screen.dart';
import 'package:azkar/screens/app/categories_list_screen.dart';
import 'package:azkar/screens/app/favorite_screen.dart';
import 'package:azkar/screens/app/questions_screen.dart';
import 'package:flutter/material.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedIndex = 0;

  final List<Widget> _screens = <Widget>[
    const CategoriesListScreen(),
    const FavoriteScreen(),
    const QuestionsScreen(),
    const AboutUsScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        backgroundColor: backgroundColor,
        body: _screens[_selectedIndex],
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          onTap: (int value) {
            setState(() {
              _selectedIndex = value;
            });
          },
          currentIndex: _selectedIndex,
          backgroundColor: primaryTextColor,
          elevation: 15,
          selectedItemColor: Colors.white,
          unselectedItemColor: unselectedColor,
          showUnselectedLabels: true,
          showSelectedLabels: true,
          selectedFontSize: 16,
          unselectedFontSize: 16,
          items: [
            BottomNavigationBarItem(
                icon: Image.asset(
                  'images/1.png',
                  width: 20,
                  height: 20,
                ),
                label: 'قائمة الاذكار'),
            BottomNavigationBarItem(
                icon: Image.asset(
                  'images/2.png',
                  width: 20,
                  height: 20,
                ),
                label: 'المفضلة'),
            BottomNavigationBarItem(
                icon: Image.asset(
                  'images/3.png',
                  width: 20,
                  height: 20,
                ),
                label: 'اسئلة رمضان'),
            BottomNavigationBarItem(
                icon: Image.asset(
                  'images/4.png',
                  width: 20,
                  height: 20,
                ),
                label: 'عن التطبيق'),
          ],
        ),
      ),
    );
  }
}
