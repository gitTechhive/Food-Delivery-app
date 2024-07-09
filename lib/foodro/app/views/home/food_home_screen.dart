import 'package:flutter/material.dart';
import 'package:foodro/foodro/app/controller/food_home_controller.dart';
import 'package:foodro/foodro/app/model/food_category.dart';
import 'package:foodro/foodro/widgets/food_custom_see_more_text.dart';
import 'package:foodro/foodro/widgets/food_home_appbar.dart';

import '../../../../route/my_route.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nb_utils/nb_utils.dart';

import '../../../constant/food_colors.dart';
import '../../../constant/food_images.dart';
import '../../../constant/food_strings.dart';
import '../../../food_theme/food_theme.dart';
import '../../../widgets/food_app_widget.dart';
import '../../model/restaurant.dart';
import '../../model/special_offer.dart';
import 'discounted_restaurant_view.dart';
import 'food_category_view.dart';
import 'food_recommened_view.dart';
import 'food_restaurant_list_view.dart';

class FoodHomeScreen extends StatefulWidget {
  const FoodHomeScreen({super.key});

  @override
  FoodHomeScreenState createState() => FoodHomeScreenState();
}

class FoodHomeScreenState extends State<FoodHomeScreen> {
  late FoodHomeController controller;

  late ThemeData theme;

  @override
  void initState() {
    super.initState();
    controller = Get.put(FoodHomeController());
    theme = Get.isDarkMode ? FoodTheme.foodDarkTheme : FoodTheme.foodLightTheme;
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<FoodHomeController>(
        init: controller,
        tag: 'food_home',
        // theme: theme,
        builder: (controller) {
          return Scaffold(
              backgroundColor: theme.scaffoldBackgroundColor,
              appBar: const FoodAppBar(),
              body: SingleChildScrollView(
                child: Column(
                  children: [
                    GestureDetector(
                      onTap: () {
                        Get.toNamed(MyRoute.foodDefaultSearch,arguments: controller.searchController.text);
                      },
                      child: AbsorbPointer(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 20.0, vertical: 10.0),
                          child: TextFormField(
                            style: theme.textTheme.bodyLarge?.copyWith(
                              fontWeight: FontWeight.w600,
                              color: Get.isDarkMode
                                  ? whiteColor
                                  : foodTextColor, // Set your desired text color
                            ),
                            textInputAction: TextInputAction.search,
                            keyboardType: TextInputType.text,
                            focusNode: controller.f1,
                            onFieldSubmitted: (v) {
                              controller.f1.unfocus();

                            },
                            validator: (k) {
                              return null;
                            },
                            controller: controller.searchController,
                            decoration: inputDecoration(context,
                                prefixIconColor: colorGrey500,
                                borderColor:
                                    Get.isDarkMode ? foodCardDark : colorGrey50,
                                fillColor:
                                    Get.isDarkMode ? foodCardDark : colorGrey50,
                                hintColor: Get.isDarkMode
                                    ? whiteColor.withOpacity(0.60)
                                    : foodTextColor.withOpacity(0.60),
                                prefixIcon: searchIcon,
                                borderRadius: textFieldRadius,
                                hintText: whatAreYouCraving),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: FoodCustomTextSeeMore(
                        title: specialOffers,
                        onPressed: () {
                          Get.toNamed(MyRoute.foodSpecialOffer);
                        },
                        theme: theme,
                      ),
                    ),
                    Obx(()=>(controller.offerList.isNotEmpty) ? _buildSpecialOfferWidget() : const Wrap(),),

                    25.height,
                    _buildCategoryList(),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20.0),
                      child: FoodCustomTextSeeMore(
                          title: discountGuaranteed,
                          onPressed: () {},
                          theme: theme),
                    ),
                    _buildDiscountedList(),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20.0),
                      child: FoodCustomTextSeeMore(
                          title: recommendedForYou,
                          onPressed: () {
                            Get.toNamed(MyRoute.foodRecommended);
                          },
                          theme: theme),
                    ),
                    _buildRecommendedList(),
                    _buildRestaurantList(),
                  ],
                ),
              ));
        });
  }

  _buildSpecialOfferWidget() {
    SpecialOffer offer = controller.offerList[0];
    return Stack(
      alignment: Alignment.centerLeft,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric( horizontal: 20),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(36),
            child: commonCacheImageWidget(offer.image, 181,
                width: double.infinity, fit: BoxFit.cover),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 45.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                offer.discount,
                style: theme.textTheme.displayLarge?.copyWith(
                    fontWeight: FontWeight.w500,
                    fontSize: 60,
                    height: 1.1,
                    fontFamily: GoogleFonts.luckiestGuy().fontFamily,
                    color: Colors.white),
              ),
              Text(
                'discount only',
                style: theme.textTheme.titleLarge?.copyWith(
                    fontWeight: FontWeight.w500,
                    fontSize: 17,
                    fontFamily: GoogleFonts.luckiestGuy().fontFamily,
                    color: Colors.white),
              ),
              Text(
                offer.validity,
                style: theme.textTheme.titleLarge?.copyWith(
                    fontWeight: FontWeight.w500,
                    fontSize: 17,
                    fontFamily: GoogleFonts.luckiestGuy().fontFamily,
                    color: Colors.white),
              ),
            ],
          ),
        ),
      ],
    );
  }

  _buildCategoryList() {
    return Obx(
      () => Container(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: controller.allCategories.length,
            itemBuilder: (ctx, i) {
              FoodCategory cat = controller.allCategories[i];
              return CategoryViewScreenState(
                category: cat,
                onPressed: () {
                  if (cat.name == 'more') {
                    Get.toNamed(MyRoute.foodMoreCat);
                  } else {
                    Get.toNamed(MyRoute.foodRestaurantList,
                        arguments: {'id': cat.id, 'name': cat.name});
                  }
                },
              );
            },
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 4,
                crossAxisSpacing: 5.0,
                mainAxisSpacing: 5.0,
                mainAxisExtent: 100),
          )),
    );
  }

  _buildDiscountedList() {
    return Obx(
      () => Padding(
        padding: const EdgeInsets.only(left: 20.0, top: 20.0, bottom: 20.0),
        child: HorizontalList(
          padding: EdgeInsets.zero,
          itemCount: controller.discountedRestaurantList.length,
          itemBuilder: (context, index) {
            FoodRestaurant foodRestaurant =
                controller.discountedRestaurantList[index];
            return FoodDiscountedRestaurantListView(
              onPressed: () {
                Get.toNamed(MyRoute.foodRestaurantDetail);
              },
              restaurant: foodRestaurant,
              theme: theme,
            );
          },
        ),
      ),
    );
  }

  _buildRecommendedList() {
    return Obx(
      () => Padding(
        padding: const EdgeInsets.only(left: 20.0, top: 20.0, bottom: 20.0),
        child: HorizontalList(
          padding: EdgeInsets.zero,
          itemCount: controller.recommendedList.length,
          itemBuilder: (context, index) {
            FoodCategory foodCategory = controller.recommendedList[index];
            return Obx(
              () => RecommendedView(
                selectedIndex: controller.selectedIndex.value,
                index: index,
                onPressed: () {
                  controller.toggleSelection(index);
                },
                category: foodCategory,
                theme: theme,
              ),
            );
          },
        ),
      ),
    );
  }

  _buildRestaurantList() {
    return Center(
        child: FutureBuilder<List<FoodRestaurant>>(
      future: controller.getRestaurantListByCatId(
          controller.recommendedList.isEmpty
              ? 999
              : controller.recommendedList[controller.selectedIndex.value].id),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const CircularProgressIndicator(
            color: foodColorPrimary,
          );
        } else if (snapshot.hasError) {
          return Text('Error: ${snapshot.error}');
        } else {
          return Obx(
            () => controller.restaurantList.isEmpty
                ? const Text(noDataAvailable)
                : ListView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: controller.restaurantList.length,
                    shrinkWrap: true,
                    scrollDirection: Axis.vertical,
                    itemBuilder: (context, index) {
                      FoodRestaurant restaurant =
                          controller.restaurantList[index];
                      return FoodRestaurantListView(
                        onPressed: () {
                          Get.toNamed(MyRoute.foodRestaurantDetail);
                        },
                        restaurant: restaurant,
                        theme: theme,
                      );
                    },
                  ),
          );
        }
      },
    ));
  }
}
