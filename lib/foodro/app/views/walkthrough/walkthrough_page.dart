import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';

import '../../../widgets/food_app_widget.dart';

class WalkthroughPage extends StatelessWidget {
  final String title;
  final String description;
  final String image;
  final ThemeData theme;

  const WalkthroughPage(
      {super.key,
      required this.title,
      required this.description,
      required this.image,
      required this.theme});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Image.asset(
            image,
            // width: double.infinity,
            // height: 300,
            height: context.height() * 0.4, width: context.width(),
            fit: BoxFit.fitHeight,
          ),
        ),
        30.height,
        Text(title,
            textAlign: TextAlign.center,
            style: theme.textTheme.displaySmall?.copyWith(
                fontWeight: FontWeight.bold,
                foreground: Paint()..shader = linearGradient,
                letterSpacing: 0.5,
                height: 1.2)),
        20.height,
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0),
          child: Text(
            description,
            style: theme.textTheme.bodyMedium?.copyWith(
              fontWeight: FontWeight.w500,
            ),
            textAlign: TextAlign.center,
          ),
        ),
      ],
    );
  }
}
