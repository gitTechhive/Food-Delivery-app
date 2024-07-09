import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:foodro/foodro/constant/food_colors.dart';
import 'package:foodro/foodro/constant/food_strings.dart';
import 'package:foodro/foodro/widgets/food_common_button.dart';
import 'package:get/get.dart';
import 'package:nb_utils/nb_utils.dart';

import '../../../constant/food_images.dart';
import '../../../food_theme/food_theme.dart';


class FoodFilterBottomSheet extends StatefulWidget {
  const FoodFilterBottomSheet({super.key});

  @override
  FoodFilterBottomSheetState createState() => FoodFilterBottomSheetState();
}

class FoodFilterBottomSheetState extends State<FoodFilterBottomSheet> {
  int selectedSortByIndex = 0;
  int selectedRestaurantIndex = 0;
  int selectedDeliveryFeeIndex = 1;
  int selectedModeIndex = 1;

  List<String> sortByOptions = [recommended, popularity, rating, distance];
  List<String> restaurantOptions = [
    promo,
    priorityRestaurant,
    smallMSMERestaurant
  ];
  List<String> deliveryFeeOptions = [any, lessThan2, lessThan4, lessThan8];
  List<String> modeOptions = [delivery, selfPickup];
  List<String> cuisinesOptions = [
    'Dessert',
    'Beverages',
    'Snack',
    'Chicken',
    'Beverages',
    'Bakery & Cake',
    'Breakfast',
    'Chinese',
    'Japanese',
    'Fast Food',
    'Noodles',
    'Seafood',
    'Pizza & Pasta',
    'Hamburger',
    'Lunch'
  ];
  final List<bool> _checked = [
    true,
    false,
    true,
    true,
    true,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false
  ];

  late ThemeData theme;

  @override
  void initState() {
    super.initState();
    theme = Get.isDarkMode ? FoodTheme.foodDarkTheme : FoodTheme.foodLightTheme;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Get.isDarkMode ? foodBorderDark : foodBorderColor,
      bottomNavigationBar: Container(
        color: Get.isDarkMode ? foodCardDark : Colors.white,
        height: 100,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                  child: FoodCommonButton(
                onPressed: () {
                  Get.back();
                },
                text: reset,
                height: 58,
                bgColor: Get.isDarkMode ? foodBorderDark : foodPrimaryColor100,
                textColor: Get.isDarkMode ? whiteColor : foodColorPrimary,
              )),
              15.width,
              Expanded(
                  child: FoodCommonButton(
                      onPressed: () {
                        Get.back();
                      }, text: apply, height: 58)),
            ],
          ),
        ),
      ),
      appBar: AppBar(
        title: Text(
          filter,
          style: theme.textTheme.headlineSmall?.copyWith(
            fontWeight: FontWeight.bold,
          ),
        ),
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: SvgPicture.asset(
            cancelIcon,
            width: 14,
            height: 14,
            colorFilter: ColorFilter.mode(
                Get.isDarkMode ? Colors.white : Colors.black, BlendMode.srcIn),
          ),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.only(top: MediaQuery.of(context).viewPadding.top),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                10.height,
                Divider(
                  height: 1,
                  thickness: 1,
                  color: Get.isDarkMode ? foodBorderDark : foodBorderColor,
                ),
                20.height,
                _buildSortByCard(),
                20.height,
                _buildRestaurantFeeCard(),
                20.height,
                _buildDeliveryFeeCard(),
                20.height,
                _buildModeCard(),
                20.height,
                _buildCuisinesCard(),
                20.height,
              ],
            ),
          ),
        ),
      ),
    );
  }

  _buildSortByCard() {
    return Card(
      elevation: 5,
      margin: const EdgeInsets.symmetric(horizontal: 20),
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              sortBy,
              style: theme.textTheme.bodyLarge?.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
            10.height,
            Divider(
              height: 1,
              thickness: 1,
              color: Get.isDarkMode ? foodBorderDark : foodBorderColor,
            ),
            10.height,
            ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: sortByOptions.length,
              itemBuilder: (BuildContext context, int index) {
                return RadioListTile<int>(
                  activeColor: foodColorPrimary,
                  contentPadding: EdgeInsets.zero,
                  title: Text(sortByOptions[index],
                      style: theme.textTheme.bodyMedium?.copyWith(
                        fontWeight: FontWeight.w600,
                      )),
                  value: index,
                  groupValue: selectedSortByIndex,
                  onChanged: (int? value) {
                    setState(() {
                      selectedSortByIndex = value!;
                    });
                  },
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  _buildRestaurantFeeCard() {
    return Card(
      elevation: 5,
      margin: const EdgeInsets.symmetric(horizontal: 20),
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              restaurant,
              style: theme.textTheme.bodyLarge?.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
            10.height,
            Divider(
              height: 1,
              thickness: 1,
              color: Get.isDarkMode ? foodBorderDark : foodBorderColor,
            ),
            10.height,
            ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: restaurantOptions.length,
              itemBuilder: (BuildContext context, int index) {
                return RadioListTile<int>(
                  activeColor: foodColorPrimary,
                  contentPadding: EdgeInsets.zero,
                  title: Text(restaurantOptions[index],
                      style: theme.textTheme.bodyMedium?.copyWith(
                        fontWeight: FontWeight.w600,
                      )),
                  value: index,
                  groupValue: selectedRestaurantIndex,
                  onChanged: (int? value) {
                    setState(() {
                      selectedRestaurantIndex = value!;
                    });
                  },
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  _buildDeliveryFeeCard() {
    return Card(
      elevation: 5,
      margin: const EdgeInsets.symmetric(horizontal: 20),
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              deliveryFee,
              style: theme.textTheme.bodyLarge?.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
            10.height,
            Divider(
              height: 1,
              thickness: 1,
              color: Get.isDarkMode ? foodBorderDark : foodBorderColor,
            ),
            10.height,
            ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: deliveryFeeOptions.length,
              itemBuilder: (BuildContext context, int index) {
                return RadioListTile<int>(
                  activeColor: foodColorPrimary,
                  contentPadding: EdgeInsets.zero,
                  title: Text(deliveryFeeOptions[index],
                      style: theme.textTheme.bodyMedium?.copyWith(
                        fontWeight: FontWeight.w600,
                      )),
                  value: index,
                  groupValue: selectedDeliveryFeeIndex,
                  onChanged: (int? value) {
                    setState(() {
                      selectedDeliveryFeeIndex = value!;
                    });
                  },
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  _buildModeCard() {
    return Card(
      elevation: 5,
      margin: const EdgeInsets.symmetric(horizontal: 20),
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              mode,
              style: theme.textTheme.bodyLarge?.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
            10.height,
            Divider(
              height: 1,
              thickness: 1,
              color: Get.isDarkMode ? foodBorderDark : foodBorderColor,
            ),
            10.height,
            ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: modeOptions.length,
              itemBuilder: (BuildContext context, int index) {
                return RadioListTile<int>(
                  activeColor: foodColorPrimary,
                  contentPadding: EdgeInsets.zero,
                  title: Text(modeOptions[index],
                      style: theme.textTheme.bodyMedium
                          ?.copyWith(fontWeight: FontWeight.w600)),
                  value: index,
                  groupValue: selectedModeIndex,
                  onChanged: (int? value) {
                    setState(() {
                      selectedModeIndex = value!;
                    });
                  },
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  _buildCuisinesCard() {
    return Card(
      elevation: 5,
      margin: const EdgeInsets.symmetric(horizontal: 20),
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              cuisines,
              style: theme.textTheme.bodyLarge?.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
            10.height,
            Divider(
              height: 1,
              thickness: 1,
              color: Get.isDarkMode ? foodBorderDark : foodBorderColor,
            ),
            10.height,
            ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: cuisinesOptions.length,
              itemBuilder: (BuildContext context, int index) {
                return CheckboxListTile(
                  contentPadding: EdgeInsets.zero,
                  controlAffinity: ListTileControlAffinity.leading,
                  activeColor: foodColorPrimary,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20)),
                  title: Text(
                    cuisinesOptions[index],
                    style: theme.textTheme.bodyMedium
                        ?.copyWith(fontWeight: FontWeight.w600),
                  ),
                  value: _checked[index],
                  onChanged: (bool? value) {
                    setState(() {
                      _checked[index] = value!;
                    });
                  },
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
