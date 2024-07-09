import 'package:flutter/material.dart';
import 'package:foodro/foodro/app/controller/welcome_signin_controller.dart';
import 'package:foodro/foodro/constant/food_colors.dart';
import 'package:foodro/foodro/constant/food_images.dart';
import 'package:foodro/foodro/widgets/food_app_widget.dart';
import 'package:foodro/foodro/widgets/food_common_button.dart';
import 'package:foodro/foodro/widgets/food_custom_button_with_icon.dart';
import 'package:get/get.dart';
import 'package:nb_utils/nb_utils.dart';

import '../../../constant/food_strings.dart';
import '../../../food_theme/food_theme.dart';

class FoodWelcomeSignInScreen extends StatefulWidget {
  const FoodWelcomeSignInScreen({super.key});

  @override
  FoodWelcomeSignInScreenState createState() => FoodWelcomeSignInScreenState();
}

class FoodWelcomeSignInScreenState extends State<FoodWelcomeSignInScreen> {
  late ThemeData theme;
  FoodWelcomeSignInController controller =
      Get.put(FoodWelcomeSignInController());

  @override
  void initState() {
    super.initState();
    theme = controller.isDarkMode
        ? FoodTheme.foodDarkTheme
        : FoodTheme.foodLightTheme;
    // print(controller.isDarkMode);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: theme.scaffoldBackgroundColor,
        appBar: fdCommonAppBarWidget(context),
        body: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset(
                  welcomeSignIn,
                  width: 237,
                  height: 200,
                ),
                20.height,
                Text(
                  letYouIn,
                  style: theme.textTheme.displayMedium
                      ?.copyWith(fontWeight: FontWeight.w900, fontSize: 32),
                ),
                30.height,
                SizedBox(
                  width: MediaQuery.of(context).size.width,
                  child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 12),
                      child: FoodCustomButtonWithIcon(
                        icon: fbIcon,
                        onPressed: () {},
                        text: continueWithFacebook,
                        theme: theme,
                      )),
                ),
                20.height,
                SizedBox(
                  width: MediaQuery.of(context).size.width,
                  child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 12),
                      child: FoodCustomButtonWithIcon(
                        icon: googleIcon,
                        onPressed: () {},
                        text: continueWithGoogle,
                        theme: theme,
                      )),
                ),
                20.height,
                SizedBox(
                  width: MediaQuery.of(context).size.width,
                  child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 12),
                      child: FoodCustomButtonWithIcon(
                        icon:
                            controller.isDarkMode ? appleWhiteIcon : appleIcon,
                        onPressed: () {},
                        text: continueWithApple,
                        theme: theme,
                      )),
                ),
                20.height,
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15.0),
                  child: SizedBox(
                    height: 30,
                    child: Row(
                      children: [
                        Expanded(
                            child: Container(
                                height: 0.2,
                                color: controller.isDarkMode
                                    ? Colors.white.withOpacity(0.6)
                                    : Colors.black26)),
                        10.width,
                        Text(or,
                            style: theme.textTheme.bodyMedium?.copyWith(
                                color: controller.isDarkMode
                                    ? Colors.white
                                    : colorGrey700,
                                fontWeight: FontWeight.w600)),
                        10.width,
                        Expanded(
                            child: Container(
                                height: 0.2,
                                color: controller.isDarkMode
                                    ? Colors.white.withOpacity(0.6)
                                    : Colors.black26)),
                      ],
                    ),
                  ),
                ),
                15.height,
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15.0),
                  child: FoodCommonButton(
                      onPressed: () {
                        controller.goToSignInScreen();
                      },
                      text: signWithPhoneNumber),
                ),
                TextButton(
                  onPressed: () {
                    controller.goToSignupScreen();
                  },
                  child: Text.rich(
                    TextSpan(
                      text: dontHaveAccount,
                      style: theme.textTheme.bodyMedium?.copyWith(
                        fontWeight: FontWeight.w400,
                      ),
                      children: [
                        TextSpan(
                            text: signUpWithSpace,
                            style: theme.textTheme.bodyMedium?.copyWith(
                                fontWeight: FontWeight.w600,
                                color: foodColorPrimary)),
                      ],
                    ),
                  ),
                ).center(),
              ],
            ),
          ),
        ));
  }
}
