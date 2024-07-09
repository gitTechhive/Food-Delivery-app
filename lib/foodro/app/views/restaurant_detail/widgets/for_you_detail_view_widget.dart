import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:foodro/foodro/app/model/food_menu.dart';
import 'package:foodro/foodro/constant/food_colors.dart';
import 'package:foodro/foodro/constant/food_strings.dart';
import 'package:foodro/foodro/widgets/food_app_widget.dart';
import 'package:get/get.dart';
import 'package:nb_utils/nb_utils.dart';

import '../../../../constant/food_images.dart';
import '../../../controller/food_restaurant_detail_controller.dart';

class FoodForYouDetailViewWidget extends StatefulWidget {
  final VoidCallback onPressed;
  final FoodMenu menu;
  final FoodRestaurantDetailController controller;
  final int index;
  final ThemeData theme;

  const FoodForYouDetailViewWidget(
      {super.key,
      required this.onPressed,
      required this.menu,
      required this.controller,
      required this.index,
      required this.theme});

  @override
  FoodForYouDetailViewWidgetState createState() =>
      FoodForYouDetailViewWidgetState();
}

class FoodForYouDetailViewWidgetState
    extends State<FoodForYouDetailViewWidget> {
  @override
  Widget build(BuildContext context) {
    return Obx(
      () => InkWell(
        onTap: widget.onPressed,
        child: Container(
          padding: const EdgeInsets.all(10),
          // height: 260,
          width: 210,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(24),
              color: Get.isDarkMode ? foodCardDark : Colors.white,
              boxShadow: [cardBoxShadow]),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                10.height,
                Center(
                  child: Stack(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(20.0),
                        child: commonCacheImageWidget(
                            widget.menu.image.toString(), 154,
                            width: 154),
                      ),
                      if (widget.menu.isBestSeller)
                        Positioned(
                          top: 10,
                          left: 10,
                          child: Container(
                            // width: 56,
                            // height: 24,
                            padding: const EdgeInsets.symmetric(
                                horizontal: 10, vertical: 5),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(6),
                                color: foodColorPrimary),
                            child: Center(
                              child: Text(
                                besetSeller,
                                style: widget.theme.textTheme.bodySmall
                                    ?.copyWith(
                                        color: Colors.white,
                                        fontWeight: FontWeight.w600),
                              ),
                            ),
                          ),
                        )
                    ],
                  ),
                ),
                10.height,
                Text(
                  widget.menu.name.toString(),
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                  style: widget.theme.textTheme.bodyLarge?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                8.height,
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Text(
                        "\$${widget.menu.price}",
                        overflow: TextOverflow.ellipsis,
                        style: widget.theme.textTheme.bodyLarge?.copyWith(
                            fontWeight: FontWeight.w900, color: foodColorPrimary),
                      ),
                    ),
                    if (widget.menu.qty.value > 0) _buildQtyPicker(context),
                    if (widget.menu.qty.value == 0)
                      InkWell(
                        onTap: () {
                          widget.menu.qty.value++;
                        },
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 15, vertical: 8),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              color: foodColorPrimary),
                          child: Text(
                            add,
                            overflow: TextOverflow.ellipsis,
                            style: widget.theme.textTheme.bodySmall?.copyWith(
                              color: Colors.white,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      )
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  _buildQtyPicker(BuildContext context) {
    return Row(
      // mainAxisAlignment: MainAxisAlignment.center,
      children: [
        GestureDetector(
          onTap: () => {
            setState(() {
              if (widget.menu.qty.value > 0) {
                widget.menu.qty.value--;
              }
            })
          },
          child: SvgPicture.asset(
            Get.isDarkMode ? minusDarkIcon : minusIcon,
            width: 35,
            height: 35,
          ),
        ),
        // 10.width,
        SizedBox(
          width: 30,
          child: Text(
            '${widget.menu.qty.value}',
            textAlign: TextAlign.center,
            style: widget.theme.textTheme.bodyMedium
                ?.copyWith(fontWeight: FontWeight.w900),
          ),
        ),
        // 10.width,
        GestureDetector(
          onTap: () => {widget.menu.qty.value++},
          child: SvgPicture.asset(
            Get.isDarkMode ? addDarkIcon : addIcon,
            width: 35,
            height: 35,
          ),
        ),
      ],
    );
  }
}
