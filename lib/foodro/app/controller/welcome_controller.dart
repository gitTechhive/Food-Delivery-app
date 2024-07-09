import 'package:get/get.dart';

import '../../../../route/my_route.dart';
import '../../../../theme/theme_controller.dart';



class FoodWelcomeController extends GetxController {
  final ThemeController themeController = Get.put(ThemeController());
  late bool isDarkMode;
  @override
  void onInit() {
    super.onInit();
    init();
    isDarkMode = themeController.isDarkMode;
  }

  void init() async {
    await Future.delayed(const Duration(seconds: 2));
    initialization();
  }

  void initialization() async {
    goToNextScreen();
  }

  void goToNextScreen() {
    Get.toNamed(MyRoute.foodWalkthrough);
  }
}
