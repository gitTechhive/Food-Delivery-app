import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nb_utils/nb_utils.dart';

import '../../../constant/food_colors.dart';
import '../../../widgets/food_app_widget.dart';
import '../../model/chat_model.dart';

class MessageItemViewWidget extends StatelessWidget {
  final ChatData chatData;
  final ThemeData theme;
  final VoidCallback onPressed;

  const MessageItemViewWidget(
      {super.key,
      required this.chatData,
      required this.theme,
      required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ClipOval(
              child: commonCacheImageWidget(chatData.image.toString(), 60,
                  width: 60),
            ),
            10.width,
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    chatData.userName,
                    textAlign: TextAlign.left,
                    style: theme.textTheme.bodyLarge?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    chatData.message,
                    textAlign: TextAlign.left,
                    style: theme.textTheme.bodyMedium?.copyWith(
                        fontWeight: FontWeight.w500,
                        color: Get.isDarkMode ? colorGrey300 : colorGrey700),
                  ),
                ],
              ),
            ),
            10.width,
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                if (chatData.unreadMsgCount > 0)
                  Container(
                    width: 25, // Width of the circular container
                    height: 25, // Height of the circular container
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle, // Set shape to circle
                      gradient: LinearGradient(
                        colors: <Color>[foodGradient1, foodGradient2],
                      ), // Color of the circular container
                    ),
                    child: Center(
                      child: Text(
                        chatData.unreadMsgCount.toString(),
                        style: theme.textTheme.bodyLarge?.copyWith(
                            fontWeight: FontWeight.w400,
                            color: Colors.white,
                            fontSize: 10),
                      ),
                    ),
                  ),
                Text(
                  chatData.dateTime,
                  style: theme.textTheme.bodyMedium?.copyWith(
                      fontWeight: FontWeight.w500,
                      color: Get.isDarkMode ? colorGrey300 : colorGrey700),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
