import 'package:flutter/material.dart';
import 'package:money_planner/source/feature/root/domain/tab_item.dart';

final Map<TabItem, GlobalKey<NavigatorState>> navigatorKeys = {
  TabItem.home: GlobalKey<NavigatorState>(),
  TabItem.favorite: GlobalKey<NavigatorState>(),
  TabItem.profile: GlobalKey<NavigatorState>(),
};
