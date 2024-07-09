import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:foodro/foodro/app/model/food_transaction.dart';
import 'package:foodro/foodro/constant/food_images.dart';
import 'package:get/get.dart';
import 'package:nb_utils/nb_utils.dart';

import '../../../constant/food_colors.dart';
import '../../../widgets/food_app_widget.dart';

class TransactionItemViewWidget extends StatelessWidget {
  final FoodTransaction transaction;
  final ThemeData theme;
  final VoidCallback onPressed;

  const TransactionItemViewWidget(
      {super.key,
      required this.transaction,
      required this.theme,
      required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ClipOval(
              child: transaction.isTopUp ?  SvgPicture.asset(topUpIcon,width: 60,height: 60,) : commonCacheImageWidget(transaction.image.toString(), 60,
                  width: 60),
            ),
            10.width,
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    transaction.name,
                    textAlign: TextAlign.left,
                    overflow: TextOverflow.ellipsis,
                    style: theme.textTheme.bodyLarge?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        transaction.date,
                        textAlign: TextAlign.left,
                        style: theme.textTheme.bodyMedium?.copyWith(
                            fontWeight: FontWeight.w500,
                            color:
                                Get.isDarkMode ? colorGrey300 : colorGrey700),
                      ),
                      Text(
                        " | ",
                        textAlign: TextAlign.left,
                        style: theme.textTheme.bodyMedium?.copyWith(
                            fontWeight: FontWeight.w500,
                            color:
                                Get.isDarkMode ? colorGrey300 : colorGrey700),
                      ),
                      Text(
                        transaction.time,
                        textAlign: TextAlign.left,
                        style: theme.textTheme.bodyMedium?.copyWith(
                            fontWeight: FontWeight.w500,
                            color:
                                Get.isDarkMode ? colorGrey300 : colorGrey700),
                      ),
                    ],
                  )
                ],
              ),
            ),
            10.width,
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  '\$${transaction.price}',
                  textAlign: TextAlign.left,
                  style: theme.textTheme.bodyLarge?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      'Orders',
                      textAlign: TextAlign.left,
                      style: theme.textTheme.bodyMedium?.copyWith(
                          fontWeight: FontWeight.w500,
                          color: Get.isDarkMode ? colorGrey300 : colorGrey700),
                    ),
                    5.width,
                    SvgPicture.asset(
                      transaction.isTopUp ? downIcon : upIcon,
                      width: 13,
                      height: 13,
                    )
                  ],
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
