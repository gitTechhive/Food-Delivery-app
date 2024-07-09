import 'package:flutter/material.dart';
import 'package:foodro/foodro/app/model/food_menu.dart';
import 'package:foodro/foodro/constant/food_strings.dart';

import '../../../../route/my_route.dart';
import 'package:get/get.dart';
import 'package:nb_utils/nb_utils.dart';

import '../../../constant/food_colors.dart';
import '../../../widgets/food_app_widget.dart';
import '../../../widgets/food_common_button.dart';

class ActiveOrderItemWidget extends StatelessWidget {
  final FoodMenu foodMenu;
  final ThemeData theme;

  const ActiveOrderItemWidget(
      {super.key, required this.foodMenu, required this.theme});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 20),
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(24),
            color: Get.isDarkMode ? foodCardDark : Colors.white,
            boxShadow: [cardBoxShadow]),
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(24.0),
                    child: commonCacheImageWidget(
                        foodMenu.image.toString(), 110,
                        width: 110),
                  ),
                  10.width,
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        10.height,
                        Text(
                          foodMenu.name.toString(),
                          overflow: TextOverflow.ellipsis,
                          maxLines: 2,
                          style: theme.textTheme.bodyLarge?.copyWith(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        10.height,
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "${foodMenu.qty.value} items",
                              overflow: TextOverflow.ellipsis,
                              style: theme.textTheme.bodyMedium?.copyWith(
                                  fontWeight: FontWeight.w500,
                                  color: Get.isDarkMode
                                      ? colorGrey300
                                      : colorGrey700),
                            ),
                            10.width,
                            Text(
                              " | ",
                              overflow: TextOverflow.ellipsis,
                              style: theme.textTheme.bodyMedium?.copyWith(
                                  fontWeight: FontWeight.w500,
                                  color: Get.isDarkMode
                                      ? colorGrey300
                                      : colorGrey700),
                            ),
                            10.width,
                            Text(
                              foodMenu.distance,
                              overflow: TextOverflow.ellipsis,
                              style: theme.textTheme.bodyMedium?.copyWith(
                                  fontWeight: FontWeight.w500,
                                  color: Get.isDarkMode
                                      ? colorGrey300
                                      : colorGrey700),
                            ),
                          ],
                        ),
                        10.height,
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "\$${foodMenu.price}",
                              overflow: TextOverflow.ellipsis,
                              style: theme.textTheme.titleLarge?.copyWith(
                                  fontWeight: FontWeight.w900,
                                  color: foodColorPrimary),
                            ),
                            10.width,
                            Container(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 10, vertical: 5),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(6),
                                  color: foodColorPrimary),
                              child: Text(
                                foodMenu.paymentType,
                                overflow: TextOverflow.ellipsis,
                                style: theme.textTheme.bodySmall?.copyWith(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              10.height,
              Divider(
                color: Get.isDarkMode ? foodBorderDark : foodBorderColor,
                height: 1,
                thickness: 1,
              ),
              10.height,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                      child: FoodCommonButton(
                    onPressed: () {
                      Get.toNamed(MyRoute.foodCancelOrder);
                    },
                    text: cancelOrder,
                    height: 32,
                    borderColor: foodColorPrimary,
                    bgColor: Get.isDarkMode ? foodCardDark : Colors.white,
                    textColor: foodColorPrimary,
                    textStyle: theme.textTheme.bodySmall?.copyWith(
                      fontWeight: FontWeight.w600,
                      color: foodColorPrimary,
                    ),
                  )),
                  15.width,
                  Expanded(
                      child: FoodCommonButton(
                          textStyle: theme.textTheme.bodySmall?.copyWith(
                            fontWeight: FontWeight.w600,
                            color: Colors.white,
                          ),
                          onPressed: () {
                            Get.toNamed(MyRoute.foodDriverLocation);
                          },
                          text: trackDriver,
                          height: 32)),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
