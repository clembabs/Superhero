import 'package:get/get.dart';
import 'package:superhero/app/data/models/superhero_response.dart';

class ViewSuperHeroController extends GetxController {
  late Rx<SuperheroResponse> _superResponse;

  SuperheroResponse get superResponse => _superResponse.value;

  ViewSuperHeroController({SuperheroResponse? reponseToView, String? id}) {
    _superResponse = reponseToView!.obs;
  }

  @override
  void onInit() {
    super.onInit();
  }
}
