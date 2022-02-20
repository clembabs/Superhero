import 'package:get/get.dart';
import 'package:superhero/app/bindings/network_binding.dart';
import 'package:superhero/app/routes.dart';
import 'package:superhero/main.dart';

abstract class Pages {
  static final List<GetPage<dynamic>> pages = <GetPage<dynamic>>[
    GetPage<dynamic>(
      name: Routes.base,
      page: () => MyHomePage(),
      binding: NetworkBinding(),
      transition: Transition.fadeIn,
      transitionDuration: const Duration(seconds: 1),
    ),
  ];
}
