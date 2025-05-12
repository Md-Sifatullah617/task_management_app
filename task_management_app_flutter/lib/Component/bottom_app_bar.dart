import 'package:flutter/material.dart';

import '../style/style.dart';

BottomNavigationBar appBottomNav(currentIndx, onTappedIndexChange) {
  return BottomNavigationBar(
    items: const [
      BottomNavigationBarItem(icon: Icon(Icons.list_alt_outlined), label: "New"),
      BottomNavigationBarItem(icon: Icon(Icons.leaderboard_outlined), label: "Progress"),
      BottomNavigationBarItem(icon: Icon(Icons.check_circle_outline), label: "Completed"),
      BottomNavigationBarItem(icon: Icon(Icons.update_disabled_outlined), label: "Cancled"),
    ],
    selectedItemColor: colorGreen,
    unselectedItemColor: colorLightGray,
    currentIndex: currentIndx,
    showSelectedLabels: true,
    showUnselectedLabels: true,
    onTap: onTappedIndexChange
  );
}
