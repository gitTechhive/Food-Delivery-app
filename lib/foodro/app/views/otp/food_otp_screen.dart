import 'package:flutter/material.dart';
import 'package:foodro/foodro/app/controller/food_otp_controller.dart';
import 'package:foodro/foodro/constant/food_colors.dart';
import 'package:foodro/foodro/widgets/food_common_button.dart';
import 'package:get/get.dart';
import 'package:nb_utils/nb_utils.dart';

import '../../../constant/food_strings.dart';
import '../../../food_theme/food_theme.dart';
import '../../../widgets/food_app_widget.dart';
import 'otp_text_field.dart';

class FoodOtpScreen extends StatefulWidget {
  const FoodOtpScreen({super.key});

  @override
  FoodOtpScreenState createState() => FoodOtpScreenState();
}

class FoodOtpScreenState extends State<FoodOtpScreen> {
  final FoodOtpController controller = Get.put(FoodOtpController());
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
      appBar: fdCommonAppBarWidget(context, titleText: otpCodeVerification),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Form(
              key: controller.formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                // crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  50.height,
                  Text(
                    otpCodeSendToBe,
                    style: theme.textTheme.bodyLarge
                        ?.copyWith(fontWeight: FontWeight.w500),
                  ),
                  50.height,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List.generate(
                      4,
                      (index) => Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 5.0),
                        child: OtpTextField(
                          focusNode: controller.focusNodes[index],
                          onTextChanged: (value) {
                            controller.otpValues[index] = value;
                            if (value.length == 1) {
                              FocusScope.of(context).nextFocus();
                            }
                          }, theme: theme,
                        ),
                      ),
                    ),
                  ),
                  20.height,
                  TextButton(
                    onPressed: () {},
                    child: Text.rich(
                      TextSpan(
                        text: getCode,
                        style: theme.textTheme.bodyLarge
                            ?.copyWith(fontWeight: FontWeight.w500),
                        children: [
                          TextSpan(
                              text: resend,
                              style: theme.textTheme.bodyLarge?.copyWith(
                                  fontWeight: FontWeight.w500,
                                  color: foodColorPrimary)),
                        ],
                      ),
                    ),
                  ).center(),
                  30.height,
                  FoodCommonButton(
                    onPressed: () {
                      controller.goToNextScreen();
                    },
                    text: verify,
                    bgColor: foodColorPrimary,
                  ),
                ],
              ),
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
