import 'package:flutter/material.dart';
import 'package:foodro/foodro/constant/food_strings.dart';
import 'package:foodro/foodro/app/controller/welcome_controller.dart';

import 'package:get/get.dart';
import 'package:nb_utils/nb_utils.dart';

import '../../../constant/food_images.dart';
import '../../../food_theme/food_theme.dart';
import '../../../widgets/food_app_widget.dart';



class FoodWelcomeScreen extends StatefulWidget {
  const FoodWelcomeScreen({super.key});

  @override
  FoodWelcomeScreenState createState() => FoodWelcomeScreenState();
}

class FoodWelcomeScreenState extends State<FoodWelcomeScreen> {
  late ThemeData theme;
  FoodWelcomeController controller = Get.put(FoodWelcomeController());

  @override
  void initState() {
    super.initState();
    theme = controller.isDarkMode ? FoodTheme.foodDarkTheme : FoodTheme.foodLightTheme;
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
        backgroundColor: theme.scaffoldBackgroundColor,
        body: Stack(
      children: <Widget>[
        Container(
          decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage(welcomeImg), fit: BoxFit.cover)),
        ),
        Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text(welcomeMsg,
                  textAlign: TextAlign.center,
                  style: theme
                      .textTheme
                      .displaySmall
                      ?.copyWith(
                          fontWeight: FontWeight.w900,
                          foreground: Paint()..shader = linearGradient,
                          letterSpacing: 0.5,
                          height: 1.2)),
              10.height,
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Text(desc,
                    textAlign: TextAlign.center,
                    style: theme
                        .textTheme
                        .bodyMedium
                        ?.copyWith(
                            color: Colors.white,
                            fontWeight: FontWeight.w400,
                            height: 1.2)),
              ),
              20.height,
            ],
          ),
        ),
      ],
    ));
  }
}
