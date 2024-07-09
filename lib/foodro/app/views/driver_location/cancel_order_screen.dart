import 'package:flutter/material.dart';
import 'package:foodro/foodro/app/controller/cancel_order_controller.dart';
import 'package:foodro/foodro/app/views/driver_location/cancel_order_dialog.dart';
import 'package:foodro/foodro/constant/food_strings.dart';
import 'package:foodro/foodro/widgets/food_app_widget.dart';
import 'package:get/get.dart';
import 'package:nb_utils/nb_utils.dart';

import '../../../constant/food_colors.dart';
import '../../../food_theme/food_theme.dart';
import '../../../widgets/food_common_button.dart';


class CancelOrderScreen extends StatefulWidget {
  const CancelOrderScreen({super.key});

  @override
  CancelOrderScreenState createState() => CancelOrderScreenState();
}

class CancelOrderScreenState extends State<CancelOrderScreen> {
  final FoodCancelOrderController controller =
      Get.put(FoodCancelOrderController());

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
      appBar: fdCommonAppBarWidget(context, titleText: cancelOrder),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  selectReasonForCancellation,
                  style: theme.textTheme.bodyLarge
                      ?.copyWith(fontWeight: FontWeight.w500),
                ),
                20.height,
                Divider(
                  color: Get.isDarkMode ? foodBorderDark : foodBorderColor,
                  height: 1,
                  thickness: 1,
                ),
                20.height,
                ListView.builder(
                  padding: EdgeInsets.zero,
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: controller.reasonList.length,
                  itemBuilder: (context, index) {
                    var reason = controller.reasonList[index];
                    return Obx(
                      () => Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Radio(
                            activeColor: foodColorPrimary,
                            value: reason,
                            groupValue: controller.selectedReason.value,
                            onChanged: (selectedPayment) {
                              controller.selectPayment(selectedPayment!);
                            },
                          ),
                          5.width,
                          Text(
                            reason,
                            overflow: TextOverflow.ellipsis,
                            style: theme.textTheme.bodyMedium?.copyWith(
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
                20.height,
                Text(
                  others,
                  style: theme.textTheme.bodyLarge
                      ?.copyWith(fontWeight: FontWeight.w600),
                ),
                10.height,
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
                  controller: controller.reasonController,
                  decoration: inputDecoration(context,
                      borderColor: Get.isDarkMode ? foodCardDark : colorGrey50,
                      fillColor: Get.isDarkMode ? foodCardDark : colorGrey50,
                      hintColor: Get.isDarkMode
                          ? whiteColor.withOpacity(0.60)
                          : foodTextColor.withOpacity(0.60),
                      borderRadius: textFieldRadius,
                      hintText: otherReason),
                ),
                20.height,
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: Container(
        color: Get.isDarkMode ? foodCardDark : Colors.white,
        height: 100,
        child: Column(
          children: [
            Divider(
              color: Get.isDarkMode ? foodBorderDark : foodBorderColor,
              height: 1,
              thickness: 1,
            ),
            20.height,
            Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: FoodCommonButton(
                    onPressed: () async {
                      await CancelOrderDialog()
                          .customDialog(context, theme);
                    },
                    text: submit,
                    height: 58)),
          ],
        ),
      ),
    );
  }
}
