import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:foodro/foodro/app/views/e_wallet/food_wallet_screen.dart';
import 'package:foodro/foodro/app/views/messages/food_messages_screen.dart';
import 'package:foodro/foodro/app/views/orders/food_order_history_screen.dart';
import 'package:foodro/foodro/constant/food_colors.dart';
import 'package:get/get.dart';

import '../../../../../theme/theme_controller.dart';
import '../../../constant/food_images.dart';
import '../../../constant/food_strings.dart';
import '../../../food_theme/food_theme.dart';
import '../../controller/food_main_home_controller.dart';
import '../setting/food_setting_screen.dart';
import 'food_home_screen.dart';



class FoodMainHomeScreen extends StatefulWidget {
  const FoodMainHomeScreen({super.key});

  @override
  FoodMainHomeScreenState createState() => FoodMainHomeScreenState();
}

class FoodMainHomeScreenState extends State<FoodMainHomeScreen>
    with TickerProviderStateMixin {
  late FoodMainHomeController controller;

  late TabController tabController;
  final ThemeController themeController = Get.put(ThemeController());

  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
  }

  late ThemeData theme;



  @override
  void initState() {
    super.initState();
    controller = Get.put(FoodMainHomeController());

    theme = themeController.isDarkMode ? FoodTheme.foodDarkTheme : FoodTheme.foodLightTheme;
    // print("FFFFFF $isDarkMode");
    tabController = TabController(length: 5, vsync: this);
    ever(controller.currentIndex, (_) {
      tabController.animateTo(controller.currentIndex.value);
    });
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<FoodMainHomeController>(
        init: controller,
        tag: 'food_main_home',
        // theme: theme,
        builder: (controller) {
          return Scaffold(
            backgroundColor: themeController.isDarkMode ? Colors.white : foodDarkPrimary,
            body: TabBarView(
              physics: const NeverScrollableScrollPhysics(),
              controller: tabController,
              children: const [
                FoodHomeScreen(),
                FoodOrderHistoryScreen(),
                FoodMessagesScreen(),
                FoodWalletScreen(),
                FoodSettingScreen(),
              ],
            ),
            bottomNavigationBar: Obx(() => _buildBottomNavigationBar()),
          );
        });
  }

  Widget _buildBottomNavigationBar() {
    return BottomNavigationBar(
      selectedItemColor: foodColorPrimary,
      // Color of selected item
      unselectedItemColor: colorGrey500,
      backgroundColor: themeController.isDarkMode
          ? foodDarkPrimary.withOpacity(0.85)
          : Colors.white,
      type: BottomNavigationBarType.fixed,
      // selectedIconTheme: ,
      currentIndex: controller.currentIndex.value,
      onTap: (index) {
        controller.changeTabIndex(index);
        tabController.animateTo(index);
      },
      items: [
        BottomNavigationBarItem(
          activeIcon: SvgPicture.asset(
            homeActiveIcon,
          ),
          icon: SvgPicture.asset(
            homeIcon,
          ),
          label: home,
        ),
        BottomNavigationBarItem(
          activeIcon: SvgPicture.asset(orderActiveIcon),
          icon: SvgPicture.asset(
            orderIcon,
          ),
          label: orders,
        ),
        BottomNavigationBarItem(
          activeIcon: SvgPicture.asset(chatActiveIcon),
          icon: SvgPicture.asset(
            chatIcon,
          ),
          label: message,
        ),
        BottomNavigationBarItem(
          activeIcon: SvgPicture.asset(walletActiveIcon),
          icon: SvgPicture.asset(
            walletIcon,
          ),
          label: eWallet,
        ),
        BottomNavigationBarItem(
          activeIcon: SvgPicture.asset(profileActiveIcon),
          icon: SvgPicture.asset(
            profileBottomIcon,
          ),
          label: profile,
        ),
        // Add more items as needed
      ],
    );
  }
}
