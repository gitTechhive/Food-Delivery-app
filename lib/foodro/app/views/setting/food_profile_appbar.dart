import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:foodro/foodro/constant/food_colors.dart';
import 'package:foodro/foodro/constant/food_images.dart';
import 'package:foodro/foodro/constant/food_strings.dart';
import 'package:foodro/foodro/food_theme/food_theme.dart';
import 'package:get/get.dart';
import 'package:nb_utils/nb_utils.dart';

class FoodProfileAppBar extends StatelessWidget {

  const FoodProfileAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.only(left:10,right: 20,top: 10),
        child: Row(
          children: [
            SvgPicture.asset(
              logoImg,
              width: 37,
              height: 37,
            ),
            15.width,
            Expanded(
                child: Text(
              profile,
              style: Theme.of(context)
                  .textTheme
                  .headlineSmall
                  ?.copyWith(fontWeight: FontWeight.w900,fontFamily: FoodTheme.fontFamily),
            )),
            SvgPicture.asset(
              profileChatIcon,
              width: 28,
              height: 28,
              colorFilter: ColorFilter.mode(
                  Get.isDarkMode ? whiteColor : foodTextColor, BlendMode.srcIn),
            ),
          ],
        ),
      ),
    );
  }
}
