import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:foodro/foodro/app/model/special_offer.dart';
import 'package:get/get.dart';

class FoodSpecialOfferController extends GetxController {
  RxList<SpecialOffer> offerList = <SpecialOffer>[].obs;

  Future<List<SpecialOffer>> getSpecialoffer() async {
    offerList.clear();
    await Future.delayed(const Duration(seconds: 1));
    String jsonData = await rootBundle
        .loadString("assets/foodro/data/special_offer_list.json");
    dynamic data = json.decode(jsonData);
    List<dynamic> jsonArray = data['special_offer_list'];
    for (int i = 0; i < jsonArray.length; i++) {
      offerList.add(SpecialOffer.fromJson(jsonArray[i]));
    }

    return offerList;
  }
}
