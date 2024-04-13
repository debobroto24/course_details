import 'package:coursedetails/controller/course_controller.dart';
import 'package:coursedetails/services/api/api_client.dart';
import 'package:coursedetails/services/repository/course_details_repo.dart';
import 'package:coursedetails/utils/constdata.dart';
import 'package:get/get.dart';

Future<void> init()async{
  Get.lazyPut(() => ApiClient(baseUrl: ConstData.BASE_URL)); 

  Get.lazyPut(() => CourseDetailsRepo(apiClient: Get.find()));

  Get.lazyPut(() => CourseController(courseDetailsRepo: Get.find()));
}