import 'package:get/get.dart';

class FoodOffer {
  String name = '';
  String image = '';
  String description = '';
  RxBool isClaimed = false.obs;

  FoodOffer.fromJson(Map<String, dynamic> json) {
    if (json['name'] != null) {
      name = json['name'];
    }
    if (json['image'] != null) {
      image = json['image'];
    }

    if (json['description'] != null) {
      description = json['description'];
    }
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    if (data['name'] != null) {
      data['name'] = name;
    }
    if (data['image'] != null) {
      data['image'] = image;
    }

    if (data['description'] != null) {
      data['description'] = description;
    }
    return data;
  }
}
