import 'package:coursedetails/services/api/api_client.dart';
import 'package:coursedetails/utils/constdata.dart';
import 'package:get/get.dart';

class CourseDetailsRepo extends GetxService{
    final ApiClient apiClient; 
    CourseDetailsRepo({required this.apiClient}); 
    Future<Response> getCourseDetails()async{
      Response response =await apiClient.getData(ConstData.COURSE_DETAILS_URI);
      return response;
    }
}