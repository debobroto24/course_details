// import 'dart:ffi';


import 'package:coursedetails/view/course_details.dart';
import 'package:coursedetails/view/splash_screen.dart';
import 'package:get/get.dart';

class RouteHelper {
  static const splashPage = "/splash-page";
  static const String initial = '/';

  // static const String orderSuccess = '/order-successful';

  static String getSplashPage() => '$splashPage';
  static String getInitial() => '$initial';



  static List<GetPage> routes = [
    GetPage(name: splashPage, page: () => SplashScreen()),
    GetPage(name: initial, page: () => CourseDeatils()),
    
  ];
}
