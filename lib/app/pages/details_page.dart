import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:superhero/app/controllers/superhero_controller.dart';

class DetailsPage extends StatelessWidget {
  final SuperHeroController controller = Get.find();
  DetailsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;

    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Column(
          children: <Widget>[
            //White Container top half
            ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Container(
                height: screenHeight / 1.6,
                width: 140,
                color: Colors.white,
                child: Image.network(
                  controller.superheroResponse.value.image!.url!,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            paddingOnly(bottom: 20),

            // Text bottom part
            Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Text(
                  controller.superheroResponse.value.name!,
                  textAlign: TextAlign.start,
                  style: const TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.black),
                ),
                const SizedBox(height: 30.0),
                Text(
                  controller.superheroResponse.value.biography!.fullName!,
                  style: TextStyle(
                    fontSize: 15.0,
                    color: Colors.black.withOpacity(0.8),
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
