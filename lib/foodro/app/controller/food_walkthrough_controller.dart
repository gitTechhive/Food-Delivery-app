
import 'package:flutter/cupertino.dart';
import 'package:foodro/foodro/constant/food_images.dart';
import 'package:foodro/foodro/constant/food_strings.dart';


import 'package:get/get.dart';

import '../../../../route/my_route.dart';
import '../../../../theme/theme_controller.dart';
import '../model/walkthrough_model.dart';



class FoodWalkthroughController extends GetxController {
  final PageController pageController = PageController();

  final ThemeController themeController = Get.put(ThemeController());
  late bool isDarkMode;
  @override
  void onInit() {
    super.onInit();
    isDarkMode = themeController.isDarkMode;
  }

  final _walkthroughs = [
    FoodWalkthrough(
      title: 'Order for Food',
      description: desc,
      image: walkThrough_1,
    ),
    FoodWalkthrough(
      title: 'Easy Payment',
      description: desc,
      image: walkThrough_2,
    ),
    FoodWalkthrough(
      title: 'Fast Delivery',
      description: desc,
      image: walkThrough_3,
    ),
  ];



  List<FoodWalkthrough> get walkthroughs => _walkthroughs;

  final _currentIndex = 0.obs;
  int get currentIndex => _currentIndex.value;

  set currentIndex(int value) => _currentIndex.value = value;


  void nextPage() {
    if (currentIndex < walkthroughs.length - 1) {
      currentIndex++;
      pageController.animateToPage(currentIndex, duration: const Duration(milliseconds: 300), curve: Curves.ease);
    } else {
      // Handle last page action, for example navigate to pet_home screen
      // Get.offAllNamed('/pet_home');
      goToNextScreen();
    }
  }

  void goToNextScreen() {
    Get.toNamed(MyRoute.foodWelcomeLogin);
  }
}
