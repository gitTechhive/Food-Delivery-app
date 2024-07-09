import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:foodro/foodro/constant/food_strings.dart';
import 'package:foodro/foodro/food_theme/food_theme.dart';
import 'package:foodro/foodro/widgets/food_app_widget.dart';
import 'package:get/get.dart';
import 'package:nb_utils/nb_utils.dart';

import '../../../constant/food_colors.dart';
import '../../../constant/food_images.dart';
import '../../controller/food_default_search_controller.dart';

class FoodDefaultSearchScreen extends StatefulWidget {
  const FoodDefaultSearchScreen({super.key});

  @override
  FoodDefaultSearchScreenState createState() => FoodDefaultSearchScreenState();
}

class FoodDefaultSearchScreenState extends State<FoodDefaultSearchScreen> {
  FoodDefaultSearchController controller =
      Get.put(FoodDefaultSearchController());

  late ThemeData theme;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      FocusScope.of(context).requestFocus(controller.f1);
    });
    theme = Get.isDarkMode ? FoodTheme.foodDarkTheme : FoodTheme.foodLightTheme;
  }

  @override
  void dispose() {
    controller.f1.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: theme.scaffoldBackgroundColor,
      appBar: AppBar(
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
              controller
                  .goToSearchResultScreen(controller.searchController.text);
            },
            onChanged: controller.search,
            controller: controller.searchController,
            decoration: inputDecoration(context,
                prefixIcon: searchIcon,
                suffixWidget: InkWell(
                  onTap: () {
                    controller.searchController.text='';
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
                borderColor: foodColorPrimary,
                fillColor: foodColorPrimary.withOpacity(0.08),
                hintColor: colorGrey500,
                borderRadius: textFieldRadius,
                prefixIconColor: foodColorPrimary,
                hintText: search),
          ),
        ),
      ),
      body: SingleChildScrollView(
        // padding: const EdgeInsets.all(8.0),
        child: Container(
          margin: const EdgeInsets.symmetric(
            horizontal: 15,
          ),
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
              color: Get.isDarkMode ? foodCardDark : Colors.white,
              borderRadius: BorderRadius.circular(12)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildText(recentSearches),
              15.height,
              _buildRecentSearchList(),
              15.height,
              _buildText(popularCuisines),
              15.height,
              _buildPopularSearchList(),
              15.height,
              _buildText(allCuisines),
              15.height,
              _buildAllCuisinesSearchList(),
              8.height,
            ],
          ),
        ),
      ),
    );
  }

  _buildText(String data) {
    return Text(
      data,
      style:
          theme.textTheme.headlineSmall?.copyWith(fontWeight: FontWeight.w900),
    );
  }

  Widget _buildRecentSearchList() {
    return Obx(
      () => GridView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          crossAxisSpacing: 8,
          mainAxisSpacing: 8,
          childAspectRatio: 2, // Adjust this value to control the height
        ),
        itemCount: controller.recentSearchList.length,
        itemBuilder: (context, index) {
          final suggestion = controller.recentSearchList[index];
          return InkWell(
            onTap: () {
              controller.goToSearchResultScreen(suggestion);
            },
            child: Container(
              padding: const EdgeInsets.only(left: 5, right: 5),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  border: Border.all(color: foodColorPrimary)),
              child: Center(
                child: Text(
                  suggestion,
                  textAlign: TextAlign.center,
                  style: theme.textTheme.bodyLarge?.copyWith(
                      fontWeight: FontWeight.w600, color: foodColorPrimary),
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildPopularSearchList() {
    return Obx(
      () => GridView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          crossAxisSpacing: 8,
          mainAxisSpacing: 8,
          childAspectRatio: 2, // Adjust this value to control the height
        ),
        itemCount: controller.popularSearchList.length,
        itemBuilder: (context, index) {
          final suggestion = controller.popularSearchList[index];
          return InkWell(
            onTap: () {
              controller.goToSearchResultScreen(suggestion);
            },
            child: Container(
              padding: const EdgeInsets.only(left: 5, right: 5),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  border: Border.all(color: foodColorPrimary)),
              child: Center(
                child: Text(
                  suggestion,
                  textAlign: TextAlign.center,
                  style: theme.textTheme.bodyLarge?.copyWith(
                      fontWeight: FontWeight.w600, color: foodColorPrimary),
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildAllCuisinesSearchList() {
    return Obx(
      () => GridView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          crossAxisSpacing: 8,
          mainAxisSpacing: 8,
          childAspectRatio: 2, // Adjust this value to control the height
        ),
        itemCount: controller.allCuisinesSearchList.length,
        itemBuilder: (context, index) {
          final suggestion = controller.allCuisinesSearchList[index];
          return InkWell(
            onTap: () {
              controller.goToSearchResultScreen(suggestion);
            },
            child: Container(
              padding: const EdgeInsets.only(left: 5, right: 5),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  border: Border.all(color: foodColorPrimary)),
              child: Center(
                child: Text(
                  suggestion,
                  textAlign: TextAlign.center,
                  style: theme.textTheme.bodyLarge?.copyWith(
                      fontWeight: FontWeight.w600, color: foodColorPrimary),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
