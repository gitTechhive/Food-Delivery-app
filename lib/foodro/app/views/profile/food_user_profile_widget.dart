import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:foodro/foodro/constant/food_colors.dart';

import '../../../constant/food_images.dart';



class UserProfilePictureWidget extends StatelessWidget {
  const UserProfilePictureWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Stack(
        alignment: Alignment.bottomRight,
        children: [
          ClipOval(
            child: Image.asset(
              profileIcon,
              height: 130.0, // Replace with your image URL
              width: 130.0,
            ),
          ),
          GestureDetector(
            onTap: () {},
            child: Container(
              padding: const EdgeInsets.all(7),
              decoration: BoxDecoration(
                  shape: BoxShape.rectangle,
                  borderRadius: BorderRadius.circular(10),
                  // border: Border.all(width: 2, color: Colors.white),
                  color: foodColorPrimary),
              child: SvgPicture.asset(
                editIcon,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
