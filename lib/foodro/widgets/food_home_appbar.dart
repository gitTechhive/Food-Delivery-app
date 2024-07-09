import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:foodro/foodro/constant/food_colors.dart';
import 'package:foodro/foodro/widgets/food_app_widget.dart';
import '../../../../route/my_route.dart';
import 'package:get/get.dart';
import 'package:nb_utils/nb_utils.dart';


import '../constant/food_images.dart';
import '../constant/food_strings.dart';
import '../food_theme/food_theme.dart';

class FoodAppBar extends StatefulWidget implements PreferredSizeWidget {
  @override
  Size get preferredSize => const Size.fromHeight(60);

  const FoodAppBar({super.key});

  @override
  FoodAppBarState createState() => FoodAppBarState();
}

class FoodAppBarState extends State<FoodAppBar> {
  late ThemeData theme;

  @override
  void initState() {
    super.initState();

    theme = Get.isDarkMode ? FoodTheme.foodDarkTheme : FoodTheme.foodLightTheme;
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.only(bottom: 8.0, left: 20, right: 20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            GestureDetector(
              onTap: () {},
              child: CircleAvatar(
                radius: 22.0,
                backgroundColor: Colors.transparent,
                // Set a transparent background
                child: ClipOval(
                  child: commonCacheImageWidget(
                    'https://i.ibb.co/JkbSSVZ/main-thumb-2130102404-200-ynberwrkslqbjankshjkcjagxxmtytsa.jpg',
                    48,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            10.width,
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    deliverTo,
                    style: theme.textTheme.bodyMedium?.copyWith(
                        fontWeight: FontWeight.w400, color: colorGrey600),
                  ),
                  Row(
                    // mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Times Square",
                        overflow: TextOverflow.ellipsis,
                        style: theme
                            .textTheme
                            .bodyLarge
                            ?.copyWith(fontWeight: FontWeight.bold),
                      ),
                      8.width,
                      SvgPicture.asset(
                        dropDownIcon,
                        width: 10,
                        height: 10,
                      )
                    ],
                  ),
                ],
              ),
            ),
            10.width,
            InkWell(
              onTap: (){
                Get.toNamed(MyRoute.foodNotification);
              },
              child: SvgPicture.asset(
                Get.isDarkMode ? notificationDarkIcon : notificationLightIcon,
                width: 48,
                height: 48,
              ),
            ),
            10.width,
            InkWell(
              onTap: (){Get.toNamed(MyRoute.foodCheckOut);},
              child: SvgPicture.asset(
                Get.isDarkMode ? cartDarkIcon : cartLightIcon,
                width: 48,
                height: 48,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
