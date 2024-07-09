import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../route/my_route.dart';

class FoodOtpController extends GetxController {
  final List<FocusNode> focusNodes = List.generate(4, (index) => FocusNode());
  final RxList<String> otpValues = List.generate(4, (index) => '').obs;

  final formKey = GlobalKey<FormState>();

  List<FocusNode> nodes = [];
  List<TextEditingController> listController = [];

  bool validateOtp() {
    for (int i = 0; i < otpValues.length; i++) {
      if (otpValues[i].isEmpty) {
        Get.snackbar('Error', 'Please enter all digits');
        return false;
      }
    }
    return true;
  }

  void goToNextScreen() {
    Get.offNamedUntil(MyRoute.foodHome,(route) => false,);
  }
}
