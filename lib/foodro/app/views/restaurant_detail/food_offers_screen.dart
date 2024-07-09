import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:foodro/foodro/app/model/food_offers.dart';
import 'package:foodro/foodro/widgets/food_app_widget.dart';
import 'package:get/get.dart';
import 'package:nb_utils/nb_utils.dart';

import '../../../constant/food_colors.dart';
import '../../../constant/food_strings.dart';
import '../../../food_theme/food_theme.dart';

class FoodOffersScreen extends StatefulWidget {
  const FoodOffersScreen({super.key});

  @override
  FoodOfferScreenState createState() => FoodOfferScreenState();
}

class FoodOfferScreenState extends State<FoodOffersScreen> {
  late ThemeData theme;

  @override
  void initState() {
    super.initState();
    theme = Get.isDarkMode ? FoodTheme.foodDarkTheme : FoodTheme.foodLightTheme;
  }

  List<FoodOffer> offerList = [];

  Future<List<FoodOffer>> getOfferList() async {
    offerList.clear();
    await Future.delayed(const Duration(seconds: 1));
    String jsonData = await rootBundle
        .loadString("assets/foodro/data/discount_offers.json");
    dynamic data = json.decode(jsonData);
    List<dynamic> jsonArray = data['offers_list'];
    for (int i = 0; i < jsonArray.length; i++) {
      offerList.add(FoodOffer.fromJson(jsonArray[i]));
    }

    return offerList;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: theme.scaffoldBackgroundColor,
      appBar: fdCommonAppBarWidget(context, titleText: offersAreAvailable),
      body: SafeArea(
        child: FutureBuilder<List<FoodOffer>>(
          future: getOfferList(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(
                  color: foodColorPrimary,
                ),
              );
            } else if (snapshot.hasError) {
              return Text('Error: ${snapshot.error}');
            } else if (offerList.isEmpty) {
              return const Text(noDataAvailable);
            } else {
              return ListView.builder(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                physics: const NeverScrollableScrollPhysics(),
                itemCount: offerList.length,
                shrinkWrap: true,
                scrollDirection: Axis.vertical,
                itemBuilder: (context, index) {
                  FoodOffer foodOffer = offerList[index];
                  return Padding(
                    padding: const EdgeInsets.only(top: 10.0),
                    child: Card(
                      child: Container(
                        padding: const EdgeInsets.all(10),
                        width: double.infinity,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            commonCacheImageWidget(foodOffer.image, 80,
                                width: 80),
                            5.width,
                            Expanded(
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    foodOffer.name,
                                    overflow: TextOverflow.ellipsis,
                                    style: theme.textTheme.bodyMedium?.copyWith(
                                      fontWeight: FontWeight.w900,
                                    ),
                                  ),
                                  Text(
                                    foodOffer.description,
                                    overflow: TextOverflow.ellipsis,
                                    style: theme.textTheme.bodySmall?.copyWith(
                                      color: Get.isDarkMode
                                          ? colorGrey300
                                          : colorGrey800,
                                      fontWeight: FontWeight.w900,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            8.width,
                            Obx(
                              () => InkWell(
                                onTap: () {
                                  if (foodOffer.isClaimed.value == false) {
                                    foodOffer.isClaimed.value =
                                        !foodOffer.isClaimed.value;
                                  }
                                },
                                child: Container(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 10, vertical: 5),
                                  decoration: BoxDecoration(
                                      border: Border.all(
                                          color: (foodOffer.isClaimed.value)
                                              ? foodColorPrimary
                                              : Colors.transparent),
                                      borderRadius: BorderRadius.circular(20),
                                      color: (foodOffer.isClaimed.value)
                                          ? Colors.transparent
                                          : foodColorPrimary),
                                  child: Text(
                                    (foodOffer.isClaimed.value)
                                        ? claimed
                                        : claim,
                                    overflow: TextOverflow.ellipsis,
                                    style: theme.textTheme.bodySmall?.copyWith(
                                      color: (foodOffer.isClaimed.value)
                                          ? foodColorPrimary
                                          : Colors.white,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  );
                },
              );
            }
          },
        ),
      ),
    );
  }
}
