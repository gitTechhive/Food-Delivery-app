import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:foodro/foodro/app/controller/food_payment_method_controller.dart';
import 'package:foodro/foodro/constant/food_images.dart';
import 'package:foodro/foodro/constant/food_strings.dart';
import 'package:get/get.dart';
import 'package:nb_utils/nb_utils.dart';

import '../../../constant/food_colors.dart';
import '../../../food_theme/food_theme.dart';
import '../../../widgets/food_app_widget.dart';
import '../../../widgets/food_common_button.dart';
import '../../model/payment_method.dart';

class FoodPaymentMethodScreen extends StatefulWidget {
  const FoodPaymentMethodScreen({super.key});

  @override
  PaymentMethodScreenState createState() => PaymentMethodScreenState();
}

class PaymentMethodScreenState extends State<FoodPaymentMethodScreen> {
  final FoodPaymentMethodController controller =
      Get.put(FoodPaymentMethodController());
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
          actionWidget: Padding(
            padding: const EdgeInsets.only(right: 20.0),
            child: SvgPicture.asset(
              scannerIcon,
              colorFilter: ColorFilter.mode(
                  Get.isDarkMode ? Colors.white : foodTextColor, BlendMode.srcIn),
            ),
          ),
          titleText: (controller.whichScreen == 'SETTING')
              ? paymentMethods
              : selectPaymentMethod),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              ListView.builder(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: controller.paymentMethods.length,
                itemBuilder: (context, index) {
                  var paymentMethod = controller.paymentMethods[index];
                  return Container(
                    height: 80,
                    margin: const EdgeInsets.symmetric(
                        vertical: 10, horizontal: 20),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(24),
                        color: Get.isDarkMode ? foodCardDark : Colors.white,
                        boxShadow: [cardBoxShadow]),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SvgPicture.asset(
                            paymentMethod.iconName,
                            width: 26,
                            height: 26,
                          ),
                          15.width,
                          Expanded(
                            child: Text(
                              paymentMethod.name,
                              style: theme.textTheme.bodyLarge?.copyWith(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          if (controller.whichScreen == 'SETTING')
                            Text(
                              'Connected',
                              style: theme.textTheme.bodyLarge?.copyWith(
                                  fontWeight: FontWeight.bold,
                                  color: foodColorPrimary),
                            ),
                          if (controller.whichScreen == 'CHECKOUT')
                            Obx(
                              () => Radio(
                                activeColor: foodColorPrimary,
                                value: paymentMethod,
                                groupValue: controller.selectedPayment.value,
                                onChanged: (selectedPayment) {
                                  controller.selectPayment(
                                      selectedPayment as PaymentMethod);
                                },
                              ),
                            )
                        ],
                      ),
                    ),
                  );
                },
              ),
              20.height,
              if (controller.whichScreen == 'CHECKOUT')
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: FoodCommonButton(
                    onPressed: () {},
                    text: addNewCard,
                    height: 58,
                    width: double.infinity,
                    bgColor:
                        Get.isDarkMode ? foodBorderDark : foodPrimaryColor100,
                    textColor: Get.isDarkMode ? whiteColor : foodColorPrimary,
                  ),
                ),
              20.height,
            ],
          ),
        ),
      ),
      bottomNavigationBar: (controller.whichScreen == 'SETTING')
          ? Container(
              color: Get.isDarkMode ? foodCardDark : Colors.white,
              height: 80,
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
                child: FoodCommonButton(
                    onPressed: () {
                      Get.back();
                    },
                    text: addNewCard),
              ),
            )
          : Container(
              color: Get.isDarkMode ? foodCardDark : Colors.white,
              height: 80,
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
                child: FoodCommonButton(onPressed: () {}, text: apply),
              ),
            ),
    );
  }
}
