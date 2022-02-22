import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:superhero/app/data/providers/network_manager.dart';
import 'package:superhero/app/routes.dart';
import 'package:superhero/app/translations/locales/translation_keys.dart';
import 'package:superhero/app/utils/app_colors.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with TickerProviderStateMixin {
  late AnimationController _controller;
  bool copAnimated = false;
  bool animateCafeText = false;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this);
    _controller.addListener(() {
      if (_controller.value > 0.7) {
        _controller.stop();
        copAnimated = true;
        setState(() {});
        // ignore: always_specify_types
        Future.delayed(const Duration(seconds: 1), () {
          animateCafeText = true;
          setState(() {});
        });
      }
    });
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    NetworkManager _networkManager = Get.put<NetworkManager>(NetworkManager());
    return Scaffold(
      backgroundColor: AppColors.teal,
      body: Stack(
        children: <Widget>[
          // White Container top half
          AnimatedContainer(
            duration: const Duration(seconds: 1),
            height: copAnimated ? screenHeight / 1.9 : screenHeight,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(copAnimated ? 40.0 : 0.0),
                  bottomRight: Radius.circular(copAnimated ? 40.0 : 0.0)),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Visibility(
                  visible: !copAnimated,
                  child: Lottie.asset(
                    'assets/superman.json',
                    controller: _controller,
                    onLoaded: (LottieComposition composition) {
                      _controller
                        ..duration = composition.duration
                        ..forward();
                    },
                  ),
                ),
                Visibility(
                  visible: copAnimated,
                  child: Image.asset(
                    'assets/superhero.png',
                    height: 190.0,
                    width: 190.0,
                  ),
                ),
                Center(
                  child: AnimatedOpacity(
                    opacity: animateCafeText ? 1 : 0,
                    duration: const Duration(seconds: 1),
                    child: Text(
                      TranslateKeys.superhero.tr,
                      style: const TextStyle(
                          fontSize: 40.0, color: AppColors.teal),
                    ),
                  ),
                ),
              ],
            ),
          ),

          // Text bottom part
          Visibility(visible: copAnimated, child: const _BottomPart()),
        ],
      ),
    );
  }
}

class _BottomPart extends StatelessWidget {
  const _BottomPart({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Align(
        alignment: Alignment.bottomCenter,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 40.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Text(
                TranslateKeys.superheroDesc.tr,
                textAlign: TextAlign.center,
                style: const TextStyle(
                    fontSize: 27.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
              const SizedBox(height: 30.0),
              Text(
                'Lorem ipsum dolor sit amet, adipiscing elit. '
                'Nullam pulvinar dolor sed enim eleifend efficitur.',
                style: TextStyle(
                  fontSize: 15.0,
                  color: Colors.white.withOpacity(0.8),
                  height: 1.5,
                ),
              ),
              const SizedBox(height: 50.0),
              Align(
                alignment: Alignment.centerRight,
                child: Container(
                  height: 85.0,
                  width: 85.0,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(color: Colors.white, width: 2.0),
                  ),
                  child: GestureDetector(
                    onTap: () => Get.toNamed(Routes.home),
                    child: const Icon(
                      Icons.chevron_right,
                      size: 50.0,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 50.0),
            ],
          ),
        ),
      );
}
