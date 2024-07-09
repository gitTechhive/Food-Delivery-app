import 'package:get/get.dart';

class InviteFriends {
  String image = "";
  String name = "";
  String phoneNumber = "";
  RxBool isInvited = false.obs;

  InviteFriends.fromJson(Map<String, dynamic> json) {
    if (json['image'] != null) {
      image = json['image'];
    }
    if (json['name'] != null) {
      name = json['name'];
    }
    if (json['phoneNumber'] != null) {
      phoneNumber = json['phoneNumber'];
    }
  }
}
