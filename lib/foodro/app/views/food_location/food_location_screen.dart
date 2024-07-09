import 'package:flutter/material.dart';
import 'package:foodro/foodro/app/controller/food_location_controller.dart';
import 'package:foodro/foodro/constant/food_colors.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:nb_utils/nb_utils.dart';

import '../../../constant/food_images.dart';
import '../../../constant/food_strings.dart';
import '../../../food_theme/food_theme.dart';
import '../../../widgets/food_app_widget.dart';
import '../../../widgets/food_common_button.dart';
import 'account_creation_success_dialog.dart';

class FoodLocationScreen extends StatefulWidget {
  const FoodLocationScreen({super.key});

  @override
  FoodLocationScreenState createState() => FoodLocationScreenState();
}

class FoodLocationScreenState extends State<FoodLocationScreen> {
  final FoodLocationController controller = Get.put(FoodLocationController());

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
      appBar: fdCommonAppBarWidget(context, titleText: fillYourProfile),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Form(
            key: controller.formKey,
            child: Stack(
              children: [
                Container(
                    color: Colors.transparent,
                    height: context.w,
                    child: Obx(
                      () {
                        if (controller.locationData.value.latitude == 0 ||
                            controller.locationData.value.longitude == 0) {
                          return const Center(
                              child: CircularProgressIndicator(
                            color: foodColorPrimary,
                          ));
                        }
                        return SizedBox(
                          height: context.w / 1,
                          width: double.infinity,
                          child: GoogleMap(
                            initialCameraPosition: CameraPosition(
                              target: LatLng(
                                controller.locationData.value.latitude,
                                controller.locationData.value.longitude,
                              ),
                              zoom: 15,
                            ),
                            markers: {
                              Marker(
                                markerId: const MarkerId('current_location'),
                                position: LatLng(
                                  controller.locationData.value.latitude,
                                  controller.locationData.value.longitude,
                                ),
                                infoWindow:
                                    const InfoWindow(title: 'Current Location'),
                              ),
                            },
                            onMapCreated: (GoogleMapController controller) {},
                          ),
                        );
                      },
                    )),
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
                                location,
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
                            TextFormField(
                              // readOnly: true,
                              style: TextStyle(
                                color: Get.isDarkMode
                                    ? whiteColor
                                    : foodTextColor, // Set your desired text color
                              ),
                              textInputAction: TextInputAction.done,
                              keyboardType: TextInputType.streetAddress,
                              focusNode: controller.f1,
                              onFieldSubmitted: (v) {
                                controller.f1.unfocus();
                              },
                              validator: (k) {
                                return null;
                              },
                              controller: controller.addressController,
                              decoration: inputDecoration(context,
                                  prefixIconColor:
                                      Get.isDarkMode ? whiteColor : blackColor,
                                  borderColor: Get.isDarkMode
                                      ? foodCardDark
                                      : colorGrey50,
                                  fillColor: Get.isDarkMode
                                      ? foodCardDark
                                      : colorGrey50,
                                  hintColor: Get.isDarkMode
                                      ? whiteColor.withOpacity(0.60)
                                      : foodTextColor.withOpacity(0.60),
                                  suffixIcon: mapIcon,
                                  borderRadius: textFieldRadius,
                                  hintText: address),
                            ),
                            10.height,
                            Divider(
                                color: Get.isDarkMode
                                    ? foodBorderDark
                                    : foodBorderColor,
                                thickness: 1),
                            10.height,
                            FoodCommonButton(
                              onPressed: () async {
                                await AccountCreationSuccessDialog()
                                    .customDialog(context, theme);
                              },
                              text: continueText,
                              bgColor: foodColorPrimary,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  final BoxDecoration iconBorderStyle = BoxDecoration(
      borderRadius: BorderRadius.circular(20),
      border: Border.all(
          color: Get.isDarkMode ? foodBorderDark : foodBorderColor, width: 1));
}
