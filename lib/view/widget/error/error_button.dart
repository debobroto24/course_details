import 'package:coursedetails/utils/all_dimensions.dart';
import 'package:coursedetails/utils/colors.dart';
import 'package:coursedetails/utils/ktext_style.dart';
import 'package:flutter/material.dart';

class ErrorButton extends StatelessWidget {
  final String text; 
  final VoidCallback onpressed;
  const ErrorButton({super.key, required this.text, required this.onpressed});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(  
          text,
          style: title2.copyWith(color: AppColors.subtitleColor),
        ), 
        SizedBox(height: Dimensions.height10,), 
        TextButton(onPressed: onpressed, child: Text("Reload",style: title2.copyWith(color: AppColors.white),), style: ButtonStyle(
          backgroundColor: MaterialStateColor.resolveWith((states) => AppColors.primaryColor),
     
        ),)

      ],
    );
  }
}