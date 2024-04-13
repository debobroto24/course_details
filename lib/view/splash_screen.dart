import 'dart:async';

import 'package:coursedetails/controller/course_controller.dart';
import 'package:coursedetails/routes/route_generator.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  //  late Animation<double> animation;
  // late AnimationController controller;
  // Future<void> _loadResource() async {
  //   await Get.find<CourseController>().getCourseDetails();
  // }
    @override
  void initState() {
    super.initState();
    _loadResource();
    // controller = new AnimationController(
    //     vsync: this, duration: const Duration(seconds: 2))
    //   ..forward();

    // animation = CurvedAnimation(parent: controller, curve: Curves.linear);

    Timer(Duration(seconds: 3), () => Get.offNamed(RouteHelper.getInitial()));
  }

 Future<void> _loadResource() async {
   await Get.find<CourseController>().getCourseDetails();
    _navigateToHome();
  }

  void _navigateToHome() {
    Future.delayed(Duration(seconds: 3), () {
      Get.offNamed(RouteHelper.getInitial());
    });
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            Text("splash screen"), 
            Container(
              height: 20, 
              width: 20, 
              child: CircularProgressIndicator(),
            ),
          ],
        ),
      )
    );
  }
}