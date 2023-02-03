import 'dart:async';
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flutter/widgets.dart';
import 'package:vitacheck/controller/baseurl.dart';
import 'package:vitacheck/provider/Database/db_provider.dart';
import 'package:vitacheck/views/welcome.dart';
import '../../pageNavigator.dart';
import '../../views/login.dart';

class Authentication extends ChangeNotifier {
  bool _isloading = false;
  bool _state=false;
  String _resMessage = '';
  Map respData={};
bool get state=>_state;
  bool get isloading => _isloading;
  String get resMessage => _resMessage;

  Future<void> signup({
    required String name,
    required String email,
    required String password,
   required BuildContext context,
  }) async {
    _isloading = true;
    notifyListeners();
    final body = {"name": name, "email": email, "password": password};

    try {
      var dio = Dio();
      Response response =
          await dio.post("${APPBASEURL.baseUrl}user", data: body);
          respData=response.data;
 
      if (respData['status']==201) {
        _resMessage = "account  created";
         _isloading = false;
        print(_resMessage);
        notifyListeners();
      
        pageNavigator(ctx: context).nextPage(page: const LogIn());

        
      } else {
        _resMessage = "Please try again";
        _isloading = false;
        _state=true;
        notifyListeners();
      }
    } on SocketException catch (_) {
      _isloading = false;
      _resMessage = "Internet connection is not available";
       _state=true;
      notifyListeners();
      rethrow;
    } catch (e) {
      print(e);
      _isloading = false;
      _resMessage = "Please try again";
      _state=true;
      notifyListeners();
    }
  }

  Future<void> loginUser(
      {required String email,
      required String password,
      required BuildContext context}) async {
    _isloading = true;
    notifyListeners();
    final body = {"email": email, "password": password};

    var respMess = "";

    try {
      var dio = Dio();
      Response response =
          await dio.post("${APPBASEURL.baseUrl}login", data: body);
      if (response.data['status']==200) {
        print( response.data);
        _isloading = false;
         _resMessage = "Authenticated";
        final res = response.data;
        notifyListeners();

        final userId = res['user']['public_id'];
        final token = res['auth_token'];
        DatabaseProvider().savedUserId(userId);
        DatabaseProvider().savedToken(token);
        pageNavigator(ctx: context).nextPageOnly(page: const Welcome());
      } else {
        _isloading = false;
        _state=true;
        _resMessage ="Wrong Credentials";
        notifyListeners();
      }
    } on SocketException catch (_) {
      _isloading = false;
       _resMessage = "Internet connection is not available";
    _state=true;
      notifyListeners();

      rethrow;
    } catch (e) {
      _isloading = false;
      _resMessage = "Please try again $respMess";
      _state=true;
      notifyListeners();
    }
  }

  void clear() {
    _resMessage = "";
    notifyListeners();
  }
}
