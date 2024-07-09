import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:foodro/foodro/constant/food_colors.dart';

import '../../../../route/my_route.dart';
import 'package:get/get.dart';
import 'package:nb_utils/nb_utils.dart';

import '../../../constant/food_images.dart';
import '../../../constant/food_strings.dart';

class AccountCreationSuccessDialog {
  Future customDialog(
    BuildContext context, ThemeData theme,
  ) {
    return showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) {
        Future.delayed(const Duration(seconds: 2), () {
          Get.offNamedUntil(MyRoute.foodHome,(route) => false,); // Close dialog after 2 seconds
        });
        final high = MediaQuery.of(context).size.width;
        return SimpleDialog(
          backgroundColor: Get.isDarkMode ? foodDarkPrimary : whiteColor,
          insetPadding: EdgeInsets.zero,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(36)),
          children: [
            Container(
              // alignment: Alignment.topCenter,
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
              width: high - 50,
              child: Column(
                children: [
                  Image.asset(
                    successImage,
                    width: 200,
                    height: 180,
                  ),
                  30.height,
                  Text(
                    congratulations,
                    style: theme.textTheme.headlineSmall?.copyWith(
                        color: foodColorPrimary, fontWeight: FontWeight.bold),
                  ),
                  15.height,
                  Text(
                    accountCreateMsg,
                    textAlign: TextAlign.center,
                    style: theme
                        .textTheme
                        .bodyMedium
                        ?.copyWith(fontWeight: FontWeight.w400),
                  ),
                  24.height,
                  const SpinKitCircle(
                    color: foodColorPrimary,
                  ),
                  20.height,
                ],
              ),
            )
          ],
          // content: ,
        );
      },
    );
  }
}
