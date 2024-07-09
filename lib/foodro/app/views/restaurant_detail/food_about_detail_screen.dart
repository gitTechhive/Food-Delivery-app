import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:foodro/foodro/app/views/restaurant_detail/widgets/food_review_rating_widget.dart';
import 'package:foodro/foodro/app/views/restaurant_detail/widgets/food_timing_widget.dart';
import 'package:foodro/foodro/constant/food_images.dart';
import 'package:foodro/foodro/constant/food_strings.dart';
import 'package:foodro/foodro/app/model/restaurant.dart';
import 'package:foodro/foodro/widgets/food_app_widget.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:nb_utils/nb_utils.dart';

import '../../../constant/food_colors.dart';



class FoodAboutDetailScreen extends StatelessWidget {
  final FoodRestaurant foodRestaurant;
  final ThemeData theme;
  const FoodAboutDetailScreen({super.key, required this.foodRestaurant, required this.theme});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: theme.scaffoldBackgroundColor,
      appBar: fdCommonAppBarWidget(context),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  foodRestaurant.name,
                  style: theme
                      .textTheme
                      .headlineSmall
                      ?.copyWith(fontWeight: FontWeight.w900),
                ),
                15.height,
                _buildDivider(),
                15.height,
                FoodReviewRatingWidget(foodRestaurant: foodRestaurant, theme: theme,),
                15.height,
                _buildDivider(),
                15.height,
                Text(
                  overview,
                  style:theme
                      .textTheme
                      .titleLarge
                      ?.copyWith(fontWeight: FontWeight.w900),
                ),
                15.height,
                ReadMoreText(foodRestaurant.description,
                    colorClickableText: foodColorPrimary,
                    style: theme.textTheme.bodyMedium?.copyWith(
                        fontWeight: FontWeight.w500,
                        color: Get.isDarkMode ? colorGrey300 : colorGrey800)),
                15.height,
                ListView.builder(
                  itemBuilder: (context, index) {
                    return FoodTimingWidget(
                        restaurantTiming: foodRestaurant.timingList[index], theme: theme,);
                  },
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  scrollDirection: Axis.vertical,
                  itemCount: foodRestaurant.timingList.length,
                ),
                15.height,
                _buildDivider(),
                15.height,
                Text(
                  address,
                  style: theme
                      .textTheme
                      .titleLarge
                      ?.copyWith(fontWeight: FontWeight.w900),
                ),
                15.height,
                Row(
                  children: [
                    SvgPicture.asset(
                      mapGreenIcon,
                      width: 20,
                      height: 20,
                    ),
                    10.width,
                    Expanded(
                      child: Text(
                        foodRestaurant.address,
                        maxLines: 3,
                        overflow: TextOverflow.ellipsis,
                        style: theme.textTheme.bodyMedium?.copyWith(
                            fontWeight: FontWeight.w500,
                            color:
                                Get.isDarkMode ? colorGrey300 : colorGrey800),
                      ),
                    ),
                  ],
                ),
                20.height,
                Container(
                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(20),color: Colors.transparent,),
                  height: 200,
                  child: SizedBox(
                    height: context.w / 1,
                    width: double.infinity,
                    child: GoogleMap(

                      initialCameraPosition: CameraPosition(
                        target: LatLng(
                          foodRestaurant.latitude,
                          foodRestaurant.longitude,
                        ),
                        zoom: 15,
                      ),
                      markers: {
                        Marker(
                          markerId: const MarkerId('current_location'),
                          position: LatLng(
                            foodRestaurant.latitude,
                            foodRestaurant.longitude,
                          ),
                          infoWindow:
                              const InfoWindow(title: 'Current Location'),
                        ),
                      },
                      onMapCreated: (GoogleMapController controller) {},
                    ),
                  ),
                ),
                20.height,
              ],
            ),
          ),
        ),
      ),
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
