import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:foodro/foodro/app/controller/noftification_setting_controller.dart';
import 'package:foodro/foodro/constant/food_strings.dart';
import 'package:foodro/foodro/widgets/food_app_widget.dart';
import 'package:get/get.dart';
import 'package:nb_utils/nb_utils.dart';

import '../../../food_theme/food_theme.dart';

class NotificationSettingScreen extends StatefulWidget {
  const NotificationSettingScreen({super.key});

  @override
  NotificationSettingScreenState createState() =>
      NotificationSettingScreenState();
}

class NotificationSettingScreenState extends State<NotificationSettingScreen> {
  late FoodNotificationSettingController controller;
  late ThemeData theme;

  @override
  void initState() {
    super.initState();
    controller = Get.put(FoodNotificationSettingController());
    theme = Get.isDarkMode ? FoodTheme.foodDarkTheme : FoodTheme.foodLightTheme;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: theme.scaffoldBackgroundColor,
      appBar: fdCommonAppBarWidget(context, titleText: notification),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildRowWidget(
                  generalNotification, controller.isGeneralNotification),
              15.height,
              _buildRowWidget(sound, controller.isSound),
              15.height,
              _buildRowWidget(vibrate, controller.isVibrate),
              15.height,
              _buildRowWidget(specialOffers, controller.isSpecialOffers),
              15.height,
              _buildRowWidget(promoDiscount, controller.isPromoDiscount),
              15.height,
              _buildRowWidget(payments, controller.isPayments),
              15.height,
              _buildRowWidget(cashback, controller.isCashback),
              15.height,
              _buildRowWidget(appUpdates, controller.isAppUpdates),
              15.height,
              _buildRowWidget(newServiceAvailable, controller.isNewService),
              15.height,
              _buildRowWidget(newTipsAvailable, controller.isNewTips),
            ],
          ),
        ),
      ),
    );
  }

  _buildRowWidget(String text, RxBool switchValue) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          text,
          style:
              theme.textTheme.bodyLarge?.copyWith(fontWeight: FontWeight.w600),
        ),
        Obx(() {
          // Use the switch value from the controller
          return Transform.scale(
              scale: 0.9,
              // Adjust the scale factor to change the size
              child: CupertinoSwitch(
                value: switchValue.value,
                onChanged: (newValue) {
                  // Call the controller method to toggle the switch state
                  controller.toggleSwitch(newValue, switchValue);
                },
              ));
        }),
      ],
    );
  }
}
