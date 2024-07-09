import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../theme/theme_controller.dart';

class FoodSettingController extends GetxController {
  bool isNotification = false;
  bool isDarkMode = false;
  bool isEmailNotification = false;

  final ThemeController themeController = Get.put(ThemeController());
  late BuildContext context;

  FoodSettingController({required this.context});

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    isDarkMode = themeController.isDarkMode;
  }
}
