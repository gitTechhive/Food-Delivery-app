import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:foodro/foodro/app/model/food_menu.dart';
import 'package:get/get.dart';

class FoodOrderHistoryController extends GetxController {
  List<FoodMenu> activeOrdersList = <FoodMenu>[].obs;
  List<FoodMenu> cancelledOrdersList = <FoodMenu>[].obs;
  List<FoodMenu> completedOrdersList = <FoodMenu>[].obs;

  Future<List<FoodMenu>> getActiveOrderList() async {
    activeOrdersList.clear();
    await Future.delayed(const Duration(seconds: 1));
    String jsonData = await rootBundle
        .loadString("assets/foodro/data/order_history_list.json");
    dynamic data = json.decode(jsonData);
    List<dynamic> jsonArray = data['order_history_list'];
    for (int i = 0; i < jsonArray.length; i++) {
      if (jsonArray[i]['status'] == 'Active') {
        activeOrdersList.add(FoodMenu.fromJson(jsonArray[i]));
      }
    }

    return activeOrdersList;
  }

  Future<List<FoodMenu>> getCancelledOrderList() async {
    cancelledOrdersList.clear();
    await Future.delayed(const Duration(seconds: 1));
    String jsonData = await rootBundle
        .loadString("assets/foodro/data/order_history_list.json");
    dynamic data = json.decode(jsonData);
    List<dynamic> jsonArray = data['order_history_list'];
    for (int i = 0; i < jsonArray.length; i++) {
      if (jsonArray[i]['status'] == 'Cancelled') {
        cancelledOrdersList.add(FoodMenu.fromJson(jsonArray[i]));
      }
    }

    return cancelledOrdersList;
  }

  Future<List<FoodMenu>> getCompletedOrderList() async {
    completedOrdersList.clear();
    await Future.delayed(const Duration(seconds: 1));
    String jsonData = await rootBundle
        .loadString("assets/foodro/data/order_history_list.json");
    dynamic data = json.decode(jsonData);
    List<dynamic> jsonArray = data['order_history_list'];
    for (int i = 0; i < jsonArray.length; i++) {
      if (jsonArray[i]['status'] == 'Completed') {
        completedOrdersList.add(FoodMenu.fromJson(jsonArray[i]));
      }
    }

    return completedOrdersList;
  }
}
