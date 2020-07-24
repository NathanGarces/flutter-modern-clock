import 'package:auto_route/auto_route_annotations.dart';

//View Imports
import 'package:flutter_modern_clock/ui/views/main_view.dart';

//Used to automatically build the routes.
@MaterialAutoRouter(
  routes: <AutoRoute>[
    // initial route is named "/"
    MaterialRoute(page: MainView, initial: true),
  ],
)
class $Router {}

//Command to auto-generate routes => flutter pub run build_runner build --delete-conflicting-outputs
