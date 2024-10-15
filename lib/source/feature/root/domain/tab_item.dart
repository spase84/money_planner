import 'package:flutter/material.dart';
import 'package:money_planner/source/feature/favorites/ui/favorites_screen.dart';
import 'package:money_planner/source/feature/home/ui/home_screen.dart';
import 'package:money_planner/source/feature/profile/ui/profile_screen.dart';

enum TabItem {
  home,
  favorite,
  profile,
}

extension TabItemExtension on TabItem {
  String get title => toString().split('.').last;
  IconData get icon => switch (this) {
        TabItem.home => Icons.home,
        TabItem.favorite => Icons.favorite,
        TabItem.profile => Icons.person,
      };

  Widget get child => switch (this) {
        TabItem.home => const HomeScreen(),
        TabItem.favorite => const FavoritesScreen(),
        TabItem.profile => const ProfileScreen(),
      };
}

extension TabItemListExtension on List<TabItem> {
  List<Widget> get children => map((e) => e.child).toList();
}
