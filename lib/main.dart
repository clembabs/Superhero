import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:superhero/app/bindings/network_binding.dart';

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
    theme: ThemeData(
      primarySwatch: Colors.blue,
    ),
    //home: const MyHomePage(title: 'Flutter Demo Home Page'),
  ));
}
