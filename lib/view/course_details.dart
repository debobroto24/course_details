import 'package:coursedetails/controller/course_controller.dart';
import 'package:coursedetails/model/course_model.dart';
import 'package:coursedetails/utils/all_dimensions.dart';
import 'package:coursedetails/utils/colors.dart';
import 'package:coursedetails/utils/ktext_style.dart';
import 'package:coursedetails/view/details_body.dart';
import 'package:coursedetails/view/widget/appbar/kapp_bar.dart';
import 'package:coursedetails/view/widget/customIcon/svg_icon.dart';
import 'package:coursedetails/view/widget/error/error_button.dart';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class CourseDeatils extends StatefulWidget {
  const CourseDeatils({super.key});

  @override
  State<CourseDeatils> createState() => _CourseDeatilsState();
}

class _CourseDeatilsState extends State<CourseDeatils> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.appbackgroundColor,
      body: Column(
        children: [const KappBar(), Expanded(child: _buildCourseDetails())],
      ),
    );
  }

  GetBuilder<CourseController> _buildCourseDetails() {
    return GetBuilder<CourseController>(
      builder: (con) {
        print(con.courseState);
        if (con.courseState == CourseState.errorState) {
          return ErrorButton(
              onpressed: retryButton, text: "Something went worng. Try again.");
        } else if (con.courseState == CourseState.successState) {
          return DetailsBody(details: con.courseDeatils!);
        } else {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }

  void retryButton() async {
    await Get.find<CourseController>().getCourseDetails();
  }
}
