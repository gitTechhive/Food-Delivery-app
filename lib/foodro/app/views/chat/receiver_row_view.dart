import 'package:flutter/material.dart';
import 'package:foodro/foodro/constant/food_colors.dart';
import 'package:get/get.dart';
import 'package:nb_utils/nb_utils.dart';

import '../../../widgets/food_app_widget.dart';
import '../../model/message_data.dart';

class ReceiverRowView extends StatelessWidget {
  final MessageData messageData;
  final ThemeData theme;

  const ReceiverRowView(
      {super.key, required this.messageData, required this.theme});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Flexible(
          flex: 85,
          fit: FlexFit.tight,
          child: Padding(
            padding: const EdgeInsets.only(left: 10.0, top: 1.0, bottom: 9.0),
            child: Container(
              margin: const EdgeInsets.only(
                  left: 5.0, right: 8.0, top: 8.0, bottom: 0.0),
              padding: const EdgeInsets.only(
                  left: 8.0, right: 8.0, top: 10.0, bottom:10.0),
              decoration:  BoxDecoration(
                  shape: BoxShape.rectangle,
                  color: Get.isDarkMode ? foodCardDark : colorGrey100,
                  borderRadius: const BorderRadius.all(Radius.circular(10.0))),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                // crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Wrap(
                      children: [
                        Text(
                          messageData.message,
                          textAlign: TextAlign.left,
                          style: theme.textTheme.bodyLarge
                              ?.copyWith(fontWeight: FontWeight.w500),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    alignment: Alignment.bottomRight,
                    // margin: const EdgeInsets.only(left: 10.0, bottom: 8.0),
                    child:  Text(
                      messageData.time,
                      style: theme.textTheme.bodySmall
                          ?.copyWith(fontWeight: FontWeight.w500,color:Get.isDarkMode ? colorGrey300 : colorGrey500),
                    ),
                  ),
                ],
              ),
            ),
          ),
          //
        ),
        if (messageData.message.isNotEmpty)
        Flexible(
          flex: 15,
          fit: FlexFit.tight,
          child: Container(
            width: 50.0,
          ),
        ),
        if (messageData.images.isNotEmpty)
          Flexible(
            flex: 85,
            fit: FlexFit.tight,
            child: Padding(
              padding: const EdgeInsets.only(left: 10.0, top: 1.0, bottom: 9.0),
              child: HorizontalList(
                padding: EdgeInsets.zero,
                itemBuilder: (context, index) {
                  return ClipRRect(
                    borderRadius: BorderRadius.circular(24),
                    child: commonCacheImageWidget(messageData.images[index], 140,
                        width: 140),
                  );
                },
                itemCount: messageData.images.length,
              ),
            ),
            //
          ),
      ],
    );
  }
}
