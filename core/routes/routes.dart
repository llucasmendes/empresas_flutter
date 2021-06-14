import 'package:flutter/animation.dart';
import 'package:flutter/material.dart';

import 'package:seafarer/seafarer.dart';

import 'app/app_routes.dart';

class Routes {
  static final sailor = Seafarer(
    options: SeafarerOptions(
      handleNameNotFoundUI: true,
      isLoggingEnabled: true,
      defaultTransitions: [
        SeafarerTransition.slide_from_bottom,
        SeafarerTransition.zoom_in,
      ],
      defaultTransitionCurve: Curves.decelerate,
      defaultTransitionDuration: Duration(milliseconds: 500),
    ),
  );

  static void createRoutes() {
    sailor.addRoutes(
      [
        ...AppRoutes.getRoutes(),
      ],
    );
  }
}
