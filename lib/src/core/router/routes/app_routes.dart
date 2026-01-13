import 'package:go_router/go_router.dart';
import 'package:nutri_plate/src/core/router/routes/auth_routes.dart';
import 'package:nutri_plate/src/core/router/routes/main_routes.dart';
import 'package:nutri_plate/src/core/router/routes/feature_routes.dart';

List<RouteBase> get appRoutes => [
  ...mainRoutes,
  ...authRoutes,
  ...featureRoutes,
];
