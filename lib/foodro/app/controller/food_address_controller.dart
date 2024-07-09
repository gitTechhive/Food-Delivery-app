import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:foodro/foodro/app/model/food_delivery_address.dart';
import 'package:get/get.dart';

class FoodAddressController extends GetxController {
  RxList<FoodDeliveryAddress> addressList = <FoodDeliveryAddress>[].obs;

  RxInt selectedIndex = 0.obs;
  String isFromProfileScreen = Get.arguments ?? '';

  @override
  void onReady() {
    getAddressList();
    super.onReady();
  }

  Future<List<FoodDeliveryAddress>> getAddressList() async {
    addressList.clear();
    await Future.delayed(const Duration(seconds: 1));
    String jsonData = await rootBundle
        .loadString("assets/foodro/data/address.json");
    dynamic data = json.decode(jsonData);
    List<dynamic> jsonArray = data['address_list'];
    for (int i = 0; i < jsonArray.length; i++) {
      addressList.add(FoodDeliveryAddress.fromJson(jsonArray[i]));
    }
    return addressList;
  }
}
