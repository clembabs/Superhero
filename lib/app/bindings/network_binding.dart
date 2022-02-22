import 'package:get/get.dart';
import 'package:superhero/app/controllers/connection_controller.dart';

class NetworkBinding extends Bindings {
  // dependence injection attach our class.
  @override
  void dependencies() {
    // TODO: implement dependencies
    //Get.lazyPut<NetworkManager>(() => NetworkManager());
    Get.lazyPut<ConnectionStatusController>(() => ConnectionStatusController());
  }
}
