import 'package:flutter/material.dart';
import 'package:money_planner/source/feature/root/domain/tab_item.dart';

class NavigationBottomBar extends StatefulWidget {
  final ValueChanged<int> onSelectTab;

  const NavigationBottomBar({super.key, required this.onSelectTab});

  @override
  State<NavigationBottomBar> createState() => _NavigationBottomBarState();
}

class _NavigationBottomBarState extends State<NavigationBottomBar>
    with TickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    _tabController = TabController(
      length: TabItem.values.length,
      vsync: this,
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surface,
        borderRadius: BorderRadius.circular(24.0),
      ),
      margin: const EdgeInsets.all(16.0),
      child: ClipRRect(
        clipBehavior: Clip.hardEdge,
        borderRadius: BorderRadius.circular(24.0),
        child: TabBar(
          controller: _tabController,
          unselectedLabelStyle: Theme.of(context).textTheme.labelMedium,
          tabs: _getNavigationBarItems(context),
          onTap: _onTap,
          indicatorColor: Colors.transparent,
          dividerColor: Colors.transparent,
          overlayColor: const WidgetStatePropertyAll(Colors.transparent),
        ),
      ),
    );
  }

  void _onTap(int index) {
    widget.onSelectTab(index);
  }

  List<Widget> _getNavigationBarItems(BuildContext context) => TabItem.values
      .map((tab) => _buildBarItem(
            context: context,
            tab: tab,
          ))
      .toList();

  Widget _buildBarItem({
    required BuildContext context,
    required TabItem tab,
  }) =>
      Tab(
        icon: Icon(tab.icon),
        text: tab.title,
      );
}
