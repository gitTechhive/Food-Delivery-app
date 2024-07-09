import 'package:flutter/material.dart';
import 'package:foodro/foodro/constant/food_colors.dart';
import 'package:foodro/foodro/widgets/food_common_button.dart';
import 'package:get/get.dart';
import 'package:nb_utils/nb_utils.dart';

import '../../../../route/my_route.dart';
import '../../../constant/food_images.dart';
import '../../../constant/food_strings.dart';

class DeliverySuccessDialog {
  Future customDialog(
    BuildContext context,
    ThemeData theme,
  ) {
    return showDialog(
      context: context,
      builder: (context) {
        final high = MediaQuery.of(context).size.width;
        return SimpleDialog(
          backgroundColor: theme.scaffoldBackgroundColor,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(36)),
          children: [
            SingleChildScrollView(
              child: Container(
                alignment: Alignment.topCenter,
                padding:
                    const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
                width: high / 6 * 3,
                child: FittedBox(
                  child: Column(
                    children: [
                      16.height,
                      Image.asset(
                        smileEmojiIcon,
                        width: 75,
                        height: 100,
                      ),
                      15.height,
                      Text(driverHasArrived,
                          style: theme.textTheme.titleLarge?.copyWith(
                              color: foodColorPrimary,
                              fontWeight: FontWeight.bold)),
                      15.height,
                      Text(enjoyMeal,
                          textAlign: TextAlign.center,
                          style: theme.textTheme.bodyMedium
                              ?.copyWith(fontWeight: FontWeight.w400)),
                      // 24.height,
                      Text(seeInNextOrder,
                          textAlign: TextAlign.center,
                          style: theme.textTheme.bodyMedium
                              ?.copyWith(fontWeight: FontWeight.w400)),
                      24.height,
                      FoodCommonButton(
                        onPressed: () {
                          Get.offNamed(MyRoute.foodRatingDriver);
                        },
                        text: ok,
                        width: high / 6 * 3,
                      )
                    ],
                  ),
                ),
              ),
            )
          ],
        );
      },
    );
  }
}
