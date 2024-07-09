import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../../../../route/my_route.dart';
import '../../widgets/food_app_widget.dart';
import '../model/countries.dart';

class FoodProfileController extends GetxController {
  final phoneNumber = ''.obs;

  TextEditingController phoneController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController fullnameController = TextEditingController();
  TextEditingController nickNameController = TextEditingController();
  TextEditingController dateOfBirthController = TextEditingController();
  bool rememberMe = false;

  FocusNode f1 = FocusNode();
  FocusNode f2 = FocusNode();
  FocusNode f3 = FocusNode();
  FocusNode f4 = FocusNode();
  FocusNode f5 = FocusNode();
  FocusNode f6 = FocusNode();

  final formKey = GlobalKey<FormState>();

  void goToNextScreen() {
    Get.toNamed(MyRoute.foodLocation);
  }

  var selectedGender = Gender.male.obs;

  void updateSelectedGender(Gender gender) {
    selectedGender.value = gender;
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
