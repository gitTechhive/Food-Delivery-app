import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:foodro/foodro/app/controller/food_help_center_controller.dart';
import 'package:foodro/foodro/constant/food_colors.dart';
import 'package:foodro/foodro/constant/food_strings.dart';
import 'package:foodro/foodro/widgets/food_app_widget.dart';
import 'package:get/get.dart';
import 'package:nb_utils/nb_utils.dart';

import '../../../../route/my_route.dart';
import '../../../constant/food_images.dart';
import '../../../food_theme/food_theme.dart';

class FoodHelpCenterScreen extends StatefulWidget {
  const FoodHelpCenterScreen({super.key});

  @override
  FoodHelpCenterScreenState createState() => FoodHelpCenterScreenState();
}

class FoodHelpCenterScreenState extends State<FoodHelpCenterScreen> {
  FoodHelpCenterController controller = Get.put(FoodHelpCenterController());
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
        appBar: fdCommonAppBarWidget(context, titleText: helpCenter),
        body: DefaultTabController(
          length: 2, // Specify the number of tabs
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: TabBar(
                  indicatorSize: TabBarIndicatorSize.tab,
                  labelStyle: theme.textTheme.bodyLarge?.copyWith(
                      fontWeight: FontWeight.w600,
                      color: Get.isDarkMode ? colorGrey700 : colorGrey500),
                  labelColor: foodColorPrimary,
                  indicator: const UnderlineTabIndicator(
                    // Use UnderlineTabIndicator
                    borderSide: BorderSide(
                        width: 4.0,
                        color: foodColorPrimary), // Customize the indicator
                  ),
                  tabs: const [
                    Tab(
                      text: faq,
                    ),
                    Tab(text: contactus),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Divider(
                  color: Get.isDarkMode ? foodBorderDark : foodBorderColor,
                  height: 1,
                  thickness: 1,
                ),
              ),
              Expanded(
                child: TabBarView(
                  children: [_buildFaqWidget(), _buildContactListView()],
                ),
              ),
            ],
          ),
        ));
  }

  _buildFaqWidget() {
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildFAQCategoryList(),
          10.height,
          Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
            child: TextFormField(
              style: theme.textTheme.bodyLarge?.copyWith(
                fontWeight: FontWeight.w600,
                color: Get.isDarkMode
                    ? whiteColor
                    : foodTextColor, // Set your desired text color
              ),
              textInputAction: TextInputAction.search,
              keyboardType: TextInputType.text,
              focusNode: controller.f1,
              onFieldSubmitted: (v) {
                controller.f1.unfocus();
              },
              validator: (k) {
                return null;
              },
              controller: controller.searchController,
              decoration: inputDecoration(context,
                  prefixIconColor: colorGrey500,
                  borderColor: Get.isDarkMode ? foodCardDark : colorGrey100,
                  fillColor: Get.isDarkMode ? foodCardDark : colorGrey100,
                  hintColor: Get.isDarkMode
                      ? whiteColor.withOpacity(0.60)
                      : foodTextColor.withOpacity(0.60),
                  prefixIcon: searchIcon,
                  borderRadius: textFieldRadius,
                  hintText: search),
            ),
          ),
          10.height,
          _buildFaqList()
        ],
      ),
    );
  }

  _buildFaqList() {
    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: controller.faqs.length,
      itemBuilder: (context, index) {
        final faq = controller.faqs[index];

        return Container(
          margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          padding: const EdgeInsets.all(5),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Get.isDarkMode ? foodCardDark : Colors.white,
              boxShadow: [cardBoxShadow]),
          child: ExpansionTile(
            shape: const Border(),
            trailing: SvgPicture.asset(
              dropDownPrimaryIcon,
              width: 12,
              height: 12,
            ),
            title: Text(
              faq.question,
              style: theme.textTheme.bodyLarge
                  ?.copyWith(fontWeight: FontWeight.bold),
            ),
            children: [
              ListTile(
                title: Text(
                  faq.answer,
                  style: theme.textTheme.bodyMedium?.copyWith(
                      fontWeight: FontWeight.w500,
                      color: Get.isDarkMode ? colorGrey300 : colorGrey800),
                ),
              ),
            ],
            onExpansionChanged: (value) {
              controller.toggleExpansion(index);
            },
          ),
        );
      },
    );
  }

  _buildFAQCategoryList() {
    return Obx(
      () => Padding(
        padding: const EdgeInsets.only(top: 20.0, left: 20.0),
        child: HorizontalList(
          padding: EdgeInsets.zero,
          itemCount: controller.categoryList.length,
          itemBuilder: (context, index) {
            String cat = controller.categoryList[index];
            return InkWell(
              onTap: () {
                setState(() {
                  controller.toggleSelection(index);
                });
              },
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: (controller.selectedIndex.value == index)
                      ? foodColorPrimary
                      : Colors.transparent,
                  border: Border.all(color: foodColorPrimary, width: 2),
                ),
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                child: Text(
                  cat.toString(),
                  style: theme.textTheme.bodyMedium?.copyWith(
                      fontWeight: FontWeight.w600,
                      color: (controller.selectedIndex.value == index)
                          ? Colors.white
                          : Get.isDarkMode
                              ? Colors.white
                              : foodTextColor),
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  _buildContactListView() {
    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildContactView(
            customerServiceIcon,
            customerService,
            () {
              Get.toNamed(MyRoute.foodCustomerService);
            },
          ),
          _buildContactView(
            whatsappIcon,
            whatsApp,
            () {},
          ),
          _buildContactView(
            websiteIcon,
            website,
            () {},
          ),
          _buildContactView(
            fbPrimaryIcon,
            facebook,
            () {},
          ),
          _buildContactView(
            twitterIcon,
            twitter,
            () {},
          ),
          _buildContactView(
            instagramIcon,
            instagram,
            () {},
          ),
        ],
      ),
    );
  }

  _buildContactView(String iconName, String title, VoidCallback onTap) {
    return InkWell(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.only(top: 10),
        padding: const EdgeInsets.all(24),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: Get.isDarkMode ? foodCardDark : Colors.white,
            boxShadow: [cardBoxShadow]),
        child: Row(
          children: [
            SvgPicture.asset(
              iconName,
              width: 20,
              height: 20,
            ),
            12.width,
            Text(
              title,
              style: theme.textTheme.bodyLarge?.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
