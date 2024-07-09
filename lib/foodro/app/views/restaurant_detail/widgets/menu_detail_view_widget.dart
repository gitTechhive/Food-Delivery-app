import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:foodro/foodro/constant/food_colors.dart';
import 'package:foodro/foodro/app/model/food_menu.dart';
import 'package:foodro/foodro/widgets/food_app_widget.dart';
import 'package:get/get.dart';
import 'package:nb_utils/nb_utils.dart';

import '../../../../constant/food_images.dart';
import '../../../../constant/food_strings.dart';



class FoodMenuDetailViewWidget extends StatefulWidget {
  final VoidCallback onPressed;
  final FoodMenu foodMenu;
  final int index;
  final ThemeData theme;


  const FoodMenuDetailViewWidget(
      {super.key,
      required this.onPressed,
      required this.foodMenu,
      required this.index, required this.theme});

  @override
  FoodMenuDetailViewWidgetState createState() =>
      FoodMenuDetailViewWidgetState();
}

class FoodMenuDetailViewWidgetState extends State<FoodMenuDetailViewWidget> {
  @override
  Widget build(BuildContext context) {
    return Obx(() =>  GestureDetector(
        onTap: widget.onPressed,
        child: Padding(
          padding: const EdgeInsets.only(top: 10.0),
          child: Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(24),
                color: Get.isDarkMode ? foodCardDark : Colors.white,
                boxShadow: [cardBoxShadow]),
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(24.0),
                    child: commonCacheImageWidget(
                        widget.foodMenu.image.toString(), 110,
                        width: 110),
                  ),
                  10.width,
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        8.height,
                        if (widget.foodMenu.isDiscount)
                          Container(
                            // padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                            width: 56,
                            height: 24,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(6),
                                color: foodColorPrimary),
                            child: Center(
                              child: Text(
                                newText,
                                style: widget.theme
                                    .textTheme
                                    .bodySmall
                                    ?.copyWith(
                                        color: Colors.white,
                                        fontWeight: FontWeight.w600),
                              ),
                            ),
                          ),
                        8.height,
                        Text(
                          widget.foodMenu.name.toString(),
                          overflow: TextOverflow.ellipsis,
                          maxLines: 2,
                          style: widget.theme.textTheme.bodyLarge?.copyWith(
                                fontWeight: FontWeight.bold,
                              ),
                        ),
                        10.height,
                        /*Text(
                          "\$${foodMenu.price}",
                          overflow: TextOverflow.ellipsis,
                          style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                              fontWeight: FontWeight.bold,
                              color: foodColorPrimary),
                        ),*/
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "\$${widget.foodMenu.price}",
                              overflow: TextOverflow.ellipsis,
                              style: widget.theme
                                  .textTheme
                                  .bodyLarge
                                  ?.copyWith(
                                      fontWeight: FontWeight.w900,
                                      color: foodColorPrimary),
                            ),
                            if (widget.foodMenu.qty.value > 0) _buildQtyPicker(context),
                            if (widget.foodMenu.qty.value == 0)
                              InkWell(
                                onTap: () {
                                  // setState(() {
                                    widget.foodMenu.qty.value++;
                                  // });
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
                                    style:widget.theme
                                        .textTheme
                                        .bodySmall
                                        ?.copyWith(
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
                ],
              ),
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
            // setState(() {
              if (widget.foodMenu.qty.value > 0) {
                widget.foodMenu.qty.value--
              }
            // })
          },
          child: SvgPicture.asset(
            Get.isDarkMode ? minusDarkIcon : minusIcon,
            width: 35,
            height: 35,
          ),
        ),
        15.width,
        Text(
          '${widget.foodMenu.qty.value}',
          style: widget.theme
              .textTheme
              .bodyMedium
              ?.copyWith(fontWeight: FontWeight.w900),
        ),
        15.width,
        GestureDetector(
          onTap: () => {
            // setState(() {
              widget.foodMenu.qty.value++
            // })
          },
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
