import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nb_utils/nb_utils.dart';

import '../../../../route/my_route.dart';

class FoodDefaultSearchController extends GetxController {
  TextEditingController searchController = TextEditingController();
  final searchText = ''.obs;

  FocusNode f1 = FocusNode();

  final recentSearchList = <String>[].obs;
  final popularSearchList = <String>[
    "Breakfast",
    "Snack",
    "Fast Food",
    "Beverages",
    "Chicken",
    "Noodles",
    "Rice",
    "Seafood"
  ].obs;
  final allCuisinesSearchList = <String>[
    "Bakery & Cake",
    "Dessert",
    "Pizza",
  ].obs;

  void search(String query) {
    searchText.value = query;
  }

  void goToSearchResultScreen(String searchText) {
    addSearch(searchText);
    Get.offNamed(
      MyRoute.foodSearchResult,
      arguments: searchText,
    );
  }

  @override
  void onInit() {
    // searchController.text = Get.arguments ?? '';
    _loadRecentSearches();
    super.onInit();
  }

  Future<void> _loadRecentSearches() async {
    recentSearchList.clear();
    List<String> searches = await getSearchesFromPref();
    recentSearchList.addAll(searches);
  }

  Future<void> addSearch(String search) async {
    await addSearchToPref(search);
    searchController.clear();
    _loadRecentSearches();
  }

  static const String _key = 'recent_searches';

  Future<void> addSearchToPref(String search) async {
    final prefs = await SharedPreferences.getInstance();
    List<String> searches = prefs.getStringList(_key) ?? [];
    if (searches.contains(search)) {
      searches.remove(search);
    }
    searches.insert(0, search);
    await prefs.setStringList(_key, searches);
  }

  Future<List<String>> getSearchesFromPref() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getStringList(_key) ?? [];
  }

  Future<void> clearSearches() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(_key);
  }
}
