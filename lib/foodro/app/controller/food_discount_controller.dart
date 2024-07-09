import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:foodro/foodro/app/model/food_discount.dart';
import 'package:get/get.dart';

class FoodDiscountController extends GetxController {
  RxList<FoodDiscount> listOfDiscount = <FoodDiscount>[].obs;

  RxInt selectedIndex = 0.obs;

 /* @override
  void onReady() {
    getDiscountList();
    super.onReady();
  }*/

  Future<List<FoodDiscount>> getDiscountList() async {
    listOfDiscount.clear();
    await Future.delayed(const Duration(seconds: 1));
    String jsonData = await rootBundle
        .loadString("assets/foodro/data/discount_offers.json");
    dynamic data = json.decode(jsonData);
    List<dynamic> jsonArray = data['offers_list'];
    for (int i = 0; i < jsonArray.length; i++) {
      listOfDiscount.add(FoodDiscount.fromJson(jsonArray[i]));
    }
    return listOfDiscount;
  }
}
