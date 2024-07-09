import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:foodro/foodro/app/controller/food_message_controller.dart';
import 'package:foodro/foodro/app/model/chat_model.dart';
import 'package:foodro/foodro/app/views/messages/message_item_view_widget.dart';
import 'package:foodro/foodro/constant/food_colors.dart';
import 'package:foodro/foodro/constant/food_images.dart';
import 'package:foodro/foodro/widgets/food_app_widget.dart';
import 'package:get/get.dart';

import '../../../../../route/my_route.dart';
import '../../../constant/food_strings.dart';
import '../../../food_theme/food_theme.dart';

class FoodMessagesScreen extends StatefulWidget {
  const FoodMessagesScreen({super.key});

  @override
  FoodMessagesScreenState createState() => FoodMessagesScreenState();
}

class FoodMessagesScreenState extends State<FoodMessagesScreen> {
  late FoodMessageController controller;

  late ThemeData theme;

  @override
  void initState() {
    super.initState();
    controller = Get.put(FoodMessageController());
    theme = Get.isDarkMode ? FoodTheme.foodDarkTheme : FoodTheme.foodLightTheme;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: theme.scaffoldBackgroundColor,
      appBar: fdCommonAppBarWidget(context,
          titleText: message,
          isback: false,
          leadingWidget: Padding(
            padding: const EdgeInsets.all(8.0),
            child: SvgPicture.asset(
              logoImg,
              width: 28,
              height: 28,
            ),
          ),
          actionWidget: InkWell(
            onTap: () {},
            child: SvgPicture.asset(
              searchIcon,
              width: 21,
              height: 21,
              colorFilter: ColorFilter.mode(
                  Get.isDarkMode ? Colors.white : Colors.black,
                  BlendMode.srcIn),
            ),
          ),
          actionWidget2: Padding(
            padding: const EdgeInsets.only(right: 20.0,left: 15.0),
            child: InkWell(
              onTap: () {},
              child: SvgPicture.asset(
                moreIcon,
                width: 21,
                height: 21,
                colorFilter: ColorFilter.mode(
                    Get.isDarkMode ? Colors.white : Colors.black,
                    BlendMode.srcIn),
              ),
            ),
          )),
      body: DefaultTabController(
        length: 2, // Specify the number of tabs
        child: Column(
          children: [
            TabBar(
              indicatorSize: TabBarIndicatorSize.tab,
              labelStyle: theme.textTheme.bodyLarge?.copyWith(
                  fontWeight: FontWeight.w600,
                  color: Get.isDarkMode ? colorGrey700 : colorGrey500),
              labelColor: foodColorPrimary,
              indicator: const UnderlineTabIndicator(
                // Use UnderlineTabIndicator
                borderSide: BorderSide(
                    width: 3.0,
                    color: foodColorPrimary), // Customize the indicator
              ),
              tabs: const [
                Tab(
                  text: chats,
                ),
                Tab(text: calls),
              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Divider(
                color: Get.isDarkMode ? foodBorderDark : foodBorderColor,
                height: 1,
                thickness: 1,
              ),
            ),
            Expanded(
              child: TabBarView(
                children: [
                  _buildChatListWidget(),
                  // _buildChatListWidget(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  _buildChatListWidget() {
    return FutureBuilder<List<ChatData>>(
      future: controller.getMessageList(),
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
            // physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: controller.messageList.length,
            itemBuilder: (context, index) {
              var chat = controller.messageList[index];
              return MessageItemViewWidget(
                chatData: chat,
                theme: theme,
                onPressed: () {
                  Get.toNamed(MyRoute.foodChat);
                },
              );
            },
          );
        }
      },
    );
  }
}
