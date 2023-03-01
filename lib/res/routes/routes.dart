import 'package:get/get.dart';
import 'package:mvvm/res/routes/routes_name.dart';
import 'package:mvvm/view/splash_screen.dart';

class AppRoutes {
  static appRoutes() => [
        GetPage(
            name: RoutesNAme.SplashScreen,
            page: () => const SplashScreen(),
            transitionDuration: const Duration(seconds: 250),
            transition: Transition.leftToRight)
      ];
}
