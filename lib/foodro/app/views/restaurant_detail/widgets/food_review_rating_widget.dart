import 'package:flutter/material.dart';
import 'package:foodro/foodro/app/model/restaurant.dart';
import 'package:get/get.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:rating_summary/rating_summary.dart';

import '../../../../constant/food_colors.dart';



class FoodReviewRatingWidget extends StatelessWidget {
  final FoodRestaurant foodRestaurant;
  final ThemeData theme;
  const FoodReviewRatingWidget({super.key, required this.foodRestaurant, required this.theme});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              foodRestaurant.rating.toString(),
              style: theme
                  .textTheme
                  .displaySmall
                  ?.copyWith(fontWeight: FontWeight.bold),
            ),
            8.height,
            RatingBarWidget(
              size: 24,
              onRatingChanged: (rating) {},
              rating: foodRestaurant.rating,
              activeColor: foodYellowGradient2,
              disable: true,
              // allowHalfRating: true,
            ),
            8.height,
            Text(
              '(${foodRestaurant.reviews} reviews)',
              overflow: TextOverflow.ellipsis,
              style: theme.textTheme.bodyLarge?.copyWith(
                    color: Get.isDarkMode ? colorGrey300 : colorGrey800,
                    fontWeight: FontWeight.w500,
                  ),
            ),
          ],
        ),
        20.width,
        Column(
          children: [
            Container(
              height: 100,
              width: 1,
              color: Get.isDarkMode ? foodBorderDark : foodBorderColor,
            ),
          ],
        ),
        20.width,
        Expanded(
          child: RatingSummary(
            counter: 13,
            average: foodRestaurant.rating,
            showAverage: false,
            counterFiveStars: 5,
            counterFourStars: 4,
            counterThreeStars: 2,
            counterTwoStars: 1,
            counterOneStars: 1,
            color: foodColorPrimary,
            backgroundColor: Get.isDarkMode ? foodBorderDark : foodBorderColor,
          ),
        )
      ],
    );
  }

}
