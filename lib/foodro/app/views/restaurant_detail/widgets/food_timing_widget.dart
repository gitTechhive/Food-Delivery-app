import 'package:flutter/material.dart';
import 'package:foodro/foodro/constant/food_colors.dart';
import 'package:foodro/foodro/app/model/restaurant_timing.dart';
import 'package:nb_utils/nb_utils.dart';

class FoodTimingWidget extends StatelessWidget {
  final RestaurantTiming restaurantTiming;
  final ThemeData theme;
  const FoodTimingWidget({super.key, required this.restaurantTiming, required this.theme});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          width: 140,
          child: Text(
            restaurantTiming.days,
            style: theme
                .textTheme
                .bodyMedium
                ?.copyWith(fontWeight: FontWeight.w600),
          ),
        ),
        Text(
          ":",
          style: theme
              .textTheme
              .bodyMedium
              ?.copyWith(fontWeight: FontWeight.w600),
        ),
        20.width,
        Text(
          restaurantTiming.time,
          style: theme
              .textTheme
              .bodyMedium
              ?.copyWith(fontWeight: FontWeight.bold,color: foodColorPrimary),
        ),
      ],
    );
  }
}
