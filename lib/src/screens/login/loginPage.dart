import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:history_maker/src/model/User.dart';
import 'package:history_maker/src/util/SharedPreferencesHelper.dart';

import 'package:history_maker/src/util/constants.dart' as Constants;
import 'file:///C:/Users/Juanca/Documents/GitHub/PaQRue-flutter/lib/src/Visual.dart';

import 'package:http/http.dart' as http;
import 'package:history_maker/src/services/UserServices.dart' as UserServices;

import '../../../app_localizations.dart';
import '../../Widget/bezierContainer.dart';

class LoginPage extends StatefulWidget {
  LoginPage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  final controllerEmail = TextEditingController();
  final controllerPassword = TextEditingController();

  _saveUser(var jsonDecode) async {
    SharedPreferencesHelper preferencesHelper = new SharedPreferencesHelper();
    preferencesHelper.setUserLogIn(true);
    preferencesHelper.setUserEmail(jsonDecode['email']);
    preferencesHelper.setUserName(jsonDecode['nombre']);
  }
  
  Widget _entryField(TextEditingController controller, String title, {bool isPassword = false}) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            title,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
          ),
          SizedBox(
            height: 10,
          ),
          TextField(
              controller: controller,
              obscureText: isPassword,
              decoration: InputDecoration(
                  border: InputBorder.none,
                  fillColor: Color(0xfff3f3f4),
                  filled: true))
        ],
      ),
    );
  }

  Future<http.Response> loginUser(User user) async {
    final response = await UserServices.postLogUser(user);
    return response;
  }

  Widget _submitButton() {
    return InkWell(
      onTap: () async {
        bool emailValid = RegExp(
            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
            .hasMatch(controllerEmail.text);
        bool passwordValid = controllerPassword.text.trim().length > 0;
        if(!emailValid || !passwordValid){
          return await showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                content: Text(AppLocalizations.of(context).translate('format_no_valid_1')),
              );
            },
          );
        }else{
          User user = new User(controllerEmail.text, "", controllerPassword.text, -1);
          http.Response response = await loginUser(user);
          print(response);
          print(response.statusCode);
          //print(response.body);
          print((jsonDecode(response.body))['element']);
          if(response.statusCode == 200){
            //Guardar datos del usuario
            _saveUser((jsonDecode(response.body))['element']);
            //Pasar a la siguiente pantalla
            Navigator.of(context).pushReplacementNamed('/DiscoverScreen');
          }else{
            return await showDialog(
              context: context,
              builder: (context) {
                return AlertDialog(
                  content: Text(AppLocalizations.of(context).translate('pass_error')),
                );
              },
            );
          }
        }
      },
      child: Container(
        width: MediaQuery.of(context).size.width,
        padding: EdgeInsets.symmetric(vertical: 15),
        alignment: Alignment.center,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(5)),
            boxShadow: <BoxShadow>[
              BoxShadow(
                  color: Colors.grey.shade200,
                  offset: Offset(2, 4),
                  blurRadius: 5,
                  spreadRadius: 2)
            ],
            gradient: LinearGradient(
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
                colors: [Color(0xfffbb448), Color(0xfff7892b)])),
        child: Text(AppLocalizations.of(context).translate('log_in'), style: TextStyle(fontSize: 20, color: Colors.white),
        ),
      ),
    );
  }

  Widget _divider() {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      child: Row(
        children: <Widget>[
          SizedBox(
            width: 20,
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: Divider(
                thickness: 1,
              ),
            ),
          ),
          Text(AppLocalizations.of(context).translate('or')),
          Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: Divider(
                thickness: 1,
              ),
            ),
          ),
          SizedBox(
            width: 20,
          ),
        ],
      ),
    );
  }

  Widget _facebookButton() {
    return Container(
      height: 50,
      margin: EdgeInsets.symmetric(vertical: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(10)),
      ),
      child: Row(
        children: <Widget>[
          Expanded(
            flex: 1,
            child: Container(
              padding: EdgeInsets.all(5),
              decoration: BoxDecoration(
                color: Color(0xff1959a9),
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(5),
                    topLeft: Radius.circular(5)),
              ),
              alignment: Alignment.center,
              child:
                Image(image: AssetImage(Constants.facebookLogo)),
            ),
          ),
          Expanded(
            flex: 5,
            child: Container(
              decoration: BoxDecoration(
                color: Color(0xff2872ba),
                borderRadius: BorderRadius.only(
                    bottomRight: Radius.circular(5),
                    topRight: Radius.circular(5)),
              ),
              alignment: Alignment.center,
              child: Text(AppLocalizations.of(context).translate('log_in_facebook'),
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.w400)),
            ),
          ),
        ],
      ),
    );
  }

  Widget _googleButton() {
    return Container(
      height: 50,
      margin: EdgeInsets.symmetric(vertical: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(10)),
      ),
      child: Row(
        children: <Widget>[
          Expanded(
            flex: 1,
            child: Container(
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: Color(0xffffffff),
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(5),
                    topLeft: Radius.circular(5)),
              ),
              alignment: Alignment.center,
              child:
                Image(image: AssetImage(Constants.googleLogo)),
            ),
          ),
          Expanded(
            flex: 5,
            child: Container(
              decoration: BoxDecoration(
                color: Color(0xffffffff),
                borderRadius: BorderRadius.only(
                    bottomRight: Radius.circular(5),
                    topRight: Radius.circular(5)),
              ),
              alignment: Alignment.center,
              child: Text(AppLocalizations.of(context).translate('log_in_google'),
                  style: TextStyle(
                      color: Colors.grey,
                      fontSize: 18,
                      fontWeight: FontWeight.w400)),
            ),
          ),
        ],
      ),
    );
  }

  Widget _createAccountLabel() {
    return InkWell(
      onTap: () {
        Navigator.of(context).pushReplacementNamed('/SignupScreen');
      },
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 20),
        padding: EdgeInsets.all(15),
        alignment: Alignment.bottomCenter,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              AppLocalizations.of(context).translate('no_account'),
              style: TextStyle(fontSize: 13, fontWeight: FontWeight.w600),
            ),
            SizedBox(
              width: 10,
            ),
            Text(
              AppLocalizations.of(context).translate('register'),
              style: TextStyle(
                  color: Color(0xfff79c4f),
                  fontSize: 13,
                  fontWeight: FontWeight.w600),
            ),
          ],
        ),
      ),
    );
  }


  Widget _emailPasswordWidget() {
    return Column(
      children: <Widget>[
        _entryField(controllerEmail, AppLocalizations.of(context).translate('email')),
        _entryField(controllerPassword, AppLocalizations.of(context).translate('password'), isPassword: true),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
        body: Container(
      height: height,
      child: Stack(
        children: <Widget>[
          Positioned(
              top: -height * .15,
              right: -MediaQuery.of(context).size.width * .4,
              child: BezierContainer()),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  SizedBox(height: height * .2),
                  (new Visual()).title2(context),
                  SizedBox(height: 40),
                  _emailPasswordWidget(),
                  SizedBox(height: 10),
                  _submitButton(),
                  InkWell(
                    child: Container(
                      padding: EdgeInsets.symmetric(vertical: 10),
                      alignment: Alignment.centerRight,
                      child: Text(AppLocalizations.of(context).translate('forget_pass'),
                          style: TextStyle(
                              color: Color(0xfff79c4f),
                              fontSize: 13,
                              fontWeight: FontWeight.w600)
                      ),
                    ),
                    onTap: () {
                      Navigator.of(context).pushReplacementNamed('/ForgetPassScreen');
                    },
                  ),
                  _divider(),
                  _facebookButton(),
                  _googleButton(),
                  SizedBox(height: height * .005),
                  _createAccountLabel(),
                ],
              ),
            ),
          ),
          //Positioned(top: 40, left: 0, child: _backButton()),
        ],
      ),
    ));
  }
}
