import 'package:flutter/widgets.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:vitacheck/pageNavigator.dart';
import 'package:vitacheck/views/homeLogin.dart';

class DatabaseProvider extends ChangeNotifier {
  final Future<SharedPreferences> _pref = SharedPreferences.getInstance();
  String _token = "";
  String _userId = "";

  String get token => _token;
  String get userId => _userId;
  void savedToken(String token) async {
    SharedPreferences value = await _pref;
    value.setString('token', token);
  }

  void savedUserId(String id) async {
    SharedPreferences value = await _pref;
    value.setString('id', id);
  }

  Future<String> getToken() async {
    SharedPreferences value = await _pref;
    if (value.containsKey('token')) {
      String data = value.getString('token')!;

      _token = data;
      notifyListeners();
      return data;
    } else {
      _token = "";
      notifyListeners();
      return "";
    }
  }

  Future<String> getUserId() async {
    SharedPreferences value = await _pref;
    if (value.containsKey('id')) {
      String data = value.getString('id')!;

      _userId = data;
      notifyListeners();
      return data;
    } else {
      _userId = "";
      notifyListeners();
      return "";
    }
  }

  void logOut(BuildContext? context) async {
    final value = await _pref;
    value.clear();
    pageNavigator(ctx: context).nextPageOnly(page: const Home());
  }
}
