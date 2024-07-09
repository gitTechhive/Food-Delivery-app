
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:foodro/foodro/app/model/countries.dart';
import 'package:get/get.dart';

import '../../../../route/my_route.dart';


class FoodSignInController extends GetxController {
  final phoneNumber = ''.obs;

  TextEditingController phoneController = TextEditingController();
  bool rememberMe = false;

  FocusNode f1 = FocusNode();

  final formKey = GlobalKey<FormState>();

  void goToSignupScreen() {
    Get.toNamed(MyRoute.foodSignup);
  }

  void goToOtpScreen() {
    Get.toNamed(MyRoute.foodOtp);
  }

  RxList<FoodCountries> listOfCountries = <FoodCountries>[].obs;

  Future<List<FoodCountries>> getCountryList() async {
    listOfCountries.clear();
    String jsonData = await rootBundle
        .loadString("assets/foodro/data/country_list.json");
    dynamic data = json.decode(jsonData);
    List<dynamic> jsonArray = data['country_list'];

    for (int i = 0; i < jsonArray.length; i++) {
      listOfCountries.add(FoodCountries.fromJson(jsonArray[i]));
    }
    return listOfCountries;
  }

  var selectedCountryCode =
      FoodCountries(code: 'IN', name: 'India', dialCode: '+91').obs;

  var dropdownValue = ''.obs;
  RxList<String> genderList = <String>['Male', 'Female', 'Other'].obs;

  @override
  void onInit() {
    super.onInit();
    getCountryList();
  }
}
