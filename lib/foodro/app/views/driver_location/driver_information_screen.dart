import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:foodro/foodro/app/controller/food_driver_information_controller.dart';
import 'package:foodro/foodro/widgets/food_app_widget.dart';
import 'package:get/get.dart';
import 'package:nb_utils/nb_utils.dart';

import '../../../../../route/my_route.dart';
import '../../../constant/food_colors.dart';
import '../../../constant/food_images.dart';
import '../../../constant/food_strings.dart';
import '../../../food_theme/food_theme.dart';

class DriverInformationScreen extends StatefulWidget {
  const DriverInformationScreen({super.key});

  @override
  DriverInformationScreenState createState() => DriverInformationScreenState();
}

class DriverInformationScreenState extends State<DriverInformationScreen> {
  final FoodDriverInformationController controller =
      Get.put(FoodDriverInformationController());

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
        titleText: driverInformation,
      ),
      // backgroundColor: Get.isDarkMode ? foodDarkPrimary : colorGrey100,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              15.height,
              Center(
                child: ClipOval(
                  child: commonCacheImageWidget(
                      "https://i.ibb.co/8jMCnBS/Type-Default-Component-Avatar-2.png",
                      100,
                      width: 100),
                ),
              ),
              15.height,
              Text(
                'Rayford Chenail',
                style: theme.textTheme.headlineSmall?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    '+1-202-555-0161',
                    style: theme.textTheme.bodyMedium?.copyWith(
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  IconButton(
                      onPressed: () {},
                      icon: SvgPicture.asset(
                        copyIcon,
                        height: 20,
                        width: 20,
                      ))
                ],
              ),
              15.height,
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 20),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(24),
                    color: Get.isDarkMode ? foodCardDark : Colors.white,
                    boxShadow: [cardBoxShadow]),
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 20, horizontal: 40),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      _buildIconAndTextWidgets(
                          circleStarIcon, '4.8', 'Ratings'),
                      _buildIconAndTextWidgets(circleLockIcon, '425', 'Orders'),
                      _buildIconAndTextWidgets(circleClockIcon, '4', 'Years'),
                    ],
                  ),
                ),
              ),
              20.height,
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 20),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(24),
                    color: Get.isDarkMode ? foodCardDark : Colors.white,
                    boxShadow: [cardBoxShadow]),
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      _buildRow('Member Since', 'July 15, 2019'),
                      10.height,
                      _buildRow('Motorcycle Model', 'Yamaha MX King'),
                      10.height,
                      _buildRow('Plate Number', 'HSW 4736 XK'),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: SizedBox(
        height: 100,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Divider(
              color: Get.isDarkMode ? foodBorderDark : foodBorderColor,
              height: 1,
              thickness: 1,
            ),
            5.height,
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                IconButton(
                    onPressed: () {
                      Get.toNamed(MyRoute.foodCancelOrder);
                    },
                    icon: SvgPicture.asset(
                      cancelRedIcon,
                      height: 65,
                      width: 65,
                    )),
                10.width,
                IconButton(
                    onPressed: () {
                      Get.toNamed(MyRoute.foodChat);
                    },
                    icon: SvgPicture.asset(
                      chatGreenIcon,
                      height: 65,
                      width: 65,
                    )),
                10.width,
                IconButton(
                    onPressed: () {},
                    icon: SvgPicture.asset(
                      callIcon,
                      height: 65,
                      width: 65,
                    )),
              ],
            )
          ],
        ),
      ),
    );
  }

  _buildIconAndTextWidgets(String icon, String number, String title) {
    return Column(
      children: [
        SvgPicture.asset(
          icon,
          width: 55,
          height: 55,
        ),
        10.height,
        Text(
          number,
          style: theme.textTheme.bodyLarge?.copyWith(
            fontWeight: FontWeight.bold,
          ),
        ),
        // 5.height,
        Text(
          title,
          style: theme.textTheme.bodySmall?.copyWith(
              fontWeight: FontWeight.w500,
              color: Get.isDarkMode ? colorGrey300 : colorGrey600),
        ),
      ],
    );
  }

  _buildRow(String text1, String text2) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          text1,
          style: theme.textTheme.bodyMedium?.copyWith(
              fontWeight: FontWeight.w500,
              color: Get.isDarkMode ? colorGrey300 : colorGrey600),
        ),
        Text(
          text2,
          style: theme.textTheme.bodyLarge?.copyWith(
            fontWeight: FontWeight.w600,
          ),
        ),
      ],
    );
  }
}
