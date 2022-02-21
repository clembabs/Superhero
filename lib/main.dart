import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:superhero/app/bindings/network_binding.dart';
import 'package:superhero/app/data/providers/network_manager.dart';
import 'package:superhero/app/pages.dart';
import 'package:superhero/app/routes.dart';
import 'package:superhero/app/translations/app_translations.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  //To Set Screen to Portrait
  await SystemChrome.setPreferredOrientations(<DeviceOrientation>[
    DeviceOrientation.portraitUp,
  ]);

  runApp(GetMaterialApp(
    title: 'Superhero',
    debugShowCheckedModeBanner: false,
    initialBinding: NetworkBinding(),
    initialRoute: Routes.splashScreen,
    getPages: Pages.pages,
    locale: Get.deviceLocale,
    fallbackLocale: const Locale('en', 'US'),
    translations: AppTranslations(),
    theme: ThemeData(
      primarySwatch: Colors.blue,
    ),
    home: MyHomePage(),
  ));
}

class MyHomePage extends StatelessWidget {
  final NetworkManager _networkManager =
      Get.put<NetworkManager>(NetworkManager());
  MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const Text(
                'Network Status',
                style: TextStyle(fontSize: 20),
              ),
              //update the Network State
              Obx(() => Text(
                    (_networkManager.connectiontype == 0)
                        ? 'No Internet'
                        : (_networkManager.connectiontype == 1)
                            ? 'You are Connected to Wifi'
                            : 'You are Connected to Mobile Internet',
                    style: const TextStyle(fontSize: 30),
                  )),
            ],
          ),
        ),
      );
}
