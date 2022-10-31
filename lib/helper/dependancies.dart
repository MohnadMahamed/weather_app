import 'package:get/instance_manager.dart';
import 'package:weather_app/controllers/home_controllers.dart';

class HomeBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(
        () => HomeController(city: 'Al Mansura', lat: 31.0409, lon: 31.3785));
  }
}
