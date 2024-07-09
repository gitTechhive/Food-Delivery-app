import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:foodro/foodro/app/controller/food_discount_controller.dart';
import 'package:foodro/foodro/constant/food_strings.dart';
import 'package:get/get.dart';
import 'package:nb_utils/nb_utils.dart';

import '../../../constant/food_colors.dart';
import '../../../constant/food_images.dart';
import '../../../food_theme/food_theme.dart';
import '../../../widgets/food_app_widget.dart';
import '../../../widgets/food_common_button.dart';
import '../../model/food_discount.dart';

class FoodDiscountScreen extends StatefulWidget {
  const FoodDiscountScreen({super.key});

  @override
  FoodDiscountScreenState createState() => FoodDiscountScreenState();
}

class FoodDiscountScreenState extends State<FoodDiscountScreen> {
  final FoodDiscountController controller = Get.put( FoodDiscountController());
  late ThemeData theme;

  @override
  void initState() {
    super.initState();
    theme = Get.isDarkMode ? FoodTheme.foodDarkTheme : FoodTheme.foodLightTheme;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: theme.scaffoldBackgroundColor,
      appBar: fdCommonAppBarWidget(context, titleText: getDiscounts),
      body: SafeArea(
          child: Center(
              child: FutureBuilder<List<FoodDiscount>>(
        future: controller.getDiscountList(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const CircularProgressIndicator(
              color: foodColorPrimary,
            );
          } else if (snapshot.hasError) {
            return Text('Error: ${snapshot.error}');
          } else {
            return ListView.builder(
              // physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: controller.listOfDiscount.length,
              itemBuilder: (context, index) {
                var discount = controller.listOfDiscount[index];
                return Obx(() => Container(
                      margin: const EdgeInsets.symmetric(
                          vertical: 10, horizontal: 20),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(24),
                          color: Get.isDarkMode ? foodCardDark : Colors.white,
                          boxShadow: [cardBoxShadow]),
                      child: Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          // crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            commonCacheImageWidget(discount.image, 80,
                                width: 80),
                            10.width,
                            Expanded(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    discount.name,
                                    style: theme.textTheme.bodyLarge?.copyWith(
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  5.height,
                                  Text(
                                    discount.description,
                                    overflow: TextOverflow.ellipsis,
                                    style: theme.textTheme.bodySmall?.copyWith(
                                        fontWeight: FontWeight.w400,
                                        color: Get.isDarkMode
                                            ? colorGrey300
                                            : colorGrey700),
                                  ),
                                ],
                              ),
                            ),
                            InkWell(
                              onTap: () {
                                // print(controller.selectedIndex.value);
                                controller.selectedIndex.value = index;
                              },
                              child: SvgPicture.asset(
                                (controller.selectedIndex.value == index)
                                    ? checkedIcon
                                    : uncheckedIcon,
                                width: 20,
                                height: 20,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ));
              },
            );
          }
        },
      ))),
      bottomNavigationBar: Container(
        color: Get.isDarkMode ? foodCardDark : Colors.white,
        height: 80,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
          child: FoodCommonButton(onPressed: () {}, text: apply),
        ),
      ),
    );
  }
}
