import 'package:flag/flag_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:foodro/foodro/app/controller/food_edit_profile_controller.dart';
import 'package:foodro/foodro/constant/food_strings.dart';
import 'package:get/get.dart';
import 'package:nb_utils/nb_utils.dart';

import '../../../constant/food_colors.dart';
import '../../../constant/food_images.dart';
import '../../../food_theme/food_theme.dart';
import '../../../widgets/food_app_widget.dart';
import '../../../widgets/food_common_button.dart';
import '../../model/countries.dart';
import '../profile/food_user_profile_widget.dart';

class FoodEditProfileScreen extends StatefulWidget {
  const FoodEditProfileScreen({super.key});

  @override
  FoodEditProfileScreenState createState() => FoodEditProfileScreenState();
}

class FoodEditProfileScreenState extends State<FoodEditProfileScreen> {
  late FoodEditProfileController controller =
      Get.put(FoodEditProfileController());
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
      appBar: fdCommonAppBarWidget(context, titleText: profile),
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
                  const Center(child: UserProfilePictureWidget()),
                  30.height,
                  TextFormField(
                    style: theme.textTheme.bodyLarge?.copyWith(
                      fontWeight: FontWeight.w600,
                      color: Get.isDarkMode
                          ? whiteColor
                          : foodTextColor, // Set your desired text color
                    ),
                    textInputAction: TextInputAction.done,
                    keyboardType: TextInputType.text,
                    focusNode: controller.f1,
                    onFieldSubmitted: (v) {
                      controller.f1.unfocus();
                      FocusScope.of(context).requestFocus(controller.f2);
                    },
                    validator: (k) {
                      return null;
                    },
                    controller: controller.fullnameController,
                    decoration: inputDecoration(context,
                        borderColor:
                            Get.isDarkMode ? foodCardDark : colorGrey50,
                        fillColor: Get.isDarkMode ? foodCardDark : colorGrey50,
                        hintColor: Get.isDarkMode
                            ? whiteColor.withOpacity(0.60)
                            : foodTextColor.withOpacity(0.60),
                        borderRadius: textFieldRadius,
                        hintText: fullName),
                  ),
                  20.height,
                  TextFormField(
                    style: theme.textTheme.bodyLarge?.copyWith(
                      fontWeight: FontWeight.w600,
                      color: Get.isDarkMode
                          ? whiteColor
                          : foodTextColor, // Set your desired text color
                    ),
                    textInputAction: TextInputAction.done,
                    keyboardType: TextInputType.text,
                    focusNode: controller.f2,
                    onFieldSubmitted: (v) {
                      controller.f2.unfocus();
                      FocusScope.of(context).requestFocus(controller.f3);
                    },
                    validator: (k) {
                      return null;
                    },
                    controller: controller.nickNameController,
                    decoration: inputDecoration(context,
                        borderColor:
                            Get.isDarkMode ? foodCardDark : colorGrey50,
                        fillColor: Get.isDarkMode ? foodCardDark : colorGrey50,
                        hintColor: Get.isDarkMode
                            ? whiteColor.withOpacity(0.60)
                            : foodTextColor.withOpacity(0.60),
                        borderRadius: textFieldRadius,
                        hintText: nickName),
                  ),
                  20.height,
                  TextFormField(
                    style: theme.textTheme.bodyLarge?.copyWith(
                      fontWeight: FontWeight.w600,
                      color: Get.isDarkMode
                          ? whiteColor
                          : foodTextColor, // Set your desired text color
                    ),
                    textInputAction: TextInputAction.done,
                    keyboardType: TextInputType.text,
                    focusNode: controller.f3,
                    onFieldSubmitted: (v) {
                      controller.f3.unfocus();
                      FocusScope.of(context).requestFocus(controller.f4);
                    },
                    validator: (k) {
                      return null;
                    },
                    controller: controller.dateOfBirthController,
                    decoration: inputDecoration(context,
                        prefixIconColor: colorGrey500,
                        prefixIcon: calendarIcon,
                        borderColor:
                            Get.isDarkMode ? foodCardDark : colorGrey50,
                        fillColor: Get.isDarkMode ? foodCardDark : colorGrey50,
                        hintColor: Get.isDarkMode
                            ? whiteColor.withOpacity(0.60)
                            : foodTextColor.withOpacity(0.60),
                        borderRadius: textFieldRadius,
                        hintText: dateOffBirth),
                  ),
                  20.height,
                  TextFormField(
                    style: theme.textTheme.bodyLarge?.copyWith(
                      fontWeight: FontWeight.w600,
                      color: Get.isDarkMode
                          ? whiteColor
                          : foodTextColor, // Set your desired text color
                    ),
                    textInputAction: TextInputAction.next,
                    keyboardType: TextInputType.emailAddress,
                    focusNode: controller.f4,
                    onFieldSubmitted: (v) {
                      controller.f4.unfocus();
                      FocusScope.of(context).requestFocus(controller.f5);
                    },
                    validator: (k) {
                      if (!k!.contains('@')) {
                        return errEmailCorrect;
                      }
                      return null;
                    },
                    controller: controller.emailController,
                    decoration: inputDecoration(context,
                        prefixIconColor: colorGrey500,
                        borderColor:
                            Get.isDarkMode ? foodCardDark : colorGrey50,
                        fillColor: Get.isDarkMode ? foodCardDark : colorGrey50,
                        hintColor: Get.isDarkMode
                            ? whiteColor.withOpacity(0.60)
                            : foodTextColor.withOpacity(0.60),
                        prefixIcon: emailBorderIcon,
                        borderRadius: textFieldRadius,
                        hintText: email),
                  ),
                  20.height,
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    decoration: BoxDecoration(
                        color: Get.isDarkMode ? foodCardDark : colorGrey50,
                        borderRadius: BorderRadius.circular(defaultRadius)),
                    child: Row(
                      children: [
                        10.width,
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
                            style: theme.textTheme.bodyLarge?.copyWith(
                              fontWeight: FontWeight.w600,
                              color: Get.isDarkMode
                                  ? whiteColor
                                  : foodTextColor, // Set your desired text color
                            ),
                            textInputAction: TextInputAction.next,
                            keyboardType: TextInputType.phone,
                            focusNode: controller.f5,
                            onFieldSubmitted: (v) {
                              controller.f5.unfocus();
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
                  Obx(
                    () => DropdownButtonFormField<Gender>(
                      value: controller.selectedGender.value,
                      onChanged: (Gender? gender) {
                        if (gender != null) {
                          controller.updateSelectedGender(gender);
                        }
                      },
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Get.isDarkMode ? foodCardDark : colorGrey50,
                        contentPadding: const EdgeInsets.symmetric(
                            horizontal: 16, vertical: 18),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                          borderSide: BorderSide.none,
                        ),
                      ),
                      items: Gender.values
                          .map<DropdownMenuItem<Gender>>((Gender gender) {
                        return DropdownMenuItem<Gender>(
                          value: gender,
                          child: Text(
                            gender.toString().split('.').last,
                            style: theme.textTheme.bodyMedium?.copyWith(
                                color: Get.isDarkMode
                                    ? Colors.white
                                    : foodTextColor,
                                fontWeight: FontWeight.w400),
                          ),
                        );
                      }).toList(),
                    ),
                  ),
                  20.height,
                  FoodCommonButton(
                    onPressed: () {},
                    text: update,
                    bgColor: foodColorPrimary,
                  ),
                  20.height,
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
}
