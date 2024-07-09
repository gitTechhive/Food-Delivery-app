import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:foodro/foodro/app/controller/food_customer_service_controller.dart';
import 'package:foodro/foodro/app/model/message_data.dart';
import 'package:foodro/foodro/app/views/chat/receiver_row_view.dart';
import 'package:foodro/foodro/app/views/chat/sender_row_view.dart';
import 'package:foodro/foodro/widgets/food_app_widget.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:nb_utils/nb_utils.dart';

import '../../../constant/food_colors.dart';
import '../../../constant/food_images.dart';
import '../../../constant/food_strings.dart';
import '../../../food_theme/food_theme.dart';

class FoodCustomerServiceScreen extends StatefulWidget {
  const FoodCustomerServiceScreen({super.key});

  @override
  FoodCustomerServiceScreenState createState() =>
      FoodCustomerServiceScreenState();
}

class FoodCustomerServiceScreenState extends State<FoodCustomerServiceScreen> {
  FoodCustomerServiceController controller =
      Get.put(FoodCustomerServiceController());

  late ThemeData theme;
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    theme = Get.isDarkMode ? FoodTheme.foodDarkTheme : FoodTheme.foodLightTheme;
    controller.messageList.listen((_) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        if (_scrollController.hasClients) {
          _scrollController.animateTo(
            _scrollController.position.maxScrollExtent,
            duration: const Duration(milliseconds: 300),
            curve: Curves.easeOut,
          );
        }
      });
    });
  }

  @override
  void dispose() {
    controller.textController.dispose();
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: theme.scaffoldBackgroundColor,
      appBar: fdCommonAppBarWidget(
        context,
        titleText: customerService,
        actionWidget: _buildCallIcon(),
        actionWidget2: _buildMoreIcon(),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: Obx(() {
                final todayMessages = <MessageData>[];
                final yesterdayMessages = <MessageData>[];
                final otherMessages = <DateTime, List<MessageData>>{};

                for (var msg in controller.messageList) {
                  final category = controller.getDateCategory(msg.dateTime!);
                  if (category == FoodDateCategory.today) {
                    todayMessages.add(msg);
                  } else if (category == FoodDateCategory.yesterday) {
                    yesterdayMessages.add(msg);
                  } else {
                    if (!otherMessages.containsKey(msg.dateTime)) {
                      otherMessages[msg.dateTime!] = [];
                    }
                    otherMessages[msg.dateTime]?.add(msg);
                  }
                }

                return (controller.messageList.isNotEmpty)
                    ? ListView(
                        controller: _scrollController,
                        padding: const EdgeInsets.only(bottom: 20),
                        children: [
                          for (var entry in otherMessages.entries)
                            _buildMessageGroup(
                                DateFormat('dd MMMM yyyy').format(entry.key),
                                entry.value),
                          if (yesterdayMessages.isNotEmpty)
                            _buildMessageGroup('Yesterday', yesterdayMessages),
                          if (todayMessages.isNotEmpty)
                            _buildMessageGroup('Today', todayMessages),
                        ],
                      )
                    : Text(
                        'No Message Found',
                        style: theme.textTheme.bodyLarge
                            ?.copyWith(color: foodColorPrimary),
                      );
              }),
            ),
            _buildComposer()
          ],
        ),
      ),
      // bottomNavigationBar:,
    );
  }

  Widget _buildMessageGroup(String title, List<MessageData> messages) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Center(
          child: Container(
            padding: const EdgeInsets.all(5),
            decoration: BoxDecoration(
              color: colorGrey600.withOpacity(0.12),
              borderRadius: BorderRadius.circular(6),
            ),
            child: Text(
              title,
              style: theme.textTheme.bodySmall?.copyWith(
                  fontWeight: FontWeight.w600,
                  color: colorGrey600,
                  fontSize: 10),
            ),
          ),
        ),
        10.height,
        ListView.builder(
            itemCount: messages.length,
            itemBuilder: (context, index) {
              MessageData message = messages[index];
              // print(foodMenu.qty);
              return (message.isSender)
                  ? SenderRowView(
                      messageData: message,
                      theme: theme,
                    )
                  : ReceiverRowView(
                      messageData: message,
                      theme: theme,
                    );
            },
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true),
        10.height,
      ],
    );
  }

  _buildComposer() {
    return Container(
      color: Get.isDarkMode ? foodDarkPrimary : Colors.white,
      height: 80,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 10),
        child: Row(
          children: [
            Expanded(
              child: Container(
                height: 60,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  color: Get.isDarkMode ? foodCardDark : colorGrey50,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 8.0, right: 2),
                      child: InkWell(
                        child: SvgPicture.asset(
                          emojiIcon,
                          width: 20,
                          height: 20,
                        ),
                        onTap: () {},
                      ),
                    ),
                    Expanded(
                      child: TextFormField(
                        style: theme.textTheme.bodyLarge?.copyWith(
                          fontWeight: FontWeight.w600,
                          color: Get.isDarkMode
                              ? whiteColor
                              : foodTextColor, // Set your desired text color
                        ),
                        textInputAction: TextInputAction.send,
                        keyboardType: TextInputType.text,
                        focusNode: controller.f1,
                        onFieldSubmitted: (v) {
                          controller.f1.unfocus();
                          sendMessage();
                        },
                        validator: (k) {
                          return null;
                        },
                        controller: controller.textController,
                        decoration: inputDecoration(context,
                            leftContentPadding: 5,
                            bottomContentPadding: 0,
                            rightContentPadding: 0,
                            topContentPadding: 0,
                            borderColor:
                                Get.isDarkMode ? foodCardDark : colorGrey50,
                            fillColor:
                                Get.isDarkMode ? foodCardDark : colorGrey50,
                            hintColor: colorGrey500,
                            borderRadius: textFieldRadius,
                            hintText: typeMessage),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 2.0, right: 10),
                      child: SvgPicture.asset(
                        attachmentIcon,
                        width: 20,
                        height: 20,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 5.0, right: 15),
                      child: SvgPicture.asset(
                        cameraIcon,
                        width: 20,
                        height: 20,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            10.width,
            InkWell(
              child: SvgPicture.asset(
                micIcon,
                width: 56,
                height: 56,
              ),
              onTap: () {},
            ),
          ],
        ),
      ),
    );
  }

  void sendMessage() {
    if (controller.textController.text.isNotEmpty) {
      FocusScope.of(context).unfocus();

      controller.addMessage(controller.textController.text);
      controller.textController.text = '';
      // Scroll to the bottom
      _scrollController.animateTo(
        _scrollController.position.maxScrollExtent,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeOut,
      );
    }
  }
}

_buildMoreIcon() {
  return IconButton(
    onPressed: () {},
    icon: SvgPicture.asset(
      moreIcon,
      width: 18,
      height: 18,
      colorFilter: ColorFilter.mode(
          Get.isDarkMode ? Colors.white : Colors.black, BlendMode.srcIn),
    ),
  );
}

_buildCallIcon() {
  return IconButton(
    onPressed: () {},
    icon: SvgPicture.asset(
      phoneIcon,
      width: 18,
      height: 18,
      colorFilter: ColorFilter.mode(
          Get.isDarkMode ? Colors.white : Colors.black, BlendMode.srcIn),
    ),
  );
}
