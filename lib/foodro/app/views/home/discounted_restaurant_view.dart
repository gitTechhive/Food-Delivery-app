import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:foodro/foodro/constant/food_colors.dart';
import 'package:foodro/foodro/constant/food_strings.dart';
import 'package:foodro/foodro/app/model/restaurant.dart';
import 'package:foodro/foodro/widgets/food_app_widget.dart';
import 'package:get/get.dart';
import 'package:nb_utils/nb_utils.dart';

import '../../../constant/food_images.dart';

class FoodDiscountedRestaurantListView extends StatelessWidget {
  final VoidCallback onPressed;
  final FoodRestaurant restaurant;
  final ThemeData theme;
  const FoodDiscountedRestaurantListView(
      {super.key, required this.onPressed, required this.restaurant, required this.theme});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        margin: const EdgeInsets.only(left: 5),
       decoration: BoxDecoration(
         boxShadow: [cardBoxShadow],
         color: Get.isDarkMode ? foodCardDark : Colors.white,
         borderRadius: BorderRadius.circular(20)
       ),
        child: SizedBox(
          // height: 300,
          width: 200,
          // padding: const EdgeInsets.all(8.0),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                10.height,
                Stack(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(20.0),
                      child: commonCacheImageWidget(
                          restaurant.image.toString(), 170,
                          width: 170),
                    ),
                    Positioned(
                      top: 10,
                      left: 15,
                      child: Container(
                        width: 56,
                        height: 24,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(6),
                            color: foodColorPrimary),
                        child: Center(
                          child: Text(
                            promo1,
                            style: theme
                                .textTheme
                                .bodySmall
                                ?.copyWith(color: Colors.white,fontWeight: FontWeight.w600),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
                10.height,
                Text(
                  restaurant.name.toString(),
                  overflow: TextOverflow.ellipsis,
                  maxLines: 2,
                  style: theme.textTheme.bodyLarge?.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                ),
                8.height,
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      restaurant.distance.toString(),
                      overflow: TextOverflow.ellipsis,
                      style: theme.textTheme.bodySmall?.copyWith(
                          fontWeight: FontWeight.w500, color:Get.isDarkMode? colorGrey300 : colorGrey700),
                    ),
                    5.width,
                    Text(
                      "|",
                      overflow: TextOverflow.ellipsis,
                      style: theme.textTheme.bodySmall?.copyWith(
                          fontWeight: FontWeight.w500, color:Get.isDarkMode? colorGrey300 : colorGrey700),
                    ),
                    5.width,
                    SvgPicture.asset(
                      starIcon,
                      width: 14,
                      height: 14,
                    ),
                    5.width,
                    Text(
                      restaurant.rating.toString(),
                      overflow: TextOverflow.ellipsis,
                      style: theme.textTheme.bodySmall?.copyWith(
                          fontWeight: FontWeight.w500, color:Get.isDarkMode? colorGrey300 : colorGrey700),
                    ),
                    2.width,
                    Text(
                      "(${restaurant.reviews})",
                      overflow: TextOverflow.ellipsis,
                      style: theme.textTheme.bodySmall?.copyWith(
                          fontWeight: FontWeight.w500, color: Get.isDarkMode? colorGrey300 :colorGrey700),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      '\$${restaurant.price.toString()}',
                      overflow: TextOverflow.ellipsis,
                      style: theme.textTheme.titleLarge?.copyWith(
                          fontWeight: FontWeight.w700, color: foodColorPrimary),
                    ),
                    5.width,
                    Text(
                      "|",
                      overflow: TextOverflow.ellipsis,
                      style: theme.textTheme.bodySmall?.copyWith(
                          fontWeight: FontWeight.w500, color:Get.isDarkMode? colorGrey300 : colorGrey700),
                    ),
                    5.width,
                    SvgPicture.asset(
                      vehicleIcon,
                      width: 16,
                      height: 16,
                    ),
                    5.width,
                    Expanded(
                      child: Text(
                        "\$${restaurant.distancePrice}",
                        overflow: TextOverflow.ellipsis,
                        style: theme.textTheme.bodyMedium?.copyWith(
                            fontWeight: FontWeight.w500, color:Get.isDarkMode? colorGrey300 : colorGrey700),
                      ),
                    ),
                    5.width,
                    Obx(()=>  IconButton(
                          icon: SvgPicture.asset(
                            restaurant.isFavorite.value ? heartFillIcon : heartIcon,
                            width: 24,
                            height: 24,
                          ),
                          onPressed: () {
                            restaurant.isFavorite.value =!restaurant.isFavorite.value;
                          }),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
