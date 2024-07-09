import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:foodro/foodro/widgets/food_app_widget.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:nb_utils/nb_utils.dart';

import '../../../../route/my_route.dart';
import '../../../constant/food_colors.dart';
import '../../../constant/food_images.dart';
import '../../../constant/food_strings.dart';
import '../../../food_theme/food_theme.dart';
import '../../controller/food_driver_location_controller.dart';
import 'delivery_success_dialog.dart';

class DriverLocationMapView extends StatefulWidget {
  const DriverLocationMapView({super.key});

  @override
  DriverLocationMapViewState createState() => DriverLocationMapViewState();
}

class DriverLocationMapViewState extends State<DriverLocationMapView> {
  final DriverLocationController controller =
      Get.put(DriverLocationController());

  late ThemeData theme;

  @override
  void initState() {
    super.initState();
    theme = Get.isDarkMode ? FoodTheme.foodDarkTheme : FoodTheme.foodLightTheme;
    openDeliverySuccessDialog();
  }

  void openDeliverySuccessDialog() {

    fetchData().then((data) async {
      await DeliverySuccessDialog().customDialog(context, theme);
      // Use the captured data within the asynchronous callback
      // For example, you can use the theme and mediaQuery here
      // to build UI components.
    });
  }

  Future<void> fetchData() async {
    // Simulate fetching data asynchronously
    await Future.delayed(const Duration(seconds: 2));
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<DriverLocationController>(
      init: DriverLocationController(),
      builder: (controller) {
        return Scaffold(
          backgroundColor: theme.scaffoldBackgroundColor,
          // appBar: fdCommonAppBarWidget(context, titleText: fillYourProfile),
          body: SafeArea(
            child: SingleChildScrollView(
              child: Stack(
                children: [
                  Container(
                      color: Colors.transparent,
                      height: context.w,
                      child: SizedBox(
                          height: context.w / 1,
                          width: double.infinity,
                          child: GoogleMap(
                            onMapCreated: controller.onMapCreated,
                            // Pass the callback directly
                            initialCameraPosition: const CameraPosition(
                              target: LatLng(37.7749, -122.4194),
                              zoom: 11.0,
                            ),
                            markers: controller.markers,
                          ))),
                  Container(
                    width: double.infinity,
                    // physics: ScrollPhysics(),
                    margin: EdgeInsets.only(top: context.w - 20),
                    child: Container(
                      height: context.h - 120,
                      decoration: BoxDecoration(
                          borderRadius: const BorderRadius.only(
                              topLeft: Radius.circular(30),
                              topRight: Radius.circular(30)),
                          color: Get.isDarkMode ? foodDarkPrimary : whiteColor),
                      // margin: EdgeInsets.only(top: context.w ),
                      child: SingleChildScrollView(
                        child: Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Center(
                                child: Text(
                                  driverHeadingRestaurant,
                                  style: theme.textTheme.titleLarge
                                      ?.copyWith(fontWeight: FontWeight.w800),
                                ),
                              ),
                              10.height,
                              Divider(
                                  color: Get.isDarkMode
                                      ? foodBorderDark
                                      : foodBorderColor,
                                  thickness: 1),
                              10.height,
                              buildDriverDetailWidget(theme),
                              10.height,
                              Divider(
                                  color: Get.isDarkMode
                                      ? foodBorderDark
                                      : foodBorderColor,
                                  thickness: 1),
                              10.height,
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
                      ),
                    ),
                  ),
                  Positioned(
                    top: 10,
                    left: 10,
                    child: InkWell(
                      onTap: () {
                        Get.back();
                      },
                      child: CircleAvatar(
                        radius: 25,
                        backgroundColor:
                            Get.isDarkMode ? colorGrey700 : foodPrimaryColor200,
                        child: SvgPicture.asset(
                          backIcon,
                          colorFilter: ColorFilter.mode(
                              Get.isDarkMode ? Colors.white : Colors.black,
                              BlendMode.srcIn),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}

buildDriverDetailWidget(ThemeData theme) {
  return InkWell(
    onTap: () {
      Get.toNamed(MyRoute.foodDriverDetail);
    },
    child: Row(
      children: [
        ClipOval(
          child: commonCacheImageWidget(
              "https://i.ibb.co/8jMCnBS/Type-Default-Component-Avatar-2.png",
              50,
              width: 50),
        ),
        10.width,
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Rayford Chenail',
                style: theme.textTheme.bodyMedium?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
              5.height,
              Text(
                'Yamaha MX King',
                style: theme.textTheme.bodySmall?.copyWith(
                    fontWeight: FontWeight.w500,
                    color: Get.isDarkMode ? colorGrey300 : colorGrey700),
              ),
            ],
          ),
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                SvgPicture.asset(
                  starGreenIcon,
                  width: 20,
                  height: 20,
                ),
                Text(
                  '4.8',
                  style: theme.textTheme.bodyMedium?.copyWith(
                      fontWeight: FontWeight.w500,
                      color: Get.isDarkMode ? colorGrey300 : colorGrey700),
                ),
              ],
            ),
            5.height,
            Text(
              'HSW 4736 XK',
              style: theme.textTheme.bodySmall?.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        )
      ],
    ),
  );
}
