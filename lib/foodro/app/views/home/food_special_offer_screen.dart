import 'package:flutter/material.dart';
import 'package:foodro/foodro/app/controller/food_special_offer_controller.dart';
import 'package:foodro/foodro/app/model/special_offer.dart';
import 'package:foodro/foodro/widgets/food_app_widget.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../constant/food_colors.dart';
import '../../../constant/food_strings.dart';
import '../../../food_theme/food_theme.dart';

class FoodSpecialOfferScreen extends StatefulWidget {
  const FoodSpecialOfferScreen({super.key});

  @override
  FoodSpecialOfferScreenState createState() => FoodSpecialOfferScreenState();
}

class FoodSpecialOfferScreenState extends State<FoodSpecialOfferScreen> {
  FoodSpecialOfferController controller = Get.put(FoodSpecialOfferController());

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
      appBar: fdCommonAppBarWidget(
        context,
        titleText: specialOffers,
      ),
      body: SafeArea(
          child: Center(
              child: FutureBuilder<List<SpecialOffer>>(
        future: controller.getSpecialoffer(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(
                color: foodColorPrimary,
              ),
            );
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else {
            return ListView.builder(
                itemCount: controller.offerList.length,
                itemBuilder: (context, index) {
                  SpecialOffer offer = controller.offerList[index];
                  // print(foodMenu.qty);
                  return Stack(
                    alignment: Alignment.centerLeft,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 15.0, horizontal: 20),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(36),
                          child: commonCacheImageWidget(offer.image, 181,
                              width: double.infinity, fit: BoxFit.cover),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 45.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              offer.discount,
                              style: theme.textTheme.displayLarge?.copyWith(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 60,
                                  height: 1.1,
                                  fontFamily:
                                      GoogleFonts.luckiestGuy().fontFamily,
                                  color: Colors.white),
                            ),
                            Text(
                              'discount only',
                              style: theme.textTheme.titleLarge?.copyWith(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 17,
                                  fontFamily:
                                      GoogleFonts.luckiestGuy().fontFamily,
                                  color: Colors.white),
                            ),
                            Text(
                              offer.validity,
                              style: theme.textTheme.titleLarge?.copyWith(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 17,
                                  fontFamily:
                                      GoogleFonts.luckiestGuy().fontFamily,
                                  color: Colors.white),
                            ),
                          ],
                        ),
                      ),
                    ],
                  );
                },
                physics: const AlwaysScrollableScrollPhysics(),
                shrinkWrap: true);
          }
        },
      ))),
    );
  }
}
