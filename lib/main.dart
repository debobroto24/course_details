import 'package:coursedetails/controller/course_controller.dart';
import 'package:coursedetails/routes/route_generator.dart';
import 'package:coursedetails/services/helper/dependiences.dart' as dep;
import 'package:coursedetails/utils/all_dimensions.dart';
import 'package:coursedetails/utils/colors.dart';
import 'package:coursedetails/view/course_details.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() async{
  await dep.init();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();

    _loadResourse();
  }
  @override
  Widget build(BuildContext context) {
    return GetBuilder<CourseController>(
      builder: (_) {
        return GetMaterialApp(
          title: 'Flutter Demo',
          debugShowCheckedModeBanner: false,
       
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor:AppColors.primaryColor), 
            useMaterial3: true,
          ),
      
          home : CourseDeatils(),
          
        );
      }
    );
  }
  
  void _loadResourse() async{ 
    await Get.find<CourseController>().getCourseDetails();
  }
}

