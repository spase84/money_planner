import 'package:flutter/material.dart';
import 'package:money_planner/source/feature/root/ui/root.dart';
import 'package:money_planner/source/settings/constants.dart';
import 'package:money_planner/source/settings/theme.dart';

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      navigatorKey: GlobalKey<NavigatorState>(),
      title: AppConstants.appName,
      theme: darkTheme,
      // routes: Routes.routes,
      home: const Root(),
    );
  }
}
