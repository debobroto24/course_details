import 'package:coursedetails/utils/all_dimensions.dart';
import 'package:coursedetails/utils/colors.dart';
import 'package:coursedetails/utils/ktext_style.dart';
import 'package:flutter/material.dart';

class TransferrentBtn extends StatelessWidget {
  final String text; 
  const TransferrentBtn({
    super.key, required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: ((Dimensions.screenWidth - Dimensions.height20) / 2) -
          Dimensions.height20 ,
      height: Dimensions.height20 * 2.5,
      decoration: BoxDecoration(
        color: AppColors.offWhite,
        border: Border.all(width: 1, color: AppColors.primaryColor),
        borderRadius:
            BorderRadius.circular(Dimensions.radius15 * .5),
      ),
      alignment: Alignment.center,
      child: Text(text, style: btnText2.copyWith(color:AppColors.primaryColor),),
    );
  }
}
