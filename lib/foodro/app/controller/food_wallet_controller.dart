import 'dart:convert';


import 'package:flutter/services.dart';
import 'package:foodro/foodro/app/model/food_transaction.dart';
import 'package:get/get.dart';

class FoodWalletController extends GetxController {
  RxList<FoodTransaction> transactionList = <FoodTransaction>[].obs;



  Future<List<FoodTransaction>> getTransactions() async {
    transactionList.clear();
    // await Future.delayed(const Duration(seconds: 1));
    String jsonData = await rootBundle
        .loadString("assets/foodro/data/transaction_list.json");
    dynamic data = json.decode(jsonData);
    List<dynamic> jsonArray = data['transaction_list'];
    for (int i = 0; i < jsonArray.length; i++) {
      transactionList.add(FoodTransaction.fromJson(jsonArray[i]));
    }

    return transactionList;
  }
}
