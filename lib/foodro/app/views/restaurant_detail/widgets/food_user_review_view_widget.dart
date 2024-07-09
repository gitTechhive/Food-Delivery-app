import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:foodro/foodro/constant/food_images.dart';
import 'package:foodro/foodro/app/model/food_user_reviews.dart';
import 'package:foodro/foodro/widgets/food_app_widget.dart';
import 'package:get/get.dart';
import 'package:nb_utils/nb_utils.dart';

import '../../../../constant/food_colors.dart';



class FoodUserReviewWidgetScreen extends StatelessWidget {
  final FoodUserReviews foodUserReviews;
  final ThemeData theme;
  const FoodUserReviewWidgetScreen({super.key, required this.foodUserReviews, required this.theme});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            ClipOval(
              child: commonCacheImageWidget(foodUserReviews.profileImage, 48,
                  width: 48, fit: BoxFit.cover),
            ),
            5.width,
            Expanded(
              child: Text(
                foodUserReviews.name,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: theme
                    .textTheme
                    .bodyMedium
                    ?.copyWith(fontWeight: FontWeight.bold),
              ),
            ),
            5.width,
            RatingBarWidget(
              size: 24,
              onRatingChanged: (rating) {},
              rating: foodUserReviews.ratting,
              activeColor: foodYellowGradient2,
              disable: true,
              // allowHalfRating: true,
            ),
            5.width,
            SvgPicture.asset(
              moreIcon,
              width: 18,
              height: 18,
              colorFilter: ColorFilter.mode(
                  Get.isDarkMode ? Colors.white : Colors.black,
                  BlendMode.srcIn),
            ),
          ],
        ),
        10.height,
        Text(
          foodUserReviews.comment,
          style: theme
              .textTheme
              .bodyMedium
              ?.copyWith(fontWeight: FontWeight.w400),
        ),
        10.height,
        Row(
          children: [
            SvgPicture.asset(
              foodUserReviews.isLikeComment ? heartFillIcon  :heartIcon,
              width: 24,
              height: 24,
            ),
            8.width,
            Text(
              foodUserReviews.totalLikes.toString(),
              style: theme
                  .textTheme
                  .bodySmall
                  ?.copyWith(fontWeight: FontWeight.w500),
            ),
            8.width,
            Text(
              foodUserReviews.days.toString(),
              style: theme
                  .textTheme
                  .bodySmall
                  ?.copyWith(fontWeight: FontWeight.w500,color: Get.isDarkMode ? colorGrey300 : colorGrey700),
            ),
          ],
        ),
        10.height,
      ],
    );
  }
}
