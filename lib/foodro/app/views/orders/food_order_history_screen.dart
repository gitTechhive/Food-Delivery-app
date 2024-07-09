import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:foodro/foodro/app/controller/food_order_history_controller.dart';
import 'package:foodro/foodro/app/model/food_menu.dart';
import 'package:foodro/foodro/app/views/orders/active_order_item_widet.dart';
import 'package:foodro/foodro/app/views/orders/cancel_order_item_widet.dart';
import 'package:foodro/foodro/app/views/orders/compeleted_order_item_widet.dart';
import 'package:foodro/foodro/constant/food_colors.dart';
import 'package:foodro/foodro/constant/food_images.dart';
import 'package:foodro/foodro/widgets/food_app_widget.dart';
import 'package:get/get.dart';

import '../../../constant/food_strings.dart';
import '../../../food_theme/food_theme.dart';

class FoodOrderHistoryScreen extends StatefulWidget {
  const FoodOrderHistoryScreen({super.key});

  @override
  FoodOrderHistoryScreenState createState() => FoodOrderHistoryScreenState();
}

class FoodOrderHistoryScreenState extends State<FoodOrderHistoryScreen> {
  late FoodOrderHistoryController controller;

  late ThemeData theme;

  @override
  void initState() {
    super.initState();
    controller = Get.put(FoodOrderHistoryController());
    theme = Get.isDarkMode ? FoodTheme.foodDarkTheme : FoodTheme.foodLightTheme;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: theme.scaffoldBackgroundColor,
      appBar: fdCommonAppBarWidget(context,
          titleText: orders,
          isback: false,
          leadingWidget: Padding(
            padding: const EdgeInsets.all(8.0),
            child: SvgPicture.asset(
              logoImg,
              width: 28,
              height: 28,
            ),
          ),
          actionWidget: Padding(
            padding: const EdgeInsets.all(8.0),
            child: IconButton(
              onPressed: () {},
              icon: SvgPicture.asset(
                searchIcon,
                width: 28,
                height: 28,
                colorFilter: ColorFilter.mode(
                    Get.isDarkMode ? Colors.white : Colors.black,
                    BlendMode.srcIn),
              ),
            ),
          )),
      body: DefaultTabController(
        length: 3, // Specify the number of tabs
        child: Column(
          children: [
            TabBar(
              labelStyle: theme.textTheme.bodyLarge?.copyWith(
                  fontWeight: FontWeight.w600,
                  color: Get.isDarkMode ? colorGrey700 : colorGrey500),
              labelColor: foodColorPrimary,
              indicatorSize: TabBarIndicatorSize.tab,
              indicator: const UnderlineTabIndicator(
                // Use UnderlineTabIndicator
                borderSide: BorderSide(
                    width: 3.0,
                    color: foodColorPrimary), // Customize the indicator
              ),
              tabs: const [
                Tab(
                  text: active,
                ),
                Tab(text: completed),
                Tab(text: cancelled),
              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Divider(
                color: Get.isDarkMode ? foodBorderDark : foodBorderColor,
                height: 1,
                thickness: 1,
              ),
            ),
            Expanded(
              child: TabBarView(
                children: [
                  _buildActiveOrderWidget(),
                  _buildCompletedOrderWidget(),
                  _buildCancelledOrderWidget(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  _buildActiveOrderWidget() {
    return FutureBuilder<List<FoodMenu>>(
      future: controller.getActiveOrderList(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
            child: CircularProgressIndicator(
              color: foodColorPrimary,
            ),
          );
        } else if (snapshot.hasError) {
          return Text('Error: ${snapshot.error}');
        } else {
          return ListView.builder(
            // physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: controller.activeOrdersList.length,
            itemBuilder: (context, index) {
              var order = controller.activeOrdersList[index];
              return ActiveOrderItemWidget(foodMenu: order, theme: theme);
            },
          );
        }
      },
    );
  }

  _buildCancelledOrderWidget() {
    return FutureBuilder<List<FoodMenu>>(
      future: controller.getCancelledOrderList(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
            child: CircularProgressIndicator(
              color: foodColorPrimary,
            ),
          );
        } else if (snapshot.hasError) {
          return Text('Error: ${snapshot.error}');
        } else {
          return ListView.builder(
            // physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: controller.cancelledOrdersList.length,
            itemBuilder: (context, index) {
              var order = controller.cancelledOrdersList[index];
              return CancelOrderItemWidget(foodMenu: order, theme: theme);
            },
          );
        }
      },
    );
  }

  _buildCompletedOrderWidget() {
    return FutureBuilder<List<FoodMenu>>(
      future: controller.getCompletedOrderList(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
            child: CircularProgressIndicator(
              color: foodColorPrimary,
            ),
          );
        } else if (snapshot.hasError) {
          return Text('Error: ${snapshot.error}');
        } else {
          return ListView.builder(
            // physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: controller.completedOrdersList.length,
            itemBuilder: (context, index) {
              var order = controller.completedOrdersList[index];
              return CompletedOrderItemWidget(foodMenu: order, theme: theme);
            },
          );
        }
      },
    );
  }
}
