import 'package:shared_preferences/shared_preferences.dart';

Future<bool> getLogin() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  var status = prefs.getBool('isLoggedIn') ?? false;
  return status;
}

Future setLogin(bool val) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  prefs.setBool('isLoggedIn', val);
}

Future<String> getUsername() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  var username = prefs.getString('username') ?? '';
  print('username Get' + username);
  return username;
}

Future setUsername(String username) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  prefs.setString('username', username);
  print('username Set' + username);
}

Future<String> getUseId() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  var userId = prefs.getString('useId') ?? '';
  print('userId Get' + userId);
  return userId;
}

Future setUseId(String userId) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  prefs.setString('useId', userId);
  print('userId Set' + userId);
}
