import 'package:get/get.dart';
import 'package:superhero/app/bindings/network_binding.dart';
import 'package:superhero/app/pages/details_page.dart';
import 'package:superhero/app/pages/home_page.dart';
import 'package:superhero/app/pages/splash_screen.dart';
import 'package:superhero/app/routes.dart';
import 'package:superhero/app/widgets/connectivity_view.dart';

abstract class Pages {
  static final List<GetPage<dynamic>> pages = <GetPage<dynamic>>[
    GetPage<dynamic>(
      name: Routes.checkInternet,
      page: () => HomeView(),
      binding: NetworkBinding(),
      transition: Transition.fadeIn,
      transitionDuration: const Duration(seconds: 1),
    ),
    GetPage<dynamic>(
      name: Routes.splashScreen,
      page: () => const SplashScreen(),
      transition: Transition.fadeIn,
      transitionDuration: const Duration(seconds: 1),
    ),
    GetPage<dynamic>(
      name: Routes.home,
      page: () => HomePage(),
    ),
    GetPage<dynamic>(
      name: Routes.homeDetails,
      page: () => DetailsPage(),
      transition: Transition.noTransition,
    ),
  ];
}
