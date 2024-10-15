import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:money_planner/source/app.dart';
import 'package:money_planner/source/components/runner_helper.dart';
import 'package:money_planner/source/di/service_locator.dart';

void main() {
  runZonedGuarded(() async {
    WidgetsFlutterBinding.ensureInitialized();
    configureDependencies();
    await dotenv.load(fileName: '.env');
    runApp(const App());
  }, (error, stackTrace) {
    runnerHelper.onZoneError(error, stackTrace);
  });
}
