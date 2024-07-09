import 'package:flutter/material.dart';
import 'package:foodro/foodro/constant/food_colors.dart';
import 'package:get/get.dart';
import 'package:nb_utils/nb_utils.dart';
import '../../../constant/food_strings.dart';
import '../../../food_theme/food_theme.dart';
import '../../../widgets/food_app_widget.dart';
import '../../../widgets/food_common_button.dart';

class RattingDriverScreen extends StatefulWidget {
  const RattingDriverScreen({super.key});

  @override
  RattingDriverScreenState createState() => RattingDriverScreenState();
}

class RattingDriverScreenState extends State<RattingDriverScreen> {
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
      appBar: fdCommonAppBarWidget(
        context,
      ),
      // backgroundColor: Get.isDarkMode ? foodDarkPrimary : colorGrey100,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Center(
                  child: ClipOval(
                    child: commonCacheImageWidget(
                        "https://i.ibb.co/8jMCnBS/Type-Default-Component-Avatar-2.png",
                        150,
                        width: 150),
                  ),
                ),
                20.height,
                Text(
                  rateDriverDesc,
                  textAlign: TextAlign.center,
                  style: theme.textTheme.headlineMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                20.height,
                Text(
                  deliveryRatingDesc,
                  textAlign: TextAlign.center,
                  style: theme.textTheme.bodyLarge?.copyWith(
                      fontWeight: FontWeight.w500,
                      color: Get.isDarkMode ? colorGrey300 : colorGrey700),
                ),
                20.height,
                RatingBarWidget(
                  onRatingChanged: (rating) {},
                  activeColor: foodYellowGradient1,
                  size: 40,
                  rating: 5,
                ),
                20.height,
                Divider(
                  color: Get.isDarkMode ? foodBorderDark : foodBorderColor,
                  height: 1,
                  thickness: 1,
                ),
                20.height,
                Text(
                  haveNotRecYourOrder,
                  textAlign: TextAlign.center,
                  style: theme.textTheme.bodyMedium?.copyWith(
                      fontWeight: FontWeight.w500,
                      color: Get.isDarkMode ? colorGrey300 : colorGrey700),
                ),20.height,
                Text(
                  callYourDriver,
                  textAlign: TextAlign.center,
                  style: theme.textTheme.bodyMedium?.copyWith(
                      fontWeight: FontWeight.bold,
                      color: foodColorPrimary),
                ),
                20.height,

              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar:   Container(
        color: Get.isDarkMode ? foodCardDark : Colors.white,
        height: 100,
        child: Column(
          children: [
            Divider(
              color: Get.isDarkMode ? foodBorderDark : foodBorderColor,
              height: 1,
              thickness: 1,
            ),
            20.height,
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Row(
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
                          onPressed: () { Get.back();}, text: submit, height: 58)),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
