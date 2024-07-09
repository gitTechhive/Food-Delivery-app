import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:foodro/foodro/app/views/restaurant_detail/widgets/for_you_detail_view_widget.dart';
import 'package:foodro/foodro/app/views/restaurant_detail/widgets/menu_detail_view_widget.dart';
import 'package:foodro/foodro/constant/food_colors.dart';
import 'package:foodro/foodro/constant/food_images.dart';
import 'package:foodro/foodro/app/model/food_menu.dart';
import 'package:foodro/foodro/app/controller/food_restaurant_detail_controller.dart';
import 'package:foodro/foodro/widgets/food_app_widget.dart';

import '../../../../route/my_route.dart';
import 'package:get/get.dart';
import 'package:nb_utils/nb_utils.dart';


import '../../../constant/food_strings.dart';
import '../../../food_theme/food_theme.dart';
import 'food_about_detail_screen.dart';
import 'food_offers_screen.dart';
import 'food_ratting_screen.dart';
import 'menu_detail/menu_detail_screen.dart';

class FoodRestaurantDetail extends StatefulWidget {
  const FoodRestaurantDetail({super.key});

  @override
  FoodRestaurantDetailState createState() => FoodRestaurantDetailState();
}

class FoodRestaurantDetailState extends State<FoodRestaurantDetail> {

  late ThemeData theme;

  @override
  void initState() {
    super.initState();
    theme = Get.isDarkMode ? FoodTheme.foodDarkTheme : FoodTheme.foodLightTheme;
  }


  @override
  Widget build(BuildContext context) {
    FoodRestaurantDetailController controller =
        Get.put(FoodRestaurantDetailController());

    ColorFilter rightIconColorFilter = ColorFilter.mode(
        Get.isDarkMode ? Colors.white : Colors.black, BlendMode.srcIn);
    return Scaffold(
      backgroundColor: theme.scaffoldBackgroundColor,
      body: Obx(
        () {
          if (controller.foodRestaurant.value.catId == null) {
            // Show loading indicator until data is fetched
            return const Center(child: CircularProgressIndicator());
          } else {
            return NestedScrollView(
              headerSliverBuilder:
                  ((BuildContext context, bool innerBoxIsScrolled) {
                return <Widget>[
                  SliverAppBar(
                    expandedHeight: 250,
                    pinned: true,
                    flexibleSpace: FlexibleSpaceBar(
                      background: commonCacheImageWidget(
                          controller.foodRestaurant.value.image, 430),
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
                        icon: SvgPicture.asset(heartIcon,
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
              body: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    InkWell(
                      onTap: () {
                        Get.to(FoodAboutDetailScreen(
                            foodRestaurant: controller.foodRestaurant.value,theme:theme));
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              controller.foodRestaurant.value.name,
                              style: theme
                                  .textTheme
                                  .headlineMedium
                                  ?.copyWith(fontWeight: FontWeight.bold),
                            ),
                            SvgPicture.asset(
                              rightArrowIcon,
                              height: 15,
                              width: 15,
                              colorFilter: rightIconColorFilter,
                            ),
                          ],
                        ),
                      ),
                    ),
                    _buildDivider(),
                    InkWell(
                      onTap: () {
                        Get.to(FoodRatingScreen(
                            foodRestaurant: controller.foodRestaurant.value, theme: theme,));
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Row(
                          // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            SvgPicture.asset(
                              starIcon,
                              width: 20,
                              height: 20,
                            ),
                            10.width,
                            Text(
                              controller.foodRestaurant.value.rating.toString(),
                              overflow: TextOverflow.ellipsis,
                              style: theme
                                  .textTheme
                                  .titleLarge
                                  ?.copyWith(
                                    fontWeight: FontWeight.bold,
                                  ),
                            ),
                            10.width,
                            Expanded(
                              child: Text(
                                '(${controller.foodRestaurant.value.reviews} reviews)',
                                overflow: TextOverflow.ellipsis,
                                style: theme
                                    .textTheme
                                    .titleLarge
                                    ?.copyWith(
                                      color: colorGrey700,
                                      fontWeight: FontWeight.w500,
                                    ),
                              ),
                            ),
                            SvgPicture.asset(
                              rightArrowIcon,
                              height: 15,
                              width: 15,
                              colorFilter: rightIconColorFilter,
                            ),
                          ],
                        ),
                      ),
                    ),
                    _buildDivider(),
                    Padding(
                      padding: const EdgeInsets.only(
                          left: 20.0, right: 20.0, top: 20.0, bottom: 3.0),
                      child: Row(
                        // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SvgPicture.asset(
                            mapGreenIcon,
                            width: 20,
                            height: 20,
                          ),
                          10.width,
                          Expanded(
                            child: Text(
                              controller.foodRestaurant.value.distance,
                              overflow: TextOverflow.ellipsis,
                              style: theme
                                  .textTheme
                                  .titleLarge
                                  ?.copyWith(
                                    fontWeight: FontWeight.bold,
                                  ),
                            ),
                          ),
                          InkWell(
                            onTap: () {},
                            child: SvgPicture.asset(
                              rightArrowIcon,
                              height: 15,
                              width: 15,
                              colorFilter: rightIconColorFilter,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 48.0),
                      child: Row(
                        // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            deliveryNow,
                            overflow: TextOverflow.ellipsis,
                            style:
                                theme.textTheme.bodyMedium?.copyWith(
                                      color: colorGrey700,
                                      fontWeight: FontWeight.w500,
                                    ),
                          ),
                          Text(
                            " | ",
                            overflow: TextOverflow.ellipsis,
                            style:
                                theme.textTheme.bodyMedium?.copyWith(
                                      fontWeight: FontWeight.w500,
                                    ),
                          ),
                          5.width,
                          SvgPicture.asset(
                            vehicleIcon,
                            width: 16,
                            height: 16,
                          ),
                          5.width,
                          Text(
                            "\$${controller.foodRestaurant.value.price}",
                            overflow: TextOverflow.ellipsis,
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium
                                ?.copyWith(
                                    fontWeight: FontWeight.w500,
                                    color: colorGrey700),
                          ),
                        ],
                      ),
                    ),
                    15.height,
                    _buildDivider(),
                    InkWell(
                      onTap: () {
                        Get.to(const FoodOffersScreen());
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Row(
                          // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            SvgPicture.asset(
                              discountIcon,
                              width: 20,
                              height: 20,
                            ),
                            10.width,
                            Expanded(
                              child: Text(
                                offersAeAvailable,
                                overflow: TextOverflow.ellipsis,
                                style: theme
                                    .textTheme
                                    .bodyLarge
                                    ?.copyWith(
                                      fontWeight: FontWeight.w600,
                                    ),
                              ),
                            ),
                            SvgPicture.asset(
                              rightArrowIcon,
                              height: 15,
                              width: 15,
                              colorFilter: rightIconColorFilter,
                            ),
                          ],
                        ),
                      ),
                    ),
                    _buildDivider(),
                    Padding(
                      padding: const EdgeInsets.only(
                          left: 20.0, right: 20.0, top: 20.0, bottom: 10.0),
                      child: Text(
                        forYou,
                        overflow: TextOverflow.ellipsis,
                        style: theme.textTheme.headlineMedium?.copyWith(
                              fontWeight: FontWeight.bold,fontSize: 22
                            ),
                      ),
                    ),
                    HorizontalList(
                      padding: const EdgeInsets.symmetric(vertical: 5,horizontal: 20),
                      itemCount:
                          controller.foodRestaurant.value.forYouList.length,
                      itemBuilder: (context, index) {
                        FoodMenu foodMenu =
                            controller.foodRestaurant.value.forYouList[index];
                        return FoodForYouDetailViewWidget(theme:theme,
                            onPressed: () {
                              Get.to(
                                  FoodMenuDetailScreen(foodMenu: foodMenu));
                            },
                            menu: foodMenu,
                            controller: controller,
                            index: index);
                      },
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                          left: 20.0, right: 20.0, top: 20.0, bottom: 10.0),
                      child: Text(
                        menu,
                        overflow: TextOverflow.ellipsis,
                        style:theme.textTheme.headlineMedium?.copyWith(
                            fontWeight: FontWeight.bold,fontSize: 22
                            ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20.0),
                      child: ListView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        padding: EdgeInsets.zero,
                        itemCount:
                            controller.foodRestaurant.value.menuList.length,
                        itemBuilder: (context, index) {
                          FoodMenu foodMenu =
                              controller.foodRestaurant.value.menuList[index];
                          return FoodMenuDetailViewWidget(
                            onPressed: () {
                              Get.to(FoodMenuDetailScreen(foodMenu: foodMenu));
                            },
                            foodMenu: foodMenu,
                            index: index, theme: theme,
                          );
                        },
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                          left: 20.0, right: 20.0, top: 20.0, bottom: 10.0),
                      child: Text(
                        drink,
                        overflow: TextOverflow.ellipsis,
                        style: theme.textTheme.headlineMedium?.copyWith(
                            fontWeight: FontWeight.bold,fontSize: 22)
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20.0),
                      child: ListView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        padding: EdgeInsets.zero,
                        itemCount:
                            controller.foodRestaurant.value.drinkList.length,
                        itemBuilder: (context, index) {
                          FoodMenu foodMenu =
                              controller.foodRestaurant.value.drinkList[index];
                          return FoodMenuDetailViewWidget(
                            onPressed: () {
                              Get.to(FoodMenuDetailScreen(foodMenu: foodMenu));
                            },
                            foodMenu: foodMenu,
                            index: index, theme: theme,
                          );
                        },
                      ),
                    ),
                    50.height
                  ],
                ),
              ),
            );
          }
        },
      ),
      floatingActionButton:Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: CheckoutFAB(theme: theme),
            ),
          ),
        ],
      ) ,
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }

  _buildDivider() {
    return Padding(
      padding: const EdgeInsets.only(left: 20.0, right: 20.0),
      child: Divider(
        color: Get.isDarkMode ? foodBorderDark : foodBorderColor,
        height: 1,
        thickness: 1,
      ),
    );
  }
}

class CheckoutFAB extends StatelessWidget {
 final ThemeData theme;
  const CheckoutFAB({super.key, required this.theme});

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      backgroundColor: foodColorPrimary,
      onPressed: () {
        // Implement your checkout action here
        // For example, you can navigate to a checkout screen
        Get.toNamed(MyRoute.foodCheckOut);
      },
      tooltip: checkout,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(Icons.shopping_cart,color: Colors.white,),
          10.width,
          Text(
            checkout,
            overflow: TextOverflow.ellipsis,
            style: theme.textTheme.titleLarge?.copyWith(
              fontWeight: FontWeight.w500,color: Colors.white
            ),
          ),
        ],
      ),
    );
  }
}
