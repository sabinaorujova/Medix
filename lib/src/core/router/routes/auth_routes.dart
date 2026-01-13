import 'package:go_router/go_router.dart';
import 'package:nutri_plate/src/features/auth/presentation/screens/auth/login/login_page.dart';
import 'package:nutri_plate/src/features/auth/presentation/screens/auth/password_reset_page/email_adress_page.dart';
import 'package:nutri_plate/src/features/auth/presentation/screens/auth/password_reset_page/new_password_page.dart';
import 'package:nutri_plate/src/features/auth/presentation/screens/auth/password_reset_page/verification_page.dart';
import 'package:nutri_plate/src/features/auth/presentation/screens/auth/register/register_page.dart';
import '../route_constants.dart';

List<RouteBase> get authRoutes => [
      GoRoute(
        path: RouteConstants.login,
        name: RouteConstants.loginPage,
        builder: (context, state) => const LoginPage(),
      ),
      GoRoute(
        path: RouteConstants.register,
        name: RouteConstants.registerPgae,
        builder: (context, state) => const RegisterPage(),
      ),
      GoRoute(
        path: RouteConstants.emailAddress,
        name: RouteConstants.emailAdress,
        builder: (context, state) => const EmailAdressPage(),
      ),
      GoRoute(
        path: RouteConstants.verification,
        name: RouteConstants.verification,
        builder: (context, state) => const VerificationPage(),
      ),
      GoRoute(
        path: RouteConstants.newPassword,
        name: RouteConstants.newPassword,
        builder: (context, state) => const NewPasswordPage(),
      ),
    ];
