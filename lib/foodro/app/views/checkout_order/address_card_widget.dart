import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:foodro/foodro/widgets/food_app_widget.dart';
import 'package:get/get.dart';
import 'package:nb_utils/nb_utils.dart';

import '../../../../route/my_route.dart';
import '../../../constant/food_colors.dart';
import '../../../constant/food_images.dart';
import '../../../constant/food_strings.dart';

class AddressCardWidget extends StatelessWidget {
  final ThemeData theme;

  const AddressCardWidget({super.key, required this.theme});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(24),
          color: Get.isDarkMode ? foodCardDark : Colors.white,
          boxShadow: [cardBoxShadow]),
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              deliverTo,
              style: theme.textTheme.titleLarge
                  ?.copyWith(fontWeight: FontWeight.bold),
            ),
            15.height,
            Divider(
              color: Get.isDarkMode ? foodBorderDark : foodBorderColor,
              height: 1,
              thickness: 1,
            ),
            15.height,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SvgPicture.asset(
                  locationIcon,
                  width: 50,
                  height: 50,
                ),
                10.width,
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Text(
                            'Home',
                            style: theme.textTheme.bodyLarge?.copyWith(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          10.width,
                          Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 10, vertical: 5),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(6),
                                color: foodColorPrimary.withOpacity(0.08)),
                            child: Text(
                              'Default',
                              overflow: TextOverflow.ellipsis,
                              style: theme.textTheme.bodySmall?.copyWith(
                                color: foodColorPrimary,
                                fontSize: 10,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        ],
                      ),
                      5.height,
                      Text(
                        'Times Square NYC, Manhattan',
                        overflow: TextOverflow.ellipsis,
                        style: theme.textTheme.bodySmall?.copyWith(
                            fontWeight: FontWeight.w400,
                            color:
                                Get.isDarkMode ? colorGrey300 : colorGrey700),
                      ),
                    ],
                  ),
                ),
                InkWell(
                  child: SvgPicture.asset(
                    rightArrowIcon,
                    width: 20,
                    height: 20,
                    colorFilter: const ColorFilter.mode(
                        foodColorPrimary, BlendMode.srcIn),
                  ),
                  onTap: () {
                    Get.toNamed(MyRoute.foodAddress);
                  },
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
