import 'package:flutter/material.dart';
import 'package:flutter_modern_clock/app/locator.dart';
import 'package:flutter_modern_clock/app/router.gr.dart';
import 'package:stacked_services/stacked_services.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Modern Clock',
      theme: ThemeData(
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: Scaffold(),
      onGenerateRoute: Router().onGenerateRoute,
      navigatorKey: locator<NavigationService>().navigatorKey,
    );
  }
}
