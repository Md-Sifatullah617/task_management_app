import 'package:flutter/material.dart';
import 'package:task_management_app_client/task_management_app_client.dart';

import '../style/style.dart';

BottomNavigationBar appBottomNav(currentIndx, onTappedIndexChange) {
  List<IconData> icons = [
    Icons.list_alt_outlined,
    Icons.leaderboard_outlined,
    Icons.check_circle_outline,
    Icons.update_disabled_outlined
  ];
  return BottomNavigationBar(
      items: TaskStatus.values
          .map((status) => BottomNavigationBarItem(
              icon: Icon(
                icons[TaskStatus.values.indexOf(status)],
              ),
              label: status.name))
          .toList(),
      selectedItemColor: colorGreen,
      unselectedItemColor: colorLightGray,
      currentIndex: currentIndx,
      showSelectedLabels: true,
      showUnselectedLabels: true,
      onTap: onTappedIndexChange);
}
