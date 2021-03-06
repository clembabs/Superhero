import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:superhero/app/controllers/connection_controller.dart';
import 'package:superhero/app/controllers/superhero_controller.dart';
import 'package:superhero/app/routes.dart';
import 'package:superhero/app/utils/app_colors.dart';
import 'package:superhero/app/widgets/hero_list_item.dart';

class HomePage extends StatelessWidget {
  final SuperHeroController controller = Get.put(SuperHeroController());
  final ConnectionStatusController statusController =
      Get.put(ConnectionStatusController());
  HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => SafeArea(
        child: Scaffold(
          backgroundColor: Colors.white,
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  const Text(
                    'SUPERHERO',
                    style: TextStyle(
                        fontSize: 30.0,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 2,
                        color: Colors.black),
                  ),
                  GestureDetector(
                    onTap: () {},
                    child: const Icon(
                      Icons.search_rounded,
                      size: 40.0,
                      color: Colors.black,
                    ),
                  ),
                ],
              ).paddingSymmetric(vertical: 18),
              Container(
                height: 32,
                padding: const EdgeInsets.all(5),
                decoration: BoxDecoration(
                    color: AppColors.teal,
                    borderRadius: BorderRadius.circular(10)),
                child: const Text(
                  'Popular',
                  style: TextStyle(fontSize: 20.0, color: Colors.white),
                ),
              ).paddingOnly(bottom: 20),
              Obx(() => Column(
                    children: <Widget>[
                      if (controller.isLoading)
                        const Center(
                          child: CircularProgressIndicator(),
                        ),
                      if (!controller.isLoading)
                        HeroListItem(
                          name: controller.superheroResponse.value.name!,
                          fullName: controller
                              .superheroResponse.value.biography!.fullName!,
                          coverPhotoUrl:
                              controller.superheroResponse.value.image!.url!,
                          gender: controller
                              .superheroResponse.value.appearance!.gender!,
                          onTap: () => Get.toNamed(Routes.homeDetails,
                              arguments: controller.superheroResponse.value),
                        ),
                    ],
                  ))
            ],
          ).paddingAll(20),
        ),
      );
}
