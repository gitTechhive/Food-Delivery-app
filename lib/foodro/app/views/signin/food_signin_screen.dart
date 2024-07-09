import 'package:flag/flag_widget.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:foodro/foodro/app/controller/food_signin_controller.dart';
import 'package:foodro/foodro/app/model/countries.dart';
import 'package:foodro/foodro/constant/food_colors.dart';
import 'package:foodro/foodro/widgets/food_common_button.dart';
import 'package:get/get.dart';
import 'package:nb_utils/nb_utils.dart';

import '../../../constant/food_images.dart';
import '../../../constant/food_strings.dart';
import '../../../food_theme/food_theme.dart';
import '../../../widgets/food_app_widget.dart';

class FoodSignInScreen extends StatefulWidget {
  const FoodSignInScreen({super.key});

  @override
  FoodSignInScreenState createState() => FoodSignInScreenState();
}

class FoodSignInScreenState extends State<FoodSignInScreen> {
  final FoodSignInController controller = Get.put(FoodSignInController());
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
      appBar: fdCommonAppBarWidget(context),
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
                  Center(
                    child: SvgPicture.asset(
                      logoImg,
                      width: 100,
                      height: 100,
                    ),
                  ),
                  Text(
                    loginToYourAccount,
                    style: theme.textTheme.headlineMedium
                        ?.copyWith(fontWeight: FontWeight.bold),
                  ),
                  30.height,
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    decoration: BoxDecoration(
                        color: Get.isDarkMode ? foodCardDark : colorGrey50,
                        borderRadius: BorderRadius.circular(defaultRadius)),
                    child: Row(
                      children: [
                        8.width,
                        Obx(
                              () => InkWell(
                            onTap: () {
                              showCountryDialog(context);
                            },
                            child: Flag.fromString(
                              controller.selectedCountryCode.value.code,
                              height: 18,
                              width: 24,
                              borderRadius: 5,
                            ),
                          ),
                        ),
                        8.width,
                        SvgPicture.asset(
                          dropdownIcon,
                          colorFilter: ColorFilter.mode(
                              Get.isDarkMode ? Colors.white : foodTextColor,
                              BlendMode.srcIn),
                        ),
                        10.width,
                        Obx(
                          () => InkWell(
                            child: Text(
                              controller.selectedCountryCode.value.dialCode,
                              style: theme.textTheme.bodyMedium?.copyWith(
                                fontWeight: FontWeight.w500,
                                color: Get.isDarkMode
                                    ? whiteColor
                                    : foodTextColor, // Set your desired text color
                              ),
                            ),
                            onTap: () {
                              showCountryDialog(context);
                            },
                          ),
                        ),
                        10.width,
                        Expanded(
                          child: TextFormField(
                            style: TextStyle(
                              color: Get.isDarkMode
                                  ? whiteColor
                                  : foodTextColor, // Set your desired text color
                            ),
                            textInputAction: TextInputAction.next,
                            keyboardType: TextInputType.phone,
                            focusNode: controller.f1,
                            onFieldSubmitted: (v) {
                              controller.f1.unfocus();
                            },
                            validator: (k) {
                              return null;
                            },
                            controller: controller.phoneController,
                            decoration: inputDecoration(context,
                                leftContentPadding: 5,
                                prefixIconColor: colorGrey500,
                                borderColor:
                                    Get.isDarkMode ? foodCardDark : colorGrey50,
                                fillColor:
                                    Get.isDarkMode ? foodCardDark : colorGrey50,
                                hintColor: Get.isDarkMode
                                    ? whiteColor.withOpacity(0.60)
                                    : foodTextColor.withOpacity(0.60),
                                borderRadius: textFieldRadius,
                                hintText: phoneHint),
                          ),
                        ), // Display the dialing code
                      ],
                    ),
                  ),
                  20.height,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Checkbox(
                          checkColor: Colors.white,
                          activeColor: foodColorPrimary,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5.0),
                              side: const BorderSide(
                                  color: foodColorPrimary, width: 1)),
                          // Circle Checkbox
                          value: controller.rememberMe,
                          onChanged: (value) {
                            setState(() {
                              controller.rememberMe = value!;
                            });
                          }),
                      Text(rememberMe,
                          style: theme.textTheme.bodyLarge
                              ?.copyWith(fontWeight: FontWeight.w600)),
                    ],
                  ),
                  20.height,
                  FoodCommonButton(
                    onPressed: () {
                      controller.goToOtpScreen();
                    },
                    text: signIn,
                    bgColor: foodColorPrimary,
                  ),
                  30.height,
                  SizedBox(
                    height: 30,
                    child: Row(
                      children: [
                        Expanded(
                            child: Container(
                                height: 0.2,
                                color: Get.isDarkMode
                                    ? Colors.white.withOpacity(0.6)
                                    : Colors.black26)),
                        10.width,
                        Text(orContinueWith,
                            style: theme.textTheme.bodyMedium?.copyWith(
                                color: colorGrey600,
                                fontWeight: FontWeight.w600)),
                        10.width,
                        Expanded(
                            child: Container(
                                height: 0.2,
                                color: Get.isDarkMode
                                    ? Colors.white.withOpacity(0.6)
                                    : Colors.black26)),
                      ],
                    ),
                  ),
                  30.height,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                        decoration: iconBorderStyle,
                        padding: const EdgeInsets.symmetric(
                            horizontal: 15, vertical: 5),
                        child: IconButton(
                          icon: SvgPicture.asset(fbIcon),
                          iconSize: iconSize,
                          onPressed: () {},
                        ),
                      ),
                      Container(
                        decoration: iconBorderStyle,
                        padding: const EdgeInsets.symmetric(
                            horizontal: 15, vertical: 5),
                        child: IconButton(
                          icon: SvgPicture.asset(googleIcon),
                          iconSize: iconSize,
                          onPressed: () {},
                        ),
                      ),
                      Container(
                        decoration: iconBorderStyle,
                        padding: const EdgeInsets.symmetric(
                            horizontal: 15, vertical: 5),
                        child: IconButton(
                          icon: SvgPicture.asset(
                              Get.isDarkMode ? appleWhiteIcon : appleIcon),
                          iconSize: iconSize,
                          onPressed: () {},
                        ),
                      ),
                    ],
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
          ),
        ),
      ),
    );
  }

  void showCountryDialog(BuildContext context) {
    final TextEditingController searchController = TextEditingController();
    List<FoodCountries> filteredCountries = controller.listOfCountries;

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return StatefulBuilder(
          builder: (context, setState) {
            return AlertDialog(
              title: Text(
                'Select a Country',
                style: theme.textTheme.titleLarge
                    ?.copyWith(fontWeight: FontWeight.w600),
              ),
              content: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Container(
                      width: double.infinity,
                      padding: const EdgeInsets.only(bottom: 8.0),
                      child: TextField(
                        controller: searchController,
                        decoration: inputDecoration(context,
                            borderRadius: 8,
                            borderColor:
                                Get.isDarkMode ? foodCardDark : colorGrey50,
                            fillColor:
                                Get.isDarkMode ? foodCardDark : colorGrey50,
                            hintColor: Get.isDarkMode
                                ? whiteColor.withOpacity(0.60)
                                : foodTextColor.withOpacity(0.60),
                            hintText: 'Search here...'),
                        onChanged: (value) {
                          setState(() {
                            // Filter the countries based on the search query
                            filteredCountries = controller.listOfCountries
                                .where((country) => country.name
                                    .toLowerCase()
                                    .contains(value.toLowerCase()))
                                .toList();
                          });
                        },
                      ),
                    ),
                    SizedBox(
                      width: double.maxFinite,
                      height: MediaQuery.of(context).size.height *
                          0.5, // Adjust height as needed
                      child: ListView.builder(
                        physics: const AlwaysScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: filteredCountries.length,
                        itemBuilder: (context, index) {
                          var country = filteredCountries[index];
                          return ListTile(
                            contentPadding: EdgeInsets.zero,
                            leading: Flag.fromString(
                              country.code,
                              height: 30,
                              width: 50,
                            ),
                            title: Text(
                              country.name,
                              style: theme.textTheme.bodyMedium
                                  ?.copyWith(fontWeight: FontWeight.w500),
                            ),
                            onTap: () {
                              // Do something when a country is selected
                              controller.selectedCountryCode.value = country;
                              if (kDebugMode) {
                                print('Selected: ${country.name}');
                              }
                              Get.back();
                            },
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        );
      },
    );
  }

  final BoxDecoration iconBorderStyle = BoxDecoration(
      borderRadius: BorderRadius.circular(20),
      border: Border.all(
          color: Get.isDarkMode ? foodBorderDark : foodBorderColor, width: 1));
}
