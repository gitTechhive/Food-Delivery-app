import 'package:get/get.dart';

import '../../../../route/my_route.dart';
import '../../../../theme/theme_controller.dart';

class FoodWelcomeSignInController extends GetxController {
  final ThemeController themeController = Get.put(ThemeController());
  late bool isDarkMode;

  @override
  void onInit() {
    super.onInit();
    isDarkMode = themeController.isDarkMode;
  }


  void goToSignupScreen() {
    Get.toNamed(MyRoute.foodSignup);
  }

  void goToSignInScreen() {
    Get.toNamed(MyRoute.foodSignIn);
  }

}
