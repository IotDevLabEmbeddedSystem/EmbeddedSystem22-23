import 'package:dio/dio.dart';
import 'package:flutter/widgets.dart';
import 'package:vitacheck/controller/baseurl.dart';
import 'Database/db_provider.dart';



class MessagingDataApi extends ChangeNotifier {

Map respData={};
  Map _message = {};
  int _status=0;
  Map get message => _message;
  int get  status=>_status;
   Stream<Map> initStream() async* {
  var public = await DatabaseProvider().getUserId();
    try {
      var dio = Dio();
      Response response = await dio.get(
          "${APPBASEURL.baseUrl}chat_patient/$public");
         respData= response.data;

         print(respData);
      if (respData["status"] == 200) {
        _message =respData;
        print("<____Status:${respData["status"]}");
        notifyListeners();
       
      } else {
        print(respData['status']);
     _status =   respData['status'];
  
     print(_status);
        print("Error fetching Data");
         notifyListeners();
        
      }
    } catch (e) {
      print(e);
     
    }
  }
}

class ReplyDataApi extends ChangeNotifier {

Map respData={};
  Map _message = {};
  int _status=0;
  Map get message => _message;
  int get  status=>_status;
   Stream<Map> initStream() async* {
  var public = await DatabaseProvider().getUserId();
    try {
      var dio = Dio();
      Response response = await dio.get(
          "${APPBASEURL.baseUrl}chat_patient/$public");
         respData= response.data;

         print(respData);
      if (respData["status"] == 200) {
        _message =respData;
        print("<____Status:${respData["status"]}");
        notifyListeners();
       
      } else {
        print(respData['status']);
     _status =   respData['status'];
  
     print(_status);
        print("Error fetching Data");
         notifyListeners();
        
      }
    } catch (e) {
      print(e);
     
    }
  }
}
