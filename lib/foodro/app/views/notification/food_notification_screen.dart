import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:foodro/foodro/app/controller/food_notification_controller.dart';
import 'package:foodro/foodro/app/model/notification.dart';
import 'package:foodro/foodro/widgets/food_app_widget.dart';
import 'package:get/get.dart';
import 'package:nb_utils/nb_utils.dart';

import '../../../constant/food_colors.dart';
import '../../../constant/food_images.dart';
import '../../../constant/food_strings.dart';
import '../../../food_theme/food_theme.dart';

class FoodNotificationScreen extends StatefulWidget {
  const FoodNotificationScreen({super.key});

  @override
  FoodNotificationScreenState createState() => FoodNotificationScreenState();
}

class FoodNotificationScreenState extends State<FoodNotificationScreen> {
  FoodNotificationController controller = Get.put(FoodNotificationController());

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
      appBar: fdCommonAppBarWidget(context,
          titleText: notification,
          actionWidget: IconButton(
            onPressed: () {},
            icon: SvgPicture.asset(
              moreIcon,
              width: 21,
              height: 21,
              colorFilter: ColorFilter.mode(
                  Get.isDarkMode ? Colors.white : Colors.black,
                  BlendMode.srcIn),
            ),
          )),
      body: SafeArea(
          child: Center(
              child: FutureBuilder<List<FoodNotification>>(
        future: controller.getNotificationList(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(
                color: foodColorPrimary,
              ),
            );
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else {
            return ListView.builder(
                itemCount: controller.notificationList.length,
                itemBuilder: (context, index) {
                  FoodNotification notification =
                      controller.notificationList[index];
                  // print(foodMenu.qty);
                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 15.0,horizontal: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            commonCacheImageWidget(notification.image, 60,
                                width: 60),
                            10.width,
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    notification.title,
                                    style: theme.textTheme.titleLarge
                                        ?.copyWith(fontWeight: FontWeight.bold),
                                  ),
                                  5.height,
                                  Row(
                                    children: [
                                      Text(
                                        notification.date,
                                        style: theme.textTheme.bodyMedium
                                            ?.copyWith(
                                                fontWeight: FontWeight.w500,
                                                color: Get.isDarkMode
                                                    ? colorGrey300
                                                    : colorGrey700),
                                      ),
                                      Text(
                                        " | ",
                                        style: theme.textTheme.bodyMedium
                                            ?.copyWith(
                                                fontWeight: FontWeight.w500,
                                                color: Get.isDarkMode
                                                    ? colorGrey300
                                                    : colorGrey700),
                                      ),
                                      Text(
                                        notification.time,
                                        style: theme.textTheme.bodyMedium
                                            ?.copyWith(
                                                fontWeight: FontWeight.w500,
                                                color: Get.isDarkMode
                                                    ? colorGrey300
                                                    : colorGrey700),
                                      ),
                                    ],
                                  )
                                ],
                              ),
                            ),
                            10.width,
                            if (notification.isNew)
                              Container(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 10, vertical: 5),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    color: foodColorPrimary),
                                child: Text(
                                  newText,
                                  overflow: TextOverflow.ellipsis,
                                  style: theme.textTheme.bodySmall?.copyWith(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ),
                          ],
                        ),
                        10.height,
                        Text(
                          notification.message,
                          style: theme.textTheme.bodyMedium?.copyWith(
                              fontWeight: FontWeight.w400,
                              color:
                                  Get.isDarkMode ? colorGrey300 : colorGrey800),
                        ),
                      ],
                    ),
                  );
                },
                physics: const AlwaysScrollableScrollPhysics(),
                shrinkWrap: true);
          }
        },
      ))),
    );
  }
}
