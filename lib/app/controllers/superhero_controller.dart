import 'package:get/get.dart';
import 'package:superhero/app/data/models/superhero_response.dart';
import 'package:superhero/app/data/repositories/superhero_repo.dart';

class SuperHeroController extends GetxController {
  Rx<SuperheroResponse> superheroResponse = SuperheroResponse().obs;

  final RxBool _isLoading = true.obs;
  bool get isLoading => _isLoading.value;

  //SuperheroResponse? response;
  @override
  void onInit() {
    getSuperhero();
    super.onInit();
  }

  void getSuperhero() async {
    try {
      _isLoading(true);
      SuperheroResponse? response =
          await SuperheroService().getCharactersDetails();
      if (response != null) {
        superheroResponse.value = response;
        print(response);
      }
    } finally {
      _isLoading(false);
    }
  }
}
