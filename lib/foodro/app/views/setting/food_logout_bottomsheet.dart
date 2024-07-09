import 'package:flutter/material.dart';
import 'package:foodro/foodro/constant/food_colors.dart';
import 'package:foodro/foodro/constant/food_strings.dart';
import 'package:get/get.dart';
import 'package:nb_utils/nb_utils.dart';

import '../../../../route/my_route.dart';
import '../../../widgets/food_common_button.dart';

class LogoutBottomSheet extends StatelessWidget {
  final ThemeData theme;

  const LogoutBottomSheet({super.key, required this.theme});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(logout,
              textAlign: TextAlign.center,
              style: theme.textTheme.headlineSmall
                  ?.copyWith(fontWeight: FontWeight.bold, color: foodRedColor)),
          15.height,
          Divider(
            color: Get.isDarkMode ? foodBorderDark : foodBorderColor,
            height: 1,
            thickness: 1,
          ),
          15.height,
          Text('Are you sure you want to logout?',
              textAlign: TextAlign.center,
              style: theme.textTheme.titleLarge?.copyWith(
                  fontWeight: FontWeight.bold,
                  color: Get.isDarkMode ? colorGrey300 : colorGrey800)),
          20.height,
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                  child: FoodCommonButton(
                onPressed: () {
                  Get.back();
                },
                text: cancel,
                height: 58,
                bgColor: Get.isDarkMode ? foodBorderDark : foodPrimaryColor100,
                textColor: Get.isDarkMode ? whiteColor : foodColorPrimary,
              )),
              15.width,
              Expanded(
                  child: FoodCommonButton(
                      onPressed: () {
                        Get.offNamedUntil(MyRoute.foodSignIn, (route) => false);
                      },
                      text: yesLogout,
                      height: 58)),
            ],
          ),
        ],
      ),
    );
  }
}
