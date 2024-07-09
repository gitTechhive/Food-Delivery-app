import 'package:flutter/material.dart';
import 'package:foodro/foodro/app/controller/food_language_controller.dart';
import 'package:foodro/foodro/constant/food_colors.dart';
import 'package:foodro/foodro/constant/food_strings.dart';
import 'package:foodro/foodro/widgets/food_app_widget.dart';
import 'package:get/get.dart';

import '../../../food_theme/food_theme.dart';

class LanguageListView extends StatefulWidget {
  const LanguageListView({super.key});

  @override
  LanguageListViewState createState() => LanguageListViewState();
}

class LanguageListViewState extends State<LanguageListView> {
  FoodLanguageController controller = Get.put(FoodLanguageController());
  late ThemeData theme;

  @override
  void initState() {
    super.initState();
    theme = Get.isDarkMode ? FoodTheme.foodDarkTheme : FoodTheme.foodLightTheme;
  }

  final List<String> languages = [
    "English (US)",
    "English (UK)",
    "Mandarin",
    "Hindi",
    "Spanish",
    "French",
    "Arabic",
    "Bengali",
    "Russian",
    "Indonesia",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: theme.scaffoldBackgroundColor,
      appBar: fdCommonAppBarWidget(context, titleText: language),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0,vertical: 10),
        child: ListView.builder(
          itemCount: languages.length,
          itemBuilder: (context, index) {
            final language = languages[index];
            return Obx(
              () => Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    language,
                    style: theme.textTheme.bodyLarge
                        ?.copyWith(fontWeight: FontWeight.w600),
                  ),
                  Radio(
                    activeColor: foodColorPrimary,
                    value: language,
                    groupValue: controller.selectedLanguage.value,
                    onChanged: (value) {
                      controller.setSelectedLanguage(value!);
                    },
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
