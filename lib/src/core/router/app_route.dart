import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'routes/app_routes.dart';
import 'route_constants.dart';

final _rootNavigatorKey = GlobalKey<NavigatorState>();

final router = GoRouter(
  navigatorKey: _rootNavigatorKey,
  initialLocation: RouteConstants.splash,
  routes: appRoutes,
  redirect: (context, state) async {
    bool isAuthenticated = false;
    if (!isAuthenticated && state.matchedLocation == '/') {
      return RouteConstants.splash;
    }
    return null;
  },
);
