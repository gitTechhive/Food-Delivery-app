import 'package:flutter/material.dart';
import 'package:foodro/foodro/app/controller/food_invite_friends_controller.dart';
import 'package:foodro/foodro/app/model/invite_friends.dart';
import 'package:foodro/foodro/constant/food_colors.dart';
import 'package:foodro/foodro/constant/food_strings.dart';
import 'package:foodro/foodro/widgets/food_app_widget.dart';
import 'package:get/get.dart';
import 'package:nb_utils/nb_utils.dart';

import '../../../food_theme/food_theme.dart';

class FoodInviteFriendsScreen extends StatefulWidget {
  const FoodInviteFriendsScreen({super.key});

  @override
  FoodInviteFriendsScreenState createState() => FoodInviteFriendsScreenState();
}

class FoodInviteFriendsScreenState extends State<FoodInviteFriendsScreen> {
  FoodInviteFriendsController controller =
      Get.put(FoodInviteFriendsController());
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
      appBar: fdCommonAppBarWidget(context, titleText: inviteFriends),
      body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: FutureBuilder<List<InviteFriends>>(
            future: controller.getFriendsList(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(
                  child: CircularProgressIndicator(
                    color: foodColorPrimary,
                  ),
                );
              } else if (snapshot.hasError) {
                return Text('Error: ${snapshot.error}');
              } else if (controller.friendsList.isEmpty) {
                return const Text(noDataAvailable);
              } else {
                return ListView.builder(
                  physics: const AlwaysScrollableScrollPhysics(),
                  itemCount: controller.friendsList.length,
                  shrinkWrap: true,
                  scrollDirection: Axis.vertical,
                  itemBuilder: (context, index) {
                    InviteFriends friends = controller.friendsList[index];
                    return Padding(
                      padding: const EdgeInsets.only(top: 10.0, bottom: 10.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          commonCacheImageWidget(friends.image, 60, width: 60),
                          10.width,
                          Expanded(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  friends.name,
                                  overflow: TextOverflow.ellipsis,
                                  style: theme.textTheme.bodyLarge?.copyWith(
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Text(
                                  friends.phoneNumber,
                                  overflow: TextOverflow.ellipsis,
                                  style: theme.textTheme.bodyMedium?.copyWith(
                                    color: Get.isDarkMode
                                        ? colorGrey300
                                        : colorGrey700,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          8.width,
                          Obx(
                            () => InkWell(
                              onTap: () {
                                if (friends.isInvited.value == false) {
                                  friends.isInvited.value =
                                      !friends.isInvited.value;
                                }
                              },
                              child: Container(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 10, vertical: 5),
                                decoration: BoxDecoration(
                                    border: Border.all(
                                        color: (friends.isInvited.value)
                                            ? foodColorPrimary
                                            : Colors.transparent),
                                    borderRadius: BorderRadius.circular(20),
                                    color: (friends.isInvited.value)
                                        ? Colors.transparent
                                        : foodColorPrimary),
                                child: Text(
                                  (friends.isInvited.value) ? invited : invite,
                                  overflow: TextOverflow.ellipsis,
                                  style: theme.textTheme.bodySmall?.copyWith(
                                    color: (friends.isInvited.value)
                                        ? foodColorPrimary
                                        : Colors.white,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    );
                  },
                );
              }
            },
          )),
    );
  }
}
