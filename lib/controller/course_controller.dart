import 'package:coursedetails/controller/course_controller.dart';
import 'package:coursedetails/model/course_model.dart';
import 'package:coursedetails/services/repository/course_details_repo.dart';
// import 'package:coursedetails/view/course_details.dart';
import 'package:get/get.dart';

enum CourseState{
  intialState, 
  loadingState, 
  successState, 
  errorState
}

class CourseController extends GetxController {
  final CourseDetailsRepo courseDetailsRepo;
  CourseController({required this.courseDetailsRepo});
  RxBool _isLoading = false.obs;
  bool get isLoading => _isLoading.value;

  final Rx<CourseModel?> _courseDetails = Rx<CourseModel?>(null);
  CourseModel? get courseDeatils => _courseDetails.value; 

  final Rx<CourseState> _courseSate = CourseState.intialState.obs;
  CourseState get  courseState => _courseSate.value;

  Future getCourseDetails() async {
    print("inside getcoursedtaisl");
    _isLoading.value = true;
    _courseSate.value = CourseState.loadingState;
    Response response = await courseDetailsRepo.getCourseDetails();
    if (response.statusCode == 200) {
      dynamic responseData = response.body;
      if (responseData != null) {
        _courseDetails.value = CourseModel.fromJson(responseData);
        _courseSate.value = CourseState.successState;
        print("data is ");
        print(courseDeatils);
        update(); 
      }else{
          _courseSate.value = CourseState.errorState;
      }
    } else {
      _courseSate.value = CourseState.errorState;
      print("Failed to load course details: ${response.statusText}");
    }

    _isLoading.value = false;
  }
}
