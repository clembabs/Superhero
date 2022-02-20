import 'package:get/get.dart';
import 'package:superhero/app/data/providers/network_manager.dart';

class NetworkBinding extends Bindings {
  // dependence injection attach our class.
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.lazyPut<NetworkManager>(() => NetworkManager());
  }
}
