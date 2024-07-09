import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:foodro/foodro/app/controller/menu_detail_controller.dart';
import 'package:foodro/foodro/app/model/food_menu.dart';
import 'package:foodro/foodro/constant/food_colors.dart';
import 'package:foodro/foodro/constant/food_images.dart';
import 'package:foodro/foodro/constant/food_strings.dart';
import 'package:foodro/foodro/widgets/food_app_widget.dart';
import 'package:foodro/foodro/widgets/food_common_button.dart';
import 'package:get/get.dart';
import 'package:nb_utils/nb_utils.dart';

import '../../../../food_theme/food_theme.dart';

class FoodMenuDetailScreen extends StatefulWidget {
  final FoodMenu foodMenu;

  const FoodMenuDetailScreen({super.key, required this.foodMenu});

  @override
  FoodMenuDetailState createState() => FoodMenuDetailState();
}

class FoodMenuDetailState extends State<FoodMenuDetailScreen> {
  FoodMenuDetailController controller = Get.put(FoodMenuDetailController());

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
        bottomNavigationBar:  Padding(
          padding: const EdgeInsets.only(left: 20.0,right: 20.0,bottom: 20.0,top: 10.0),
          child: FoodCommonButton(
              onPressed: () {},
              text: "$addToBasket - \$${widget.foodMenu.price}"),
        ),
        body: NestedScrollView(
            headerSliverBuilder:
                ((BuildContext context, bool innerBoxIsScrolled) {
              if (kDebugMode) {
                print("innerBoxIsScrolled $innerBoxIsScrolled");
              }
              return <Widget>[
                SliverAppBar(
                  expandedHeight: 300,
                  pinned: true,
                  flexibleSpace: FlexibleSpaceBar(
                    background: commonCacheImageWidget(
                      widget.foodMenu.image,
                      0,
                      width: double.infinity,
                      // fit: BoxFit.fitHeight
                    ),
                    collapseMode: CollapseMode.parallax,
                  ),
                  // backgroundColor: appStore.appBarColor,
                  leading: BackButton(
                    color: innerBoxIsScrolled
                        ? Get.isDarkMode
                            ? Colors.white
                            : Colors.black
                        : Colors.white,
                    onPressed: () async {
                      Get.back();
                    },
                  ),
                  actions: [
                    IconButton(
                      padding: EdgeInsets.zero,
                      icon: SvgPicture.asset(shareIcon,
                          width: 26,
                          height: 26,
                          colorFilter: ColorFilter.mode(
                              innerBoxIsScrolled
                                  ? Get.isDarkMode
                                      ? Colors.white
                                      : Colors.black
                                  : Colors.white,
                              BlendMode.srcIn)),
                      onPressed: () {},
                    ),
                  ],
                ),
              ];
            }),
            body: ListView(
              padding: const EdgeInsets.all(20.0),
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.foodMenu.name,
                      style: theme.textTheme.headlineMedium
                          ?.copyWith(fontWeight: FontWeight.bold),
                    ),
                    15.height,
                    _buildDivider(),
                    15.height,
                    ReadMoreText(
                      trimLength: 150,
                      widget.foodMenu.description,
                      colorClickableText: foodColorPrimary,
                      style: theme.textTheme.bodyMedium
                          ?.copyWith(fontWeight: FontWeight.w500),
                    ),
                    20.height,
                    _buildQtyPicker(),
                    20.height,
                    TextFormField(
                      maxLines: 2,
                      style: TextStyle(
                        color: Get.isDarkMode
                            ? whiteColor
                            : foodTextColor, // Set your desired text color
                      ),
                      textInputAction: TextInputAction.done,
                      keyboardType: TextInputType.text,
                      focusNode: controller.f1,
                      onFieldSubmitted: (v) {
                        controller.f1.unfocus();
                      },
                      validator: (k) {
                        return null;
                      },
                      controller: controller.noteController,
                      decoration: inputDecoration(context,
                          borderColor:
                          Get.isDarkMode ? foodCardDark : colorGrey50,
                          fillColor:
                          Get.isDarkMode ? foodCardDark : colorGrey50,
                          hintColor: Get.isDarkMode
                              ? whiteColor.withOpacity(0.60)
                              : foodTextColor.withOpacity(0.60),
                          borderRadius: textFieldRadius,
                          hintText: note),
                    ),
                    20.height,
                    // _buildDivider(),
                    // 20.height,

                  ],
                ),
              ],
            )));
  }

  _buildQtyPicker() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        GestureDetector(
          onTap: () => controller.decrement(),
          child: SvgPicture.asset(
            Get.isDarkMode ? minusDarkIcon : minusIcon,
            width: 55,
            height: 55,
          ),
        ),
        30.width,
        Obx(
          () => Text(
            '${controller.quantity}',
            style: theme.textTheme.titleLarge
                ?.copyWith(fontWeight: FontWeight.w900),
          ),
        ),
        30.width,
        GestureDetector(
          onTap: () => controller.increment(),
          child: SvgPicture.asset(
            Get.isDarkMode ? addDarkIcon : addIcon,
            width: 55,
            height: 55,
          ),
        ),
      ],
    );
  }

  _buildDivider() {
    return Divider(
      color: Get.isDarkMode ? foodBorderDark : foodBorderColor,
      height: 1,
      thickness: 1,
    );
  }
}
