import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:foodro/foodro/app/model/notification.dart';
import 'package:get/get.dart';

class FoodNotificationController extends GetxController {
  RxList<FoodNotification> notificationList = <FoodNotification>[].obs;


  Future<List<FoodNotification>> getNotificationList() async {
    notificationList.clear();
    await Future.delayed(const Duration(seconds: 1));
    String jsonData = await rootBundle
        .loadString("assets/foodro/data/notification_list.json");
    dynamic data = json.decode(jsonData);
    List<dynamic> jsonArray = data['notification_list'];
    for (int i = 0; i < jsonArray.length; i++) {
      notificationList.add(FoodNotification.fromJson(jsonArray[i]));
    }
    return notificationList;
  }
}
