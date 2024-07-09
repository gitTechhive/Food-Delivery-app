import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:foodro/foodro/app/controller/food_wallet_top_up_controller.dart';
import 'package:foodro/foodro/constant/food_colors.dart';
import 'package:foodro/foodro/constant/food_strings.dart';
import 'package:foodro/foodro/widgets/food_app_widget.dart';
import 'package:foodro/foodro/widgets/food_common_button.dart';
import 'package:get/get.dart';
import 'package:nb_utils/nb_utils.dart';

import '../../../../../route/my_route.dart';
import '../../../constant/food_images.dart';
import '../../../food_theme/food_theme.dart';

class FoodWalletTopUpScreen extends StatefulWidget {
  const FoodWalletTopUpScreen({super.key});

  @override
  FoodWalletTopUpScreenState createState() => FoodWalletTopUpScreenState();
}

class FoodWalletTopUpScreenState extends State<FoodWalletTopUpScreen> {
  late FoodWalletTopUPController controller;

  late ThemeData theme;

  @override
  void initState() {
    super.initState();
    controller = Get.put(FoodWalletTopUPController());
    theme = Get.isDarkMode ? FoodTheme.foodDarkTheme : FoodTheme.foodLightTheme;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: theme.scaffoldBackgroundColor,
      appBar: fdCommonAppBarWidget(
        context,
        titleText: topUpWallet,
        actionWidget: Padding(
          padding: const EdgeInsets.all(8.0),
          child: InkWell(
            onTap: () {},
            child: SvgPicture.asset(
              searchIcon,
              width: 22,
              height: 22,
              colorFilter: ColorFilter.mode(
                  Get.isDarkMode ? Colors.white : Colors.black,
                  BlendMode.srcIn),
            ),
          ),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                enterTheAmount,
                style: theme.textTheme.bodyLarge?.copyWith(
                    fontWeight: FontWeight.w500,
                    color: Get.isDarkMode ? Colors.white : colorGrey800),
              ),
              20.height,
              TextFormField(
                maxLines: 1,
                style: theme.textTheme.displayLarge?.copyWith(
                  fontWeight: FontWeight.bold,
                  color: Get.isDarkMode
                      ? whiteColor
                      : foodTextColor, // Set your desired text color
                ),
                textAlign: TextAlign.center,
                textInputAction: TextInputAction.done,
                keyboardType: TextInputType.text,
                focusNode: controller.f1,
                onFieldSubmitted: (v) {
                  controller.f1.unfocus();
                },
                validator: (k) {
                  return null;
                },
                controller: controller.amountController,
                decoration: inputDecoration(
                  context,
                  borderWidth: 2.0,
                  borderColor: foodColorPrimary,
                  fillColor: Get.isDarkMode ? foodDarkPrimary : Colors.white,
                  hintColor: Get.isDarkMode
                      ? whiteColor.withOpacity(0.60)
                      : foodTextColor.withOpacity(0.60),
                  borderRadius: 32,
                ),
              ),
              20.height,
              Obx(
                () => GridView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    crossAxisSpacing: 20.0,
                    mainAxisSpacing: 20.0,
                    childAspectRatio: 2.5,
                  ),
                  itemCount: controller.listOfAmount.length,
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: () {
                        controller.amountController.text = controller.listOfAmount[index];
                      },
                      child: Center(
                        child: Container(
                          width: 116,
                          padding: const EdgeInsets.symmetric(
                              horizontal: 20, vertical: 5),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              border: Border.all(
                                  color: foodColorPrimary, width: 2)),
                          child: Text(
                            controller.listOfAmount[index],
                            overflow: TextOverflow.ellipsis,
                            textAlign: TextAlign.center,
                            style: theme.textTheme.bodyLarge?.copyWith(
                              color: foodColorPrimary,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
              30.height,
              FoodCommonButton(onPressed: () {
                Get.toNamed(MyRoute.foodWalletPayment);
              }, text: continueText)
            ],
          ),
        ),
      ),
    );
  }
}
