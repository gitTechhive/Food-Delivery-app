import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:foodro/foodro/app/model/chat_model.dart';
import 'package:get/get.dart';

class FoodMessageController extends GetxController {
  List<ChatData> messageList = <ChatData>[].obs;

  Future<List<ChatData>> getMessageList() async {
    messageList.clear();
    await Future.delayed(const Duration(seconds: 1));
    String jsonData = await rootBundle
        .loadString("assets/foodro/data/chat_list.json");
    dynamic data = json.decode(jsonData);
    List<dynamic> jsonArray = data['chat_list'];
    for (int i = 0; i < jsonArray.length; i++) {
      messageList.add(ChatData.fromJson(jsonArray[i]));
    }

    return messageList;
  }
}
