//https://medium.com/comunidad-flutter/shared-preferences-c%C3%B3mo-guardar-la-configuraci%C3%B3n-de-la-aplicaci%C3%B3n-flutter-y-las-preferencias-del-8bbd30cd7dbc
import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesHelper{

  final String _ShowIntroduccitionScreens = "introScreen";
  final String _AllowNotification = "allowNotification";

  /// Returns the user's decision to allow notifications
  Future<bool> getAllowNotification() async{
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getBool(_AllowNotification) ?? false;
  }

  /// Save the user's decision to allow notifications
  Future<bool> setAllowNotification(bool value) async{
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.setBool(_AllowNotification, value);
  }

  /// Returns if the user has already seen the introduction
  Future<bool> getShowIntroductionScreens() async{
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getBool(_ShowIntroduccitionScreens) ?? true;
  }

  /// Set if the user has already seen the introduction
  Future<bool> setShowIntroductionScreens(bool value) async{
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.setBool(_ShowIntroduccitionScreens,value);
  }
}