import 'package:coursedetails/utils/all_dimensions.dart';
import 'package:coursedetails/utils/colors.dart';
import 'package:coursedetails/utils/ktext_style.dart';
import 'package:flutter/material.dart';

class FillButton extends StatelessWidget {
  final String text; 
  final  VoidCallback onTap;
  const FillButton({
    super.key, required this.text, required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell( 
      onTap: onTap,
      child: Container(
        width: double.infinity,
        height: Dimensions.height45,
        decoration: BoxDecoration(
          color: AppColors.primaryColor,
          border: Border.all(width: 1, color: AppColors.black),
          borderRadius: BorderRadius.circular(Dimensions.radius15 * .5),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.2), // Shadow color
              spreadRadius: 1, // Spread radius
              blurRadius: 3, // Blur radius
              offset: Offset(0, 2), // Shadow position
            ),
          ],
        ),
        alignment: Alignment.center,
        child: Text(text,
            style: btnText.copyWith(color: AppColors.white)),
      ),
    );
  }
}
