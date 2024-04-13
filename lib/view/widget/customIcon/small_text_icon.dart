import 'package:coursedetails/utils/all_dimensions.dart';
import 'package:coursedetails/utils/colors.dart';
import 'package:coursedetails/utils/ktext_style.dart';
import 'package:coursedetails/view/widget/customIcon/svg_icon.dart';
import 'package:flutter/material.dart';

class SmallTextIcon extends StatelessWidget {
  final String text; 
  final String iconPath;
  const SmallTextIcon({
    super.key, required this.text, required this.iconPath,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
         ImageIcon(AssetImage(iconPath),
              size: Dimensions.height10 * 1.2, // Adjust the size as needed
              color: AppColors
                  .textColor // Optionally, you can specify a color for the icon
              ),
        // KSvgIcon(
        //   // path: 'assets/images/appointment.svg',
        //   path: iconPath,
        //   // path: 'assets/images/earth.svg',
        //   width: Dimensions.height10 * 1.2,
        //   height: Dimensions.height10 * 1.2,
        //   color: AppColors.textColor
        // ),
        SizedBox(width: Dimensions.height10), 
        Text(
          text,
          style: subtitle4.copyWith(color: AppColors.textColor),
        )
      ],
    );
  }
}
