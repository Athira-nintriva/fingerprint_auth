import 'package:get/get.dart';
import '../feature/auth/login_auth.dart';
import '../feature/dashboard/dashboard_screen.dart';
import '../feature/splash/splash_screen.dart';

List<GetPage> routes() => [
      GetPage(
        name: "/",
        page: () => const SplashScreen(),
      ),
      GetPage(
        name: "/login",
        page: () =>const  LoginAuth(),
      ),
      GetPage(
        name: "/dashboard",
        page: () => const Dashboard(),
      ),
    ];
