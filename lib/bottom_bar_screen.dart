import 'package:applite_solutions/common_widgets/helper_widgets.dart';
import 'package:applite_solutions/features/home/home_screen.dart';
import 'package:applite_solutions/features/movie/screen/movie_list_screen.dart';
import 'package:applite_solutions/features/profile/profile_screen.dart';
import 'package:applite_solutions/generated/assets.dart';
import 'package:flutter/material.dart';

import 'theme/text_style.dart';

class BottomBarScreen extends StatefulWidget {
  final int? index;

  const BottomBarScreen({this.index, super.key});

  @override
  BottomBarScreenState createState() => BottomBarScreenState();
}

class BottomBarScreenState extends State<BottomBarScreen> {
  late int _selectedIndex;

  @override
  void initState() {
    super.initState();
    _selectedIndex = widget.index ?? 1;
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: _selectedIndex == 0 ? true : false,
      onPopInvoked: (value) {
        if (_selectedIndex != 0) {
          moveToHomeScreen();
        }
      },
      child: Scaffold(
        body: currentScreen(_selectedIndex, () {
          setState(() {
            _selectedIndex = 0;
          });
        }),
        bottomNavigationBar: BottomNavigationBar(
          backgroundColor: Theme.of(context).colorScheme.primary,
          type: BottomNavigationBarType.fixed,
          selectedLabelStyle: AppTextTheme.captionStyle,
          currentIndex: _selectedIndex,
          onTap: (index) {
            setState(() {
              _selectedIndex = index;
            });
          },
          items: [
            BottomNavigationBarItem(icon: vector(Assets.assetsHomeIcon), label: ''),
            BottomNavigationBarItem(icon: vector(Assets.assetsPlayIconB), label: ''),
            BottomNavigationBarItem(icon: vector(Assets.assetsUserIcon), label: ''),
          ],
        ),
      ),
    );
  }

  Widget currentScreen(int index, VoidCallback onBackPress) {
    switch (index) {
      case 0:
        return const HomeScreen();
      case 2:
        return const ProfileScreen();
      default:
        return const MovieListScreen();
    }
  }

  void moveToHomeScreen() {
    setState(() {
      _selectedIndex = 0;
    });
  }
}
