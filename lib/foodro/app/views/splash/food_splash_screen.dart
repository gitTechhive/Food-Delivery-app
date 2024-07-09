import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:foodro/foodro/constant/food_colors.dart';
import 'package:foodro/foodro/constant/food_strings.dart';
import 'package:get/get.dart';
import 'package:nb_utils/nb_utils.dart';


import '../../../constant/food_images.dart';
import '../../../food_theme/food_theme.dart';
import '../../controller/food_splash_controller.dart';



class FoodSplashScreen extends StatefulWidget {
  const FoodSplashScreen({super.key});

  @override
  FoodSplashScreenState createState() => FoodSplashScreenState();
}

class FoodSplashScreenState extends State<FoodSplashScreen> {
  FoodSplashController controller = FoodSplashController();
  late ThemeData theme;

  @override
  void initState() {
    super.initState();
    theme = Get.isDarkMode ? FoodTheme.foodDarkTheme : FoodTheme.foodLightTheme;
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<FoodSplashController>(
        init: controller,
        tag: 'food_splash',
        // theme: theme,
        builder: (controller) {
          return Scaffold(
            backgroundColor: theme.scaffoldBackgroundColor,
            body: Stack(
              children: [
                Center(
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SvgPicture.asset(logoImg, height: 60, width: 60).center(),
                      10.width,
                      Text(
                        appName,
                        style: theme
                            .textTheme
                            .displayMedium
                            ?.copyWith(fontWeight: FontWeight.w900),
                      )
                    ],
                  ),
                ),
                const Positioned(
                  bottom: 40,
                  left: 0,
                  right: 0,
                  child: SpinKitCircle(
                      size: 60,
                      color: foodColorPrimary,
                      duration: Duration(seconds: 2)),
                ),
              ],
            ),
          );
        });
  }
}
