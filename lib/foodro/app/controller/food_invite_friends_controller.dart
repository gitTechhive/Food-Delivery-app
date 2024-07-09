import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:foodro/foodro/app/model/invite_friends.dart';
import 'package:get/get.dart';

class FoodInviteFriendsController extends GetxController {
  RxList<InviteFriends> friendsList = <InviteFriends>[].obs;

  Future<List<InviteFriends>> getFriendsList() async {
    friendsList.clear();
    await Future.delayed(const Duration(seconds: 1));
    String jsonData = await rootBundle.loadString(
        "assets/foodro/data/freinds_list.json");
    dynamic data = json.decode(jsonData);
    List<dynamic> jsonArray = data['friends_list'];
    for (int i = 0; i < jsonArray.length; i++) {
      friendsList.add(InviteFriends.fromJson(jsonArray[i]));
    }

    return friendsList;
  }
}
