import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:foodro/foodro/app/model/food_menu.dart';
import 'package:get/get.dart';

class FoodCheckoutController extends GetxController {
  RxList<FoodMenu> orderList = <FoodMenu>[].obs;


  Future<List<FoodMenu>> getOrderList() async {
    orderList.clear();
    await Future.delayed(const Duration(seconds: 1));
    String jsonData = await rootBundle
        .loadString("assets/foodro/data/order_list.json");
    dynamic data = json.decode(jsonData);
    List<dynamic> jsonArray = data['order_list'];
    for (int i = 0; i < jsonArray.length; i++) {
      orderList.add(FoodMenu.fromJson(jsonArray[i]));
    }

    return orderList;
  }
}
