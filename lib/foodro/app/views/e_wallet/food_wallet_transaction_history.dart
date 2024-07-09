import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:foodro/foodro/app/controller/food_wallet_controller.dart';
import 'package:foodro/foodro/app/model/food_transaction.dart';
import 'package:foodro/foodro/app/views/e_wallet/transaction_iem_view_widget.dart';
import 'package:foodro/foodro/constant/food_colors.dart';
import 'package:foodro/foodro/constant/food_images.dart';
import 'package:foodro/foodro/widgets/food_app_widget.dart';
import 'package:get/get.dart';

import '../../../constant/food_strings.dart';
import '../../../food_theme/food_theme.dart';

class FoodTransactionHistoryScreen extends StatefulWidget {
  const FoodTransactionHistoryScreen({super.key});

  @override
  FoodTransactionHistoryScreenState createState() =>
      FoodTransactionHistoryScreenState();
}

class FoodTransactionHistoryScreenState
    extends State<FoodTransactionHistoryScreen> {
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
        titleText: transactionHistory,
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
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: _buildListWidget(),
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
            physics: const AlwaysScrollableScrollPhysics(),
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
