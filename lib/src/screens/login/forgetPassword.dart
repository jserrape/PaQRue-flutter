import 'package:flutter/material.dart';
import 'package:history_maker/src/Widget/bezierContainer.dart';
import 'file:///C:/Users/Juanca/Documents/GitHub/PaQRue-flutter/lib/src/Visual.dart';

import 'package:history_maker/src/services/UserServices.dart' as UserServices;
import 'package:http/http.dart' as http;

import '../../../app_localizations.dart';

class forgetPassword extends StatefulWidget {
  forgetPassword({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _forgetPasswordState createState() => _forgetPasswordState();
}

class _forgetPasswordState extends State<forgetPassword> {
  final controllerEmail = TextEditingController();

  Widget _entryField(TextEditingController controller, String title,
      {bool isPassword = false}) {
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

  Widget _submitButton() {
    return InkWell(
      onTap: () async {
        print(controllerEmail.text);
        bool emailValid = RegExp(
            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
            .hasMatch(controllerEmail.text);
        if(!emailValid){
          return showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                content: Text(AppLocalizations.of(context).translate('email_formar_incorrect')),
              );
            },
          );
        }else{
          await changePassword();
          return showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                content: Text(AppLocalizations.of(context).translate('email_change_pass')),
              );
            },
          );
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
        child: Text(
          AppLocalizations.of(context).translate('remember_pass'),
          style: TextStyle(fontSize: 20, color: Colors.white),
        ),
      ),
    );
  }

  Future<http.Response> changePassword() async {
    final response = await UserServices.postChangePassword(controllerEmail.text);
    return response;
  }

  Widget _emailWidget() {
    return Column(
      children: <Widget>[
        Text(
          AppLocalizations.of(context).translate('remember_pass_text'),
          textAlign: TextAlign.center,
          //overflow: TextOverflow.ellipsis,
          style: TextStyle(),
        ),
        SizedBox(
          height: 20,
        ),
        _entryField(controllerEmail, AppLocalizations.of(context).translate('email'))
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
              top: -MediaQuery.of(context).size.height * .15,
              right: -MediaQuery.of(context).size.width * .4,
              child: BezierContainer(),
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    SizedBox(height: height * .2),
                    (new Visual()).title2(context),
                    SizedBox(
                      height: 50,
                    ),
                    _emailWidget(),
                    SizedBox(
                      height: 20,
                    ),
                    _submitButton(),
                  ],
                ),
              ),
            ),
            Positioned(
                top: 40, left: 0, child: backButton()),
          ],
        ),
      ),
    );
  }

  Widget backButton() {
    return InkWell(
      onTap: () {
        //Navigator.pop(context);
        Navigator.of(context).pushReplacementNamed('/LoginScreen');
      },
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 10),
        child: Row(
          children: <Widget>[
            Container(
              padding: EdgeInsets.only(left: 0, top: 10, bottom: 10),
              child: Icon(Icons.keyboard_arrow_left, color: Colors.black),
            ),
            Text(AppLocalizations.of(context).translate('back'),
                style: TextStyle(fontSize: 12, fontWeight: FontWeight.w500))
          ],
        ),
      ),
    );
  }
}
