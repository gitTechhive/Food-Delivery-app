
import 'package:get/get.dart';

import '../../../../route/my_route.dart';



class FoodSplashController extends GetxController {
  @override
  void onInit() {
    super.onInit();
    init();
  }

  void init() async {
    await Future.delayed(const Duration(seconds: 2));
    initialization();
  }

  void initialization() async {
    goToWelcomeScreen();
  }

  void goToWelcomeScreen() {
    Get.offNamed(MyRoute.foodWelcome);
  }
}
