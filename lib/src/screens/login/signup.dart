import 'package:flutter/material.dart';
import 'package:history_maker/src/Widget/bezierContainer.dart';
import 'package:history_maker/src/model/User.dart';
import 'package:history_maker/src/util/Visual.dart';

import 'package:http/http.dart' as http;

import 'package:history_maker/src/services/UserServices.dart' as UserServices;

import 'loginPage.dart';

class SignUpPage extends StatefulWidget {
  SignUpPage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {

  final controllerEmail = TextEditingController();
  final controllerPassword = TextEditingController();

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

  Future<http.Response> addUser(User user) async {
    final response = await UserServices.postUser(user);
    //return User.fromJson(json.decode(response.body));
    return response;
  }

  Widget _submitButton() {
    return InkWell(
      onTap: () async {
        bool emailValid = RegExp(
                r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
            .hasMatch(controllerEmail.text);
        bool passwordValid = controllerPassword.text.length > 5;
        if (emailValid && passwordValid) {
          User user = new User(controllerEmail.text, controllerPassword.text, 0);
          http.Response response = await addUser(user);
          String mensaje = "";
          if(response.statusCode == 201){
            mensaje = "Registro completo";
            controllerEmail.clear();
            controllerPassword.clear();
          }else{
            mensaje = "Ya existe una cuenta con ese correo electrónico";
          }

          return await showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                content: Text(mensaje),
              );
            },
          ).then((val){
            Navigator.pop(context);
          });
        } else {
          String error = "Error sin definir";
          if (emailValid && !passwordValid) {
            error = "Formato de la contraseña incorrecto";
          }
          if (!emailValid && passwordValid) {
            error = "Formato del email incorrecto";
          }
          if (!emailValid && !passwordValid) {
            error = "Formato del email y contraseña incorrectos";
          }
          return showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                content: Text(error),
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
          'Registrarse ahora',
          style: TextStyle(fontSize: 20, color: Colors.white),
        ),
      ),
    );
  }

  Widget _loginAccountLabel() {
    return InkWell(
      onTap: () {
        Navigator.of(context).pushReplacementNamed('/LoginScreen');
      },
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 20),
        padding: EdgeInsets.all(15),
        alignment: Alignment.bottomCenter,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              '¿Ya tienes una cuenta?',
              style: TextStyle(fontSize: 13, fontWeight: FontWeight.w600),
            ),
            SizedBox(
              width: 10,
            ),
            Text(
              'Iniciar sesión',
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
        _entryField(controllerEmail, "Email"),
        _entryField(controllerPassword, "Contraseña", isPassword: true),
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
                    _emailPasswordWidget(),
                    SizedBox(
                      height: 20,
                    ),
                    _submitButton(),
                    SizedBox(height: height * .14),
                    _loginAccountLabel(),
                  ],
                ),
              ),
            ),
            Positioned(
                top: 40, left: 0, child: (new Visual()).backButton(context)),
          ],
        ),
      ),
    );
  }
}
