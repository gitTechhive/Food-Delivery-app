import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class FoodWalletTopUPController extends GetxController {
  TextEditingController amountController = TextEditingController(text: '\$50');
  FocusNode f1 = FocusNode();

  RxList<String> listOfAmount = <String>['\$10','\$20','\$50','\$100','\$200','\$250','\$500','\$750','\$1000'].obs;
}
