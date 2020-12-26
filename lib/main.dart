import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:history_maker/src/screens/introduction/bluetooth.dart';
import 'package:history_maker/src/screens/introduction/camera.dart';
import 'package:history_maker/src/screens/introduction/careful.dart';
import 'package:history_maker/src/screens/introduction/location.dart';
import 'package:history_maker/src/screens/introduction/welcome.dart';
import 'package:history_maker/src/screens/login/forgetPassword.dart';
import 'package:history_maker/src/screens/login/loginPage.dart';
import 'package:history_maker/src/screens/login/signup.dart';
import 'package:history_maker/src/screens/main/DiscoverPage.dart';
import 'package:history_maker/src/screens/main/more/BlogPage.dart';
import 'package:history_maker/src/screens/main/more/HelpPage.dart';
import 'package:history_maker/src/screens/main/more/ProfilePage.dart';
import 'package:history_maker/src/screens/main/more/TermsPage.dart';
import 'package:history_maker/src/util/SharedPreferencesHelper.dart';

import 'package:history_maker/src/util/constants.dart' as Constants;
import 'package:shared_preferences/shared_preferences.dart';

import 'src/screens/main/more/profile/NamePage.dart';

void main() {
  runApp(new MaterialApp(
    home: new SplashScreen(),
    // https://vignesh-prakash.medium.com/flutter-splash-screen-84fb0307ac55
    routes: <String, WidgetBuilder>{
      '/WelcomeScreen': (BuildContext context) => new welcome(),
      '/CarefulScreen': (BuildContext context) => new careful(),
      '/LocationScreen': (BuildContext context) => new location(),
      '/CameraScreen': (BuildContext context) => new camera(),
      '/BluetoothScreen': (BuildContext context) => new bluetooth(),
      '/LoginScreen': (BuildContext context) => new LoginPage(),
      '/SignupScreen': (BuildContext context) => new SignUpPage(),
      '/ForgetPassScreen': (BuildContext context) => new forgetPassword(),
      '/DiscoverScreen': (BuildContext context) => new DiscoverPage(),
      '/ProfileScreen': (BuildContext context) => new ProfilePage(),
      '/BlogScreen': (BuildContext context) => new BlogPage(),
      '/HelpScreen': (BuildContext context) => new HelpPage(),
      '/TermsScreen': (BuildContext context) => new TermsPage(),
      '/NameScreen': (BuildContext context) => new NamePage(),
      //'/TermsScreen': (BuildContext context) => new TermsPage(),
      //'/TermsScreen': (BuildContext context) => new TermsPage(),
      //'/TermsScreen': (BuildContext context) => new TermsPage(),
      //'/TermsScreen': (BuildContext context) => new TermsPage(),
      //'/TermsScreen': (BuildContext context) => new TermsPage(),
    },
  ));
}


class SplashScreen extends StatefulWidget {
  @override
  State createState() {
    return _SplashScreenState();
  }
}

class _SplashScreenState extends State {

  startTime() async {
    print('startTime');
    var _duration = new Duration(seconds: 3);
    return new Timer(_duration, navigationPage);
  }

  void navigationPage() async{
    SharedPreferencesHelper preferencesHelper = new SharedPreferencesHelper();

    //TODO Comprobar conexión con el servidor

    var loginUser = await preferencesHelper.getUserLogIn();
    print("loginUser=$loginUser");
    if(loginUser == true){
      print("Usuario logeado");
      Navigator.of(context).pushReplacementNamed('/DiscoverScreen');
    }else{
      print("Usuario NO logeado");
      var ShowIntroductionScreens = await preferencesHelper.getShowIntroductionScreens();
      if(ShowIntroductionScreens == true){
        print("Primera vez que entra");
        Navigator.of(context).pushReplacementNamed('/WelcomeScreen');
        //Navigator.of(context).pushReplacementNamed('/DiscoverScreen');
        //Navigator.of(context).pushReplacementNamed('/LoginScreen');
      }else{
        print("NO ES la primera vez que entra");
        //Navigator.of(context).pushReplacementNamed('/WelcomeScreen');
        Navigator.of(context).pushReplacementNamed('/LoginScreen');
        //Navigator.of(context).pushReplacementNamed('/DiscoverScreen');
      }
    }

  }

  @override
  void initState() {
    print('initState');
    super.initState();
    startTime();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
          body: Stack(
            fit: StackFit.expand,
            children: [
              Container(
                decoration: BoxDecoration(color: Colors.orangeAccent),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Expanded(
                    flex: 2,
                    child: Container(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          CircleAvatar(
                            backgroundColor: Colors.white,
                            radius: 50.0,
                            child: Text(
                              "LOGO",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 24.0),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(top: 10.0),
                          ),
                          Text(
                            "PaQRue",
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 24.0),
                          )
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CircularProgressIndicator(),
                        Padding(
                          padding: EdgeInsets.only(top: 20.0),
                        ),
                        Text(
                          "Creando parques para disfrutar",
                          softWrap: true,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 18.0,
                              color: Colors.white),
                        )
                      ],
                    ),
                  )
                ],
              )
            ],
          ),
        )
    );
  }
}