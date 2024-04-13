import 'package:coursedetails/utils/all_dimensions.dart';
import 'package:coursedetails/utils/colors.dart';
import 'package:coursedetails/utils/ktext_style.dart';
import 'package:coursedetails/view/widget/customIcon/svg_icon.dart';
import 'package:flutter/material.dart';

class KappBar extends StatelessWidget {
  const KappBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: Dimensions.height30 * 5,
          padding: EdgeInsets.only(
              left: Dimensions.height20,
              right: Dimensions.height20,
              bottom: Dimensions.height20 * 1),
          decoration: BoxDecoration(color: AppColors.primaryColor),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              KSvgIcon(
                color: AppColors.white,
                path: 'assets/images/menu.svg',
                width: Dimensions.height20 * 1.3,
                height: Dimensions.height20 * 1.3,
              ),
              Text(
                "Course Details",
                style: title.copyWith(color: AppColors.white),
              ),
              KSvgIcon(
                color: AppColors.white,
                path: 'assets/images/cart.svg',
                width: Dimensions.height20 * 1.3,
                height: Dimensions.height20 * 1.3,
              )
            ],
          ),
        ),
        Positioned(
          top: Dimensions.height20 * 6,
          child: Container(
            width: MediaQuery.of(context).size.width,
            height: Dimensions.height20 * 2,
            decoration: BoxDecoration(
                color: AppColors.appbackgroundColor,
                // color: Colors.red,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(Dimensions.height20),
                  topRight: Radius.circular(Dimensions.height20),
                )),
          ),
        )
      ],
    );
  }
}
