import 'package:flutter/material.dart';
import 'package:foodro/foodro/app/model/faq_data.dart';
import 'package:foodro/foodro/constant/food_strings.dart';
import 'package:get/get.dart';

class FoodHelpCenterController extends GetxController {
  RxList<String> categoryList =
      ["General", "Account", "Service", "Payment"].obs;
  RxInt selectedIndex = 0.obs;

  TextEditingController searchController = TextEditingController();
  FocusNode f1 = FocusNode();

  void toggleSelection(int index) {
    selectedIndex.value = index;
  }

  RxList<bool> isExpandedList = <bool>[false, false, false, false, false].obs;

  void toggleExpansion(int index) {
    isExpandedList[index] = !isExpandedList[index];
  }

  final List<FaqData> faqs = [
    FaqData(
      question: 'What is Foodu?',
      answer: desc,
    ),
    FaqData(
      question: 'How I can make a payment?',
      answer: desc,
    ),
    FaqData(
      question: 'How do I can cancel orders?',
      answer: desc,
    ),
    FaqData(
      question: 'How do I can delete my account?',
      answer: desc,
    ),
    FaqData(
      question: 'How do I exit the app?',
      answer: desc,
    ),
  ];
}
