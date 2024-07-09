import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:foodro/foodro/app/controller/food_checkout_order_controller.dart';
import 'package:foodro/foodro/app/model/food_menu.dart';
import 'package:foodro/foodro/widgets/food_app_widget.dart';
import 'package:get/get.dart';
import 'package:nb_utils/nb_utils.dart';

import '../../../../route/my_route.dart';
import '../../../constant/food_colors.dart';
import '../../../constant/food_images.dart';
import '../../../constant/food_strings.dart';
import '../../../food_theme/food_theme.dart';
import '../../../widgets/food_common_button.dart';
import 'address_card_widget.dart';

class FoodCheckoutScreen extends StatefulWidget {
  const FoodCheckoutScreen({super.key});

  @override
  FoodCheckoutScreenState createState() => FoodCheckoutScreenState();
}

class FoodCheckoutScreenState extends State<FoodCheckoutScreen> {
  FoodCheckoutController controller = Get.put(FoodCheckoutController());

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
      appBar: fdCommonAppBarWidget(context, titleText: checkoutOrders),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AddressCardWidget(theme: theme),
                15.height,
                _buildOrderSummaryWidget(),
                15.height,
                _buildPaymentAndDisWidget(),
                15.height,
                _buildTotalWidget()
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: Container(
        color: Get.isDarkMode ? foodCardDark : Colors.white,
        height: 80,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
          child: FoodCommonButton(
              onPressed: () {
                Get.toNamed(MyRoute.foodDriverLocation);
              },
              text: '$placeOrder - \$21.20'),
        ),
      ),
    );
  }

  _buildOrderSummaryWidget() {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(24),
          color: Get.isDarkMode ? foodCardDark : Colors.white,
          boxShadow: [cardBoxShadow]),
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  orderSummary,
                  style: theme.textTheme.titleLarge
                      ?.copyWith(fontWeight: FontWeight.bold),
                ),
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 3),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(color: foodColorPrimary, width: 2),
                  ),
                  child: Text(
                    addItems,
                    style: theme.textTheme.bodyMedium?.copyWith(
                        fontWeight: FontWeight.w600, color: foodColorPrimary),
                  ),
                ),
              ],
            ),
            15.height,
            Divider(
              color: Get.isDarkMode ? foodBorderDark : foodBorderColor,
              height: 1,
              thickness: 1,
            ),
            15.height,
            FutureBuilder<List<FoodMenu>>(
              future: controller.getOrderList(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(
                    child: CircularProgressIndicator(
                      color: foodColorPrimary,
                    ),
                  );
                } else if (snapshot.hasError) {
                  return Text('Error: ${snapshot.error}');
                } else {
                  return ListView.builder(
                      itemCount: controller.orderList.length,
                      itemBuilder: (context, index) {
                        FoodMenu foodMenu = controller.orderList[index];
                        // print(foodMenu.qty);
                        return Obx(
                          () => Column(
                            children: [
                              GestureDetector(
                                onTap: () {},
                                child: Padding(
                                  padding: const EdgeInsets.only(top: 15.0),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      ClipRRect(
                                        borderRadius:
                                            BorderRadius.circular(24.0),
                                        child: commonCacheImageWidget(
                                            foodMenu.image.toString(), 110,
                                            width: 110),
                                      ),
                                      10.width,
                                      Expanded(
                                        child: Column(
                                          // mainAxisAlignment: MainAxisAlignment.start,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            6.height,
                                            Text(
                                              foodMenu.name.toString(),
                                              overflow: TextOverflow.ellipsis,
                                              maxLines: 1,
                                              style: theme.textTheme.bodyLarge
                                                  ?.copyWith(
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                            6.height,
                                            Text(
                                              "\$${foodMenu.price}",
                                              overflow: TextOverflow.ellipsis,
                                              style: theme.textTheme.bodyLarge
                                                  ?.copyWith(
                                                      fontWeight:
                                                          FontWeight.w900,
                                                      color: foodColorPrimary),
                                            ),
                                            6.height,
                                            if (foodMenu.qty.value > 0)
                                              Row(
                                                // mainAxisAlignment: MainAxisAlignment.center,
                                                children: [
                                                  GestureDetector(
                                                    onTap: () => {
                                                      if (foodMenu.qty.value >
                                                          0)
                                                        {foodMenu.qty.value--}
                                                    },
                                                    child: SvgPicture.asset(
                                                      Get.isDarkMode
                                                          ? minusDarkIcon
                                                          : minusIcon,
                                                      width: 35,
                                                      height: 35,
                                                    ),
                                                  ),
                                                  15.width,
                                                  Text(
                                                    '${foodMenu.qty.value}',
                                                    style: theme
                                                        .textTheme.bodyMedium
                                                        ?.copyWith(
                                                            fontWeight:
                                                                FontWeight
                                                                    .w900),
                                                  ),
                                                  15.width,
                                                  GestureDetector(
                                                    onTap: () =>
                                                        {foodMenu.qty.value++},
                                                    child: SvgPicture.asset(
                                                      Get.isDarkMode
                                                          ? addDarkIcon
                                                          : addIcon,
                                                      width: 35,
                                                      height: 35,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            if (foodMenu.qty.value == 0)
                                              InkWell(
                                                onTap: () {
                                                  // setState(() {
                                                  foodMenu.qty.value++;
                                                  // });
                                                },
                                                child: Container(
                                                  padding: const EdgeInsets
                                                      .symmetric(
                                                      horizontal: 15,
                                                      vertical: 8),
                                                  decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              5),
                                                      color: foodColorPrimary),
                                                  child: Text(
                                                    add,
                                                    overflow:
                                                        TextOverflow.ellipsis,
                                                    style: theme
                                                        .textTheme.bodySmall
                                                        ?.copyWith(
                                                      color: Colors.white,
                                                      fontWeight:
                                                          FontWeight.w600,
                                                    ),
                                                  ),
                                                ),
                                              )
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              15.height,
                              if (index != (controller.orderList.length - 1))
                                Divider(
                                  color: Get.isDarkMode
                                      ? foodBorderDark
                                      : foodBorderColor,
                                  height: 1,
                                  thickness: 1,
                                ),
                            ],
                          ),
                        );
                        /* return;*/
                      },
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true);
                }
              },
            )
          ],
        ),
      ),
    );
  }

  _buildPaymentAndDisWidget() {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(24),
          color: Get.isDarkMode ? foodCardDark : Colors.white,
          boxShadow: [cardBoxShadow]),
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            InkWell(
              onTap: () {
                Get.toNamed(MyRoute.foodPaymentMethod,arguments: "CHECKOUT");
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SvgPicture.asset(
                    paymentCardIcon,
                    width: 20,
                    height: 20,
                  ),
                  10.width,
                  Expanded(
                    child: Text(
                      paymentMethods,
                      style: theme.textTheme.bodyMedium
                          ?.copyWith(fontWeight: FontWeight.w500),
                    ),
                  ),
                  10.width,
                  InkWell(
                    onTap: () {

                    },
                    child: Text(
                      eWallet,
                      style: theme.textTheme.bodyLarge?.copyWith(
                          fontWeight: FontWeight.bold, color: foodColorPrimary),
                    ),
                  ),
                  10.width,
                  SvgPicture.asset(
                    rightArrowIcon,
                    width: 16,
                    height: 16,
                    colorFilter: const ColorFilter.mode(
                        foodColorPrimary, BlendMode.srcIn),
                  ),
                ],
              ),
            ),
            15.height,
            Divider(
              color: Get.isDarkMode ? foodBorderDark : foodBorderColor,
              height: 1,
              thickness: 1,
            ),
            15.height,
            InkWell(
              onTap: () {
                Get.toNamed(MyRoute.foodDiscount);
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SvgPicture.asset(
                    discountIcon2,
                    width: 20,
                    height: 20,
                  ),
                  10.width,
                  Expanded(
                    child: Text(
                      getDiscounts,
                      style: theme.textTheme.bodyMedium
                          ?.copyWith(fontWeight: FontWeight.w500),
                    ),
                  ),
                  10.width,
                  Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 10, vertical: 7),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: foodColorPrimary,
                    ),
                    child: Row(
                      children: [
                        Text(
                          'Discount 20%',
                          style: theme.textTheme.bodySmall?.copyWith(
                              fontWeight: FontWeight.w600, color: Colors.white),
                        ),
                        5.width,
                        InkWell(
                            onTap: () {},
                            child: SvgPicture.asset(
                              cancelIcon,
                              width: 8,
                              height: 8,
                              colorFilter: const ColorFilter.mode(
                                  Colors.white, BlendMode.srcIn),
                            )),
                      ],
                    ),
                  ),
                  10.width,
                  SvgPicture.asset(
                    rightArrowIcon,
                    width: 16,
                    height: 16,
                    colorFilter: const ColorFilter.mode(
                        foodColorPrimary, BlendMode.srcIn),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  _buildTotalWidget() {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(24),
          color: Get.isDarkMode ? foodCardDark : Colors.white,
          boxShadow: [cardBoxShadow]),
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildNameAndPriceWidget(subtotal, '24.00', false),
            10.height,
            _buildNameAndPriceWidget(deliveryFee, '2.00', false),
            10.height,
            _buildNameAndPriceWidget('Promo', '4.80', true),
            10.height,
            Divider(
              color: Get.isDarkMode ? foodBorderDark : foodBorderColor,
              height: 1,
              thickness: 1,
            ),
            10.height,
            _buildNameAndPriceWidget(total, '21.20', false),
          ],
        ),
      ),
    );
  }

  _buildNameAndPriceWidget(String title, String price, bool isPromo) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style:
              theme.textTheme.bodyMedium?.copyWith(fontWeight: FontWeight.w500),
        ),
        Text(
          isPromo ? '-\$$price' : '\$$price',
          style: theme.textTheme.bodyLarge?.copyWith(
              fontWeight: FontWeight.w600,
              color: isPromo
                  ? foodColorPrimary
                  : Get.isDarkMode
                      ? Colors.white
                      : foodTextColor),
        ),
      ],
    );
  }
}
