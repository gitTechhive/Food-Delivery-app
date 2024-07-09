import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:foodro/foodro/app/controller/food_setting_controller.dart';
import 'package:foodro/foodro/constant/food_colors.dart';
import 'package:foodro/foodro/constant/food_strings.dart';
import 'package:foodro/foodro/widgets/food_app_widget.dart';
import 'package:get/get.dart';
import 'package:nb_utils/nb_utils.dart';

import '../../../../route/my_route.dart';
import '../../../constant/food_images.dart';
import '../../../food_theme/food_theme.dart';
import 'custom_setting_item.dart';
import 'food_logout_bottomsheet.dart';
import 'food_profile_appbar.dart';

class FoodSettingScreen extends StatefulWidget {
  const FoodSettingScreen({super.key});

  @override
  FoodSettingScreenState createState() => FoodSettingScreenState();
}

class FoodSettingScreenState extends State<FoodSettingScreen> {
  late FoodSettingController controller;
  late ThemeData theme;

  @override
  void initState() {
    super.initState();
    controller = Get.put(FoodSettingController(context: context));

    theme = controller.themeController.isDarkMode
        ? FoodTheme.foodDarkTheme
        : FoodTheme.foodLightTheme;
  }

  @override
  Widget build(BuildContext context) {
    final appBarHeight = AppBar().preferredSize.height;

    return GetBuilder<FoodSettingController>(
        init: controller,
        tag: 'food_setting',
        // theme: theme,
        builder: (controller) {
          return Scaffold(
            backgroundColor: controller.themeController.isDarkMode
                ? foodDarkPrimary
                : Colors.white,
            appBar: PreferredSize(
              preferredSize: Size.fromHeight(appBarHeight),
              child: const FoodProfileAppBar(),
            ),
            body: SafeArea(
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  children: [
                    15.height,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        ClipOval(
                          child: commonCacheImageWidget(
                              "https://i.ibb.co/qYL4fhy/Type-Default-Component-Avatar-3.png",
                              80,
                              width: 80),
                        ),
                        10.width,
                        Expanded(
                          child: Column(
                            // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Andrew Ainsley',
                                style: theme.textTheme.titleLarge?.copyWith(
                                  fontWeight: FontWeight.bold,
                                  color: controller.themeController.isDarkMode
                                      ? Colors.white
                                      : foodTextColor,
                                ),
                              ),
                              8.height,
                              Text(
                                '+1 111 467 378 399',
                                style: theme.textTheme.bodyMedium?.copyWith(
                                    color: controller.themeController.isDarkMode
                                        ? colorGrey300
                                        : colorGrey800,
                                    fontWeight: FontWeight.w600),
                              ),
                            ],
                          ),
                        ),
                        IconButton(
                          icon: SvgPicture.asset(
                            edit1Icon,
                            height: 18,
                            width: 18,
                          ),
                          onPressed: () {},
                        ),
                      ],
                    ),
                    20.height,
                    Divider(
                      color: Get.isDarkMode ? foodBorderDark : foodBorderColor,
                      height: 1,
                      thickness: 1,
                    ),
                    20.height,
                    InkWell(
                      onTap: () {
                        Get.toNamed(MyRoute.foodFavRestaurant);
                      },
                      child: CustomSettingItem(
                        theme: theme,
                        isIconShow: true,
                        text1: myFavoriteRestaurants,
                        leadingIcon: eventIcon,
                        themeController: controller.themeController,
                      ),
                    ),
                    10.height,
                    CustomSettingItem(
                      theme: theme,
                      isIconShow: true,
                      text1: specialOffersPromo,
                      leadingIcon: offerIcon,
                      themeController: controller.themeController,
                    ),
                    10.height,
                    InkWell(
                      onTap: () {
                        Get.toNamed(MyRoute.foodPaymentMethod,arguments: "SETTING");
                      },
                      child: CustomSettingItem(
                        theme: theme,
                        isIconShow: true,
                        text1: paymentMethods,
                        leadingIcon: walletIcon,
                        themeController: controller.themeController,
                      ),
                    ),
                    20.height,
                    Divider(
                      color: Get.isDarkMode ? foodBorderDark : foodBorderColor,
                      height: 1,
                      thickness: 1,
                    ),
                    10.height,
                    InkWell(
                      onTap: () {
                        Get.toNamed(MyRoute.foodEditProfile);
                      },
                      child: CustomSettingItem(
                        theme: theme,
                        isIconShow: true,
                        text1: profile,
                        leadingIcon: profileBottomIcon,
                        themeController: controller.themeController,
                      ),
                    ),
                    10.height,
                    InkWell(
                      onTap: () {
                        Get.toNamed(MyRoute.foodAddress,arguments: "profile");
                      },
                      child: CustomSettingItem(
                        theme: theme,
                        isIconShow: true,
                        text1: address,
                        leadingIcon: addressIcon,
                        themeController: controller.themeController,
                      ),
                    ),
                    10.height,
                    InkWell(
                      onTap: () {
                        Get.toNamed(MyRoute.foodNotificationSetting);
                      },
                      child: CustomSettingItem(
                        theme: theme,
                        isIconShow: true,
                        text1: notification,
                        leadingIcon: bellIcon,
                        themeController: controller.themeController,
                      ),
                    ),
                    10.height,
                    InkWell(
                      onTap: () {
                        Get.toNamed(MyRoute.foodLanguage);
                      },
                      child: CustomSettingItem(
                        theme: theme,
                        isIconShow: true,
                        text1: language,
                        leadingIcon: languageIcon,
                        themeController: controller.themeController,
                      ),
                    ),
                    5.height,
                    CustomSettingItem(
                      theme: theme,
                      isSwitchShow: true,
                      text1: darkMode,
                      value: controller.isDarkMode,
                      onChanged: (value) {
                        setState(() {
                          controller.isDarkMode = value;
                          controller.themeController.toggleTheme();
                        });
                      },
                      leadingIcon: darkModeIcon,
                      themeController: controller.themeController,
                    ),
                    5.height,
                    InkWell(
                      onTap: () {
                        Get.toNamed(MyRoute.foodHelpCenter);
                      },
                      child: CustomSettingItem(
                        theme: theme,
                        isIconShow: true,
                        text1: helpCenter,
                        leadingIcon: helpIcon,
                        themeController: controller.themeController,
                      ),
                    ),
                    10.height,
                  /*  InkWell(
                      onTap: () {
                        Get.toNamed(MyRoute.foodSecurity);
                      },
                      child: CustomSettingItem(
                        theme: theme,
                        isIconShow: true,
                        text1: security,
                        leadingIcon: securityIcon,
                        themeController: controller.themeController,
                      ),
                    ),
                    10.height,*/
                    InkWell(
                      onTap: () {
                        Get.toNamed(MyRoute.foodInviteFriends);
                      },
                      child: CustomSettingItem(
                        theme: theme,
                        isIconShow: true,
                        text1: inviteFriends,
                        leadingIcon: inviteFriendsIcon,
                        themeController: controller.themeController,
                      ),
                    ),
                    10.height,
                    InkWell(
                      onTap: () {
                        showModalBottomSheet(
                          context: context,
                          builder: (BuildContext context) {
                            return LogoutBottomSheet(
                              theme: theme,
                            );
                          },
                        );
                      },
                      child: CustomSettingItem(
                          theme: theme,
                          isIconShow: true,
                          text1: logout,
                          leadingIcon: logoutIcon,
                          themeController: controller.themeController,
                          iconColor: const ColorFilter.mode(
                              foodRedColor, BlendMode.srcIn)),
                    ),
                  ],
                ),
              ),
            ),
          );
        });
  }
}
