import 'package:fleeque/core_ui/constants.dart';
import 'package:flutter/material.dart';

class CustomBottomNavigationBar extends StatelessWidget {
  final int selectedIndex;
  final void Function(int)? onTap;

  const CustomBottomNavigationBar({
    super.key,
    this.onTap,
    required this.selectedIndex,
  });

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      selectedLabelStyle: AppFonts.smallFontPrefsWhite,
      unselectedLabelStyle: AppFonts.smallFontPrefsWhite,
      unselectedItemColor: Colors.white,
      selectedItemColor: Colors.white,
      backgroundColor: Colors.black,
      currentIndex: selectedIndex,
      onTap: onTap,
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(Icons.home_outlined),
          activeIcon: Icon(Icons.home),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.star_border_outlined),
          activeIcon: Icon(Icons.star),
          label: 'Influencer',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.help_outline),
          label: 'About',
          activeIcon: Icon(Icons.help),
        ),
        // BottomNavigationBarItem(
        //     icon: Icon(Icons.location_on_outlined),
        //     label: 'Contact',
        //     activeIcon: Icon(Icons.location_on)),
      ],
    );
  }
}
