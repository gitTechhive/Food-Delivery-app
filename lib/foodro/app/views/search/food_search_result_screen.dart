import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:foodro/foodro/app/controller/food_search_result_controller.dart';
import 'package:foodro/foodro/app/model/restaurant.dart';
import 'package:foodro/foodro/constant/food_images.dart';
import 'package:foodro/foodro/widgets/food_app_widget.dart';
import 'package:get/get.dart';
import 'package:nb_utils/nb_utils.dart';

import '../../../../../route/my_route.dart';
import '../../../constant/food_colors.dart';
import '../../../constant/food_strings.dart';
import '../../../food_theme/food_theme.dart';
import '../filter/food_filter_bottom_sheet.dart';
import '../home/food_restaurant_list_view.dart';
import '../home/food_resturant_list/food_sort_filter_view.dart';

class FoodSearchResultScreen extends StatefulWidget {
  const FoodSearchResultScreen({super.key});

  @override
  FoodSearchResultScreenState createState() => FoodSearchResultScreenState();
}

class FoodSearchResultScreenState extends State<FoodSearchResultScreen> {
  FoodSearchResultController controller = Get.put(FoodSearchResultController());

  late ThemeData theme;

  @override
  void initState() {
    super.initState();

    theme = Get.isDarkMode ? FoodTheme.foodDarkTheme : FoodTheme.foodLightTheme;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: theme.scaffoldBackgroundColor,
      appBar: _buildAppBar(),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.only(top: 10, bottom: 20),
          child: Column(
            children: [
              HorizontalList(
                itemCount: 1,
                padding: const EdgeInsets.only(left: 20, top: 10, bottom: 10),
                itemBuilder: (context, index) {
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      FoodSortFilterView(
                        name: filter,
                        iconName: filterIcon,
                        isIcon: true,
                        onPressed: () {
                          showModalBottomSheet(
                            useSafeArea: true,
                            isScrollControlled: true,
                            context: context,
                            builder: (BuildContext context) {
                              return SizedBox(
                                  height: MediaQuery.of(context).size.height,
                                  child: const FoodFilterBottomSheet());
                            },
                          );
                        },
                        theme: theme,
                      ),
                      10.width,
                      FoodSortFilterView(
                        name: sort,
                        iconName: sortIcon,
                        isIcon: true,
                        onPressed: () {},
                        theme: theme,
                      ),
                      10.width,
                      FoodSortFilterView(
                        name: promo,
                        iconName: '',
                        isIcon: false,
                        onPressed: () {},
                        theme: theme,
                      ),
                      10.width,
                      FoodSortFilterView(
                        name: selfPickup,
                        iconName: '',
                        isIcon: false,
                        onPressed: () {},
                        theme: theme,
                      ),
                      10.width,
                    ],
                  );
                },
              ),
              20.height,
              _buildPropertyList(),
            ],
          ),
        ),
      ),
    );
  }

  _buildAppBar() {
    return AppBar(
      toolbarHeight: 70,
      titleSpacing: 0,
      title: Padding(
        padding: const EdgeInsets.only(right: 20.0),
        child: TextFormField(
          style: theme.textTheme.bodyLarge?.copyWith(
            fontWeight: FontWeight.w400,
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
          onChanged: (value) {
            controller.filterSearchResults(value);
          },
          controller: controller.searchController,
          decoration: inputDecoration(context,
              prefixIcon: searchIcon,
              suffixWidget: InkWell(
                onTap: () {
                  controller.searchController.text = '';
                  controller.filterSearchResults(controller.searchController.text);
                },
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: SvgPicture.asset(
                    cancelIcon,
                    width: 10,
                    height: 10,
                    colorFilter: ColorFilter.mode(
                        Get.isDarkMode ? Colors.white : foodTextColor,
                        BlendMode.srcIn),
                  ),
                ),
              ),
              leftContentPadding: 5,
              bottomContentPadding: 15,
              rightContentPadding: 0,
              topContentPadding: 15,
              prefixIconColor:
              Get.isDarkMode ? whiteColor : colorGrey400,
              borderColor: Get.isDarkMode
                  ? foodCardDark
                  : colorGrey100,
              fillColor: Get.isDarkMode
                  ? foodCardDark
                  : colorGrey100,
              hintColor: Get.isDarkMode
                  ? whiteColor.withOpacity(0.60)
                  : foodTextColor.withOpacity(0.60),
              borderRadius: textFieldRadius,
              hintText: search),
        ),
      ),
    );
  }

  _buildPropertyList() {
    return FutureBuilder<List<FoodRestaurant>>(
      future: controller.filterSearchResults(controller.searchText),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(
            child: CircularProgressIndicator(
              color: Get.isDarkMode ? Colors.white : Colors.black,
            ),
          );
        } else if (snapshot.hasError) {
          return Center(child: Text('Error: ${snapshot.error}'));
        } else {
          return Obx(
            () => controller.filterRestaurantList.isEmpty
                ? _buildNoResultFound()
                : ListView.builder(
                    padding: EdgeInsets.zero,
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    scrollDirection: Axis.vertical,
                    itemCount: controller.filterRestaurantList.length,
                    itemBuilder: (context, index) {
                      FoodRestaurant data =
                          controller.filterRestaurantList[index];
                      return FoodRestaurantListView(
                        onPressed: () {
                          Get.toNamed(MyRoute.foodRestaurantDetail);
                        },
                        restaurant: data,
                        theme: theme,
                      );
                    },
                  ),
          );
        }
      },
    );
  }

  _buildNoResultFound() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(
            child: Image.asset(noSearchResultIcon,width:
              300,height: 250,),
          ),
          10.height,
          Text(
            notFound,
            style: theme.textTheme.headlineMedium
                ?.copyWith(fontWeight: FontWeight.w600),
          ),
          8.height,
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: Text(
              tryDifferentKeywords,
              textAlign: TextAlign.center,
              style: theme.textTheme.titleLarge?.copyWith(
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
