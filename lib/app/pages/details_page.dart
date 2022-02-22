import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:superhero/app/controllers/superhero_controller.dart';
import 'package:superhero/app/controllers/view_superhero_controller.dart';

class DetailsPage extends StatefulWidget {
  const DetailsPage({Key? key}) : super(key: key);

  @override
  State<DetailsPage> createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  late ViewSuperHeroController controller;

  SuperHeroController superHeroController = Get.find();
  late String id;

  @override
  void initState() {
    id = Get.parameters['id']!;

    controller = Get.isRegistered<ViewSuperHeroController>(tag: id)
        ? Get.find(tag: id)
        : Get.put(
            ViewSuperHeroController(id: id),
            tag: id,
          );

    super.initState();
  }

  @override
  void dispose() {
    Get.delete<ViewSuperHeroController>(tag: id);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;

    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Stack(
          children: <Widget>[
            // White Container top half
            Container(
              height: screenHeight / 2.1,
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(40.0),
                    bottomRight: Radius.circular(40.0)),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  Image.network(
                    controller.superResponse.image!.url!,
                    fit: BoxFit.cover,
                  ),
                ],
              ),
            ),

            // Text bottom part
            Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Text(
                  controller.superResponse.name!,
                  textAlign: TextAlign.start,
                  style: const TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
                const SizedBox(height: 30.0),
                Text(
                  controller.superResponse.biography!.fullName!,
                  style: TextStyle(
                    fontSize: 15.0,
                    color: Colors.white.withOpacity(0.8),
                    height: 1.5,
                  ),
                ),
                const SizedBox(height: 50.0),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
