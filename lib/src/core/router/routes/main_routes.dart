import 'package:go_router/go_router.dart';
import 'package:nutri_plate/src/features/home/presentation/screens/home/home_page.dart';
import 'package:nutri_plate/src/features/onboarding/presentation/screens/onboarding/onboarding_page.dart';
import 'package:nutri_plate/src/features/splash/presentation/screens/splash/splash_page.dart';
import '../route_constants.dart';

List<RouteBase> get mainRoutes => [
      GoRoute(
        path: RouteConstants.splash,
        name: RouteConstants.splashPage,
        builder: (context, state) => const SplashPage(),
      ),
      GoRoute(
        path: RouteConstants.onboarding,
        name: RouteConstants.onboardingPage,
        builder: (context, state) => const OnboardingPage(),
      ),
      GoRoute(
        path: RouteConstants.home,
        name: RouteConstants.homePage,
        builder: (context, state) => const HomePage(),
      ),
    ];
