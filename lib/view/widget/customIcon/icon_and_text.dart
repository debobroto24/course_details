import 'package:coursedetails/utils/all_dimensions.dart';
import 'package:coursedetails/utils/colors.dart';
import 'package:coursedetails/utils/ktext_style.dart';
import 'package:coursedetails/view/widget/customIcon/svg_icon.dart';
import 'package:flutter/material.dart';

class IconAndText extends StatelessWidget {
  final String text;
  final String iconPath;
  const IconAndText({
    super.key,
    required this.text,
    required this.iconPath,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: Dimensions.height15),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center, 
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          ImageIcon(AssetImage(iconPath),
              size: Dimensions.height20, // Adjust the size as needed
              color: AppColors
                  .secondaryColor // Optionally, you can specify a color for the icon
              ),
          SizedBox(width: Dimensions.height10),
          Text(text, style: btnText2.copyWith(color: AppColors.titleColor))
        ],
      ),
    );
  }
}
