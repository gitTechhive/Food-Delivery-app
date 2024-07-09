import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:foodro/foodro/app/controller/food_main_home_controller.dart';
import 'package:foodro/foodro/constant/food_colors.dart';
import 'package:foodro/foodro/widgets/food_common_button.dart';
import 'package:get/get.dart';
import 'package:nb_utils/nb_utils.dart';

import '../../../../route/my_route.dart';
import '../../../constant/food_images.dart';
import '../../../constant/food_strings.dart';

class TopUpSuccessDialog {
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
                      SvgPicture.asset(
                        walletImage,
                        width: 185,
                        height: 180,
                      ),
                      15.height,
                      Text(topUpSuccessful,
                          maxLines: 3,
                          textAlign: TextAlign.center,
                          style: theme.textTheme.titleLarge?.copyWith(
                              color: foodColorPrimary,
                              fontWeight: FontWeight.bold)),
                      15.height,
                      Text(topUpSuccessfulText,
                          textAlign: TextAlign.center,
                          style: theme.textTheme.bodyMedium
                              ?.copyWith(fontWeight: FontWeight.w400)),
                      24.height,
                      FoodCommonButton(
                        onPressed: () {
                          final FoodMainHomeController controller = Get.find();
                          controller.changeTabIndex(0); // Ensure index is set correctly
                          Get.offNamedUntil(MyRoute.foodHome,(route) => false,);
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
