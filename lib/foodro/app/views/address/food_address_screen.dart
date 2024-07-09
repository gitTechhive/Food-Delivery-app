import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:foodro/foodro/app/controller/food_address_controller.dart';
import 'package:foodro/foodro/app/model/food_delivery_address.dart';
import 'package:foodro/foodro/widgets/food_app_widget.dart';
import 'package:get/get.dart';
import 'package:nb_utils/nb_utils.dart';

import '../../../constant/food_colors.dart';
import '../../../constant/food_images.dart';
import '../../../constant/food_strings.dart';
import '../../../food_theme/food_theme.dart';
import '../../../widgets/food_common_button.dart';

class FoodDeliveryAddressScreen extends StatefulWidget {
  const FoodDeliveryAddressScreen({super.key});

  @override
  FoodDeliveryAddressState createState() => FoodDeliveryAddressState();
}

class FoodDeliveryAddressState extends State<FoodDeliveryAddressScreen> {
  FoodAddressController controller = Get.put(FoodAddressController());

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
          titleText:
              controller.isFromProfileScreen.isNotEmpty ? address : deliverTo),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              children: [
                Obx(
                  () => ListView.builder(
                      itemCount: controller.addressList.length,
                      itemBuilder: (context, index) {
                        FoodDeliveryAddress address =
                            controller.addressList[index];
                        // print(foodMenu.qty);
                        return Container(
                          margin: const EdgeInsets.symmetric(vertical: 10),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(24),
                              color:
                                  Get.isDarkMode ? foodCardDark : Colors.white,
                              boxShadow: [cardBoxShadow]),
                          child: Padding(
                            padding: const EdgeInsets.all(20.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                SvgPicture.asset(
                                  locationIcon,
                                  width: 50,
                                  height: 50,
                                ),
                                10.width,
                                Expanded(
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        children: [
                                          Text(
                                            address.addType.toString(),
                                            style: theme.textTheme.bodyLarge
                                                ?.copyWith(
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                          10.width,
                                          if (address.isDefault)
                                            Container(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      horizontal: 10,
                                                      vertical: 5),
                                              decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(6),
                                                  color: foodColorPrimary
                                                      .withOpacity(0.08)),
                                              child: Text(
                                                'Default',
                                                overflow: TextOverflow.ellipsis,
                                                style: theme
                                                    .textTheme.bodyMedium
                                                    ?.copyWith(
                                                  color: foodColorPrimary,
                                                  fontSize: 10,
                                                  fontWeight: FontWeight.w500,
                                                ),
                                              ),
                                            ),
                                        ],
                                      ),
                                      5.height,
                                      Text(
                                        address.address,
                                        overflow: TextOverflow.ellipsis,
                                        style: theme.textTheme.bodySmall
                                            ?.copyWith(
                                                fontWeight: FontWeight.w400,
                                                color: Get.isDarkMode
                                                    ? colorGrey300
                                                    : colorGrey700),
                                      ),
                                    ],
                                  ),
                                ),
                                if (controller
                                    .isFromProfileScreen.isEmptyOrNull)
                                  Obx(
                                    () => InkWell(
                                      onTap: () {
                                        setState(() {
                                          // print(controller.selectedIndex.value);
                                          controller.selectedIndex.value =
                                              index;
                                        });
                                      },
                                      child: SvgPicture.asset(
                                        (controller.selectedIndex.value ==
                                                index)
                                            ? checkedIcon
                                            : uncheckedIcon,
                                        width: 20,
                                        height: 20,
                                      ),
                                    ),
                                  ),
                                if (controller.isFromProfileScreen.isNotEmpty)
                                  InkWell(
                                    child: SvgPicture.asset(edit1Icon),
                                    onTap: () {},
                                  ),
                              ],
                            ),
                          ),
                        );
                      },
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true),
                ),
                20.height,
                if (controller.isFromProfileScreen.isEmptyOrNull)
                  FoodCommonButton(
                    onPressed: () {},
                    text: addNewAddress,
                    height: 58,
                    width: double.infinity,
                    bgColor:
                        Get.isDarkMode ? foodBorderDark : foodPrimaryColor100,
                    textColor: Get.isDarkMode ? whiteColor : foodColorPrimary,
                  )
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: Container(
        color: Get.isDarkMode ? foodCardDark : Colors.white,
        height: 80,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
          child: (controller.isFromProfileScreen.isEmptyOrNull)
              ? FoodCommonButton(onPressed: () {}, text: apply)
              : FoodCommonButton(onPressed: () {}, text: addNewAddress),
        ),
      ),
    );
  }
}
