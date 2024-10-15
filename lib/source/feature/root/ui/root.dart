import 'package:flutter/material.dart';
import 'package:money_planner/source/feature/root/domain/tab_item.dart';
import 'package:money_planner/source/ui/navigation_bottom_bar.dart';

class Root extends StatefulWidget {
  const Root({super.key});

  @override
  State<Root> createState() => _RootState();
}

class _RootState extends State<Root> {
  int _selectedIndex = 0;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _selectedIndex,
        children: TabItem.values.children,
      ),
      bottomNavigationBar: NavigationBottomBar(
        onSelectTab: (value) => setState(() => _selectedIndex = value),
      ),
    );
  }
}
