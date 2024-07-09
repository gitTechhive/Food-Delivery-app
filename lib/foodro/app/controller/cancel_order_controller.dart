import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class FoodCancelOrderController extends GetxController {
  var selectedReason = "Waiting for long time".obs;
  TextEditingController reasonController = TextEditingController();
  FocusNode f1 = FocusNode();

  List<String> reasonList = [
    "Waiting for long time",
    "Unable to contact driver",
    "Driver denied to go to destination",
    "Driver denied to come to pickup",
    "Wrong address shown",
    "The price is not reasonable",
    "I want to order another restaurant",
    "I just want to cancel",
    // Add more payment methods as needed
  ];

  void selectPayment(String reason) {
    selectedReason.value = reason;
  }
}
