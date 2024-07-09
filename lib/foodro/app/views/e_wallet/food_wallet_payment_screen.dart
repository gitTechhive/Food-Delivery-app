import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:foodro/foodro/app/controller/food_payment_method_controller.dart';
import 'package:foodro/foodro/app/views/e_wallet/top_up_sucess_dialog.dart';
import 'package:foodro/foodro/constant/food_strings.dart';
import 'package:get/get.dart';
import 'package:nb_utils/nb_utils.dart';

import '../../../constant/food_colors.dart';
import '../../../food_theme/food_theme.dart';
import '../../../widgets/food_app_widget.dart';
import '../../../widgets/food_common_button.dart';
import '../../model/payment_method.dart';

class FoodWalletPaymentScreen extends StatefulWidget {
  const FoodWalletPaymentScreen({super.key});

  @override
  FoodWalletPaymentScreenState createState() => FoodWalletPaymentScreenState();
}

class FoodWalletPaymentScreenState extends State<FoodWalletPaymentScreen> {
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
      appBar: fdCommonAppBarWidget(context, titleText: topUpWallet),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              ListView.builder(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: controller.walletPaymentMethods.length,
                itemBuilder: (context, index) {
                  var paymentMethod = controller.walletPaymentMethods[index];
                  return Obx(() => Container(
                        margin: const EdgeInsets.symmetric(
                            vertical: 10, horizontal: 20),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(24),
                            color: Get.isDarkMode ? foodCardDark : Colors.white,
                            boxShadow: [cardBoxShadow]),
                        child: Padding(
                          padding: const EdgeInsets.all(15.0),
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
                              Radio(
                                activeColor: foodColorPrimary,
                                value: paymentMethod,
                                groupValue:
                                    controller.selectedWalletPayment.value,
                                onChanged: (selectedPayment) {
                                  controller.selectWalletPayment(
                                      selectedPayment as PaymentMethod);
                                },
                              )
                            ],
                          ),
                        ),
                      ));
                },
              ),
              20.height,
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
      bottomNavigationBar: Container(
        color: Get.isDarkMode ? foodCardDark : Colors.white,
        height: 80,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
          child: FoodCommonButton(
              onPressed: () async {
                await TopUpSuccessDialog()
                    .customDialog(context, theme);
              },
              text: continueText),
        ),
      ),
    );
  }
}
