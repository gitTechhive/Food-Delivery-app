import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FoodMenuDetailController extends GetxController {

  TextEditingController noteController = TextEditingController();
  FocusNode f1 = FocusNode();

  RxInt quantity = 1.obs;

  void increment() {
    quantity.value++;
  }

  void decrement() {
    if (quantity.value > 1) {
      quantity.value--;
    }
  }
}
