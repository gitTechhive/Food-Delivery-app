import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:foodro/foodro/app/model/message_data.dart';
import 'package:get/get.dart';

class FoodChatController extends GetxController {
  RxList<MessageData> messageList = <MessageData>[].obs;
  TextEditingController textController = TextEditingController();
  FocusNode f1 = FocusNode();

  @override
  void onReady() {
    super.onReady();
    getMessages();
  }

  Future<List<MessageData>> getMessages() async {
    messageList.clear();
    // await Future.delayed(const Duration(seconds: 1));
    String jsonData = await rootBundle
        .loadString("assets/foodro/data/message_list.json");
    dynamic data = json.decode(jsonData);
    List<dynamic> jsonArray = data['message_list'];
    for (int i = 0; i < jsonArray.length; i++) {
      messageList.add(MessageData.fromJson(jsonArray[i]));
    }

    return messageList;
  }

  void addMessage(String message) {
    messageList.add(MessageData(
        message: message,
        image: '',
        isSender: true,
        images: [],
        dateTime: DateTime.now()));
  }
}
