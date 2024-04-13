import 'package:coursedetails/utils/all_dimensions.dart';
import 'package:coursedetails/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class KSvgIcon extends StatelessWidget {
  final String path;
  final double width; 
  final double height;
  final Color color;
  const KSvgIcon({super.key, required this.path, this.width = 18, this.height = 18,  required this.color  });

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      path,
      width: width, 
      height:height, 
      color: color, 
    );
  }
}
