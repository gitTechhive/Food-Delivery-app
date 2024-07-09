import 'package:flutter/material.dart';
import 'package:foodro/foodro/app/views/restaurant_detail/widgets/food_review_rating_widget.dart';
import 'package:foodro/foodro/app/views/restaurant_detail/widgets/food_user_review_view_widget.dart';
import 'package:foodro/foodro/constant/food_images.dart';
import 'package:foodro/foodro/constant/food_strings.dart';
import 'package:foodro/foodro/app/model/restaurant.dart';
import 'package:foodro/foodro/widgets/food_app_widget.dart';
import 'package:get/get.dart';
import 'package:nb_utils/nb_utils.dart';

import '../../../constant/food_colors.dart';
import '../home/food_resturant_list/food_sort_filter_view.dart';


class FoodRatingScreen extends StatelessWidget {
  final FoodRestaurant foodRestaurant;
  final ThemeData theme;

  const FoodRatingScreen({super.key, required this.foodRestaurant, required this.theme});

  @override
  Widget build(BuildContext context) {
    List<String> filterList = ["Sort by", "5", "4", "3", "2", "1"];

    return Scaffold(
      backgroundColor: theme.scaffoldBackgroundColor,
      appBar: fdCommonAppBarWidget(context, titleText: ratingReviews),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildDivider(),
                15.height,
                FoodReviewRatingWidget(foodRestaurant: foodRestaurant, theme: theme,),
                15.height,
                _buildDivider(),
                15.height,
                HorizontalList(
                  itemCount: filterList.length,
                  itemBuilder: (context, index) {
                    return FoodSortFilterView(
                        name: filterList[index],
                        iconName: index == 0 ? sortIcon : starIcon,
                        isIcon: true,
                        // iconColor: appColorPrimary,
                        onPressed: () {}, theme: theme,);
                  },
                ),
                15.height,
                _buildDivider(),
                15.height,
                ListView.builder(
                  shrinkWrap: true,
                  scrollDirection: Axis.vertical,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: foodRestaurant.userReviewsList.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.only(top: 10.0),
                      child: FoodUserReviewWidgetScreen(
                          foodUserReviews:
                              foodRestaurant.userReviewsList[index], theme: theme),
                    );
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  _buildDivider() {
    return Divider(
      color: Get.isDarkMode ? foodBorderDark : foodBorderColor,
      height: 1,
      thickness: 1,
    );
  }
}
