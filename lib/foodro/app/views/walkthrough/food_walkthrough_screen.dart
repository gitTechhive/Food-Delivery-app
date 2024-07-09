import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:foodro/foodro/app/views/walkthrough/walkthrough_page.dart';
import 'package:foodro/foodro/constant/food_colors.dart';
import 'package:foodro/foodro/constant/food_strings.dart';
import 'package:get/get.dart';
import 'package:nb_utils/nb_utils.dart';

import '../../../food_theme/food_theme.dart';
import '../../controller/food_walkthrough_controller.dart';

class FoodWalkThroughScreen extends StatefulWidget {
  const FoodWalkThroughScreen({super.key});

  @override
  FoodWalkThroughScreenState createState() => FoodWalkThroughScreenState();
}

class FoodWalkThroughScreenState extends State<FoodWalkThroughScreen> {
  final FoodWalkthroughController _controller =
      Get.put(FoodWalkthroughController());
  late ThemeData theme;

  @override
  void initState() {
    super.initState();
    theme = _controller.isDarkMode
        ? FoodTheme.foodDarkTheme
        : FoodTheme.foodLightTheme;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: theme.scaffoldBackgroundColor,
      body: SafeArea(
        child: Stack(
          children: [
            PageView.builder(
              controller: _controller.pageController, // Assign PageController
              itemCount: _controller.walkthroughs.length,
              onPageChanged: (index) {
                _controller.currentIndex = index;
              },
              itemBuilder: (context, index) {
                final walkthrough = _controller.walkthroughs[index];
                return WalkthroughPage(
                  title: walkthrough.title,
                  description: walkthrough.description,
                  image: walkthrough.image,
                  theme: theme,
                );
              },
            ),
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Container(
                color: theme.scaffoldBackgroundColor,
                child: Column(
                  children: [
                    Obx(() => DotsIndicator(
                          dotsCount: _controller.walkthroughs.length,
                          position: _controller.currentIndex.toDouble(),
                          decorator: DotsDecorator(
                            activeColor: foodColorPrimary,
                            size: const Size.square(9.0),
                            activeSize: const Size(18.0, 9.0),
                            activeShape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(5.0)),
                          ),
                        )),
                    20.height,
                    Obx(
                      () => Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 15.0),
                        child: SizedBox(
                          height: 55,
                          width: double.infinity,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                backgroundColor: foodColorPrimary),
                            onPressed: () {
                              // Handle the action when the next button is pressed
                              _controller.nextPage();
                            },
                            child: Text(
                              (_controller.currentIndex <
                                      _controller.walkthroughs.length - 1)
                                  ? next
                                  : getStarted,
                              style: theme.textTheme.bodyLarge?.copyWith(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white),
                            ),
                          ),
                        ),
                      ),
                    ),
                    20.height,
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
