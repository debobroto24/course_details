import 'package:get/get.dart';

class ApiClient extends GetConnect{
  final String baseUrl ;
  late Map<String,String> _headers;
  ApiClient({required this.baseUrl}){
     _headers = {
      'Content-type': 'application/json; character =UTF-8',
    };
  }


  Future<Response> getData(String uri, {Map<String,String>?headers}) async{
    try{
      Response response = await get(uri, headers: headers?? _headers );
      return response; 
    }catch(error){
      return Response(
        statusCode: 1, 
        statusText: error.toString()
      );
    }
  }
}