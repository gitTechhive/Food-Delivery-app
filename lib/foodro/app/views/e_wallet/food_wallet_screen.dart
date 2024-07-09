import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:foodro/foodro/app/controller/food_wallet_controller.dart';
import 'package:foodro/foodro/app/model/food_transaction.dart';
import 'package:foodro/foodro/app/views/e_wallet/transaction_iem_view_widget.dart';
import 'package:foodro/foodro/constant/food_colors.dart';
import 'package:foodro/foodro/constant/food_images.dart';
import 'package:foodro/foodro/widgets/food_app_widget.dart';
import 'package:foodro/foodro/widgets/food_custom_see_more_text.dart';
import 'package:get/get.dart';
import 'package:nb_utils/nb_utils.dart';

import '../../../../route/my_route.dart';
import '../../../constant/food_strings.dart';
import '../../../food_theme/food_theme.dart';

class FoodWalletScreen extends StatefulWidget {
  const FoodWalletScreen({super.key});

  @override
  FoodWalletScreenState createState() => FoodWalletScreenState();
}

class FoodWalletScreenState extends State<FoodWalletScreen> {
  late FoodWalletController controller;

  late ThemeData theme;

  @override
  void initState() {
    super.initState();
    controller = Get.put(FoodWalletController());
    theme = Get.isDarkMode ? FoodTheme.foodDarkTheme : FoodTheme.foodLightTheme;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: theme.scaffoldBackgroundColor,
      appBar: fdCommonAppBarWidget(
        context,
        titleText: eWallet,
        isback: false,
        leadingWidget: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SvgPicture.asset(
            logoImg,
            width: 28,
            height: 28,
          ),
        ),
        actionWidget: Padding(
          padding: const EdgeInsets.all(8.0),
          child: InkWell(
            onTap: () {},
            child: SvgPicture.asset(
              searchIcon,
              width: 22,
              height: 22,
              colorFilter: ColorFilter.mode(
                  Get.isDarkMode ? Colors.white : Colors.black,
                  BlendMode.srcIn),
            ),
          ),
        ),
        actionWidget2: Padding(
          padding: const EdgeInsets.all(8.0),
          child: InkWell(
            onTap: () {},
            child: SvgPicture.asset(
              moreIcon,
              width: 22,
              height: 22,
              colorFilter: ColorFilter.mode(
                  Get.isDarkMode ? Colors.white : Colors.black,
                  BlendMode.srcIn),
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildCreditCard(),
            30.height,
            FoodCustomTextSeeMore(
                title: transactionHistory,
                onPressed: () {
                  Get.toNamed(MyRoute.foodTransactionHistory);
                },
                theme: theme),
            15.height,
            _buildListWidget(),
          ],
        ),
      ),
    );
  }

  _buildCreditCard() {
    return Container(
      decoration: BoxDecoration(
          boxShadow: [cardBoxShadow2],
          borderRadius: BorderRadius.circular(36),
          image: const DecorationImage(
              image: AssetImage(creditCardBg), fit: BoxFit.fill)),
      // height: 250,
      width: double.infinity,
      child: Padding(
        padding: const EdgeInsets.all(18.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            10.height,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Andrew Ainsley',
                        style: theme.textTheme.titleLarge?.copyWith(
                            color: Colors.white, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        '●●●● ●●●● ●●●● 3629',
                        style: theme.textTheme.bodyMedium?.copyWith(
                            color: Colors.white, fontWeight: FontWeight.w600),
                      ),
                    ],
                  ),
                ),
                Image.asset(
                  visaIcon,
                  width: 61,
                  height: 20,
                ),
                10.width,
                Image.asset(
                  masterCardIcon,
                  width: 41,
                  height: 32,
                )
              ],
            ),
            30.height,
            Text(
              'Your balance',
              style: theme.textTheme.bodyMedium
                  ?.copyWith(color: Colors.white, fontWeight: FontWeight.w600),
            ),
            10.height,
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  '\$9,379',
                  style: theme.textTheme.displayMedium?.copyWith(
                      color: Colors.white, fontWeight: FontWeight.bold),
                ),
                InkWell(
                  onTap: (){
                    Get.toNamed(MyRoute.foodWalletTopUp);
                  },
                  child: Container(
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(100),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SvgPicture.asset(
                          downloadIcon,
                          width: 13,
                          height: 13,
                        ),
                        10.width,
                        Text(
                          topUp,
                          style: theme.textTheme.bodyLarge?.copyWith(
                              color: foodTextColor, fontWeight: FontWeight.w600),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

  _buildListWidget() {
    return FutureBuilder<List<FoodTransaction>>(
      future: controller.getTransactions(),
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
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: controller.transactionList.length,
            itemBuilder: (context, index) {
              var transaction = controller.transactionList[index];
              return TransactionItemViewWidget(
                transaction: transaction,
                theme: theme,
                onPressed: () {},
              );
            },
          );
        }
      },
    );
  }
}
