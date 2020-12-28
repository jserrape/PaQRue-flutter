//https://medium.com/comunidad-flutter/shared-preferences-c%C3%B3mo-guardar-la-configuraci%C3%B3n-de-la-aplicaci%C3%B3n-flutter-y-las-preferencias-del-8bbd30cd7dbc
import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesHelper{

  final String _ShowIntroduccitionScreens = "introScreen";
  final String _UserLogIn = "userLogIn";
  final String _UserName = "userName";
  final String _UserEmail = "userEmail";
  final String _AllowNotification = "allowNotification";
  final String _AppLanguage = "language";

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

  /// Returns if the user is log in
  Future<bool> getUserLogIn() async{
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getBool(_UserLogIn) ?? false;
  }

  /// Save is the user is log in
  Future<bool> setUserLogIn(bool value) async{
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.setBool(_UserLogIn, value);
  }

  /// Returns the user's name
  Future<String> getUserName() async{
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(_UserName) ?? null;
  }

  /// Save the user's name
  Future<bool> setUserName(String value) async{
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.setString(_UserName, value);
  }

  /// Returns the user's name
  Future<String> getUserEmail() async{
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(_UserEmail) ?? null;
  }

  /// Save the user's name
  Future<bool> setUserEmail(String value) async{
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.setString(_UserEmail, value);
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

  /// Returns the app language
  Future<String> getAppLanguage() async{
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(_AppLanguage) ?? "ES";
  }

  /// Save the app language
  Future<bool> setAppLanguage(String value) async{
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.setString(_AppLanguage, value);
  }

}