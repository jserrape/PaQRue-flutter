import 'package:flutter/material.dart';
import 'package:history_maker/src/model/User.dart';
import 'package:history_maker/src/screens/main/more/ProfilePage.dart';
import 'package:history_maker/src/util/SharedPreferencesHelper.dart';

import 'package:http/http.dart' as http;
import 'package:history_maker/src/services/UserServices.dart' as UserServices;

class EmailPage extends StatefulWidget {
  EmailPage({Key key, this.title}) : super(key: key);

  final String title;


  @override
  _EmailPageState createState() => _EmailPageState();
}

class _EmailPageState extends State<EmailPage> {

  String initialEmail = "";
  TextEditingController _controller = TextEditingController();
  bool checkVisible = false;

  static _readEmail() async {
    SharedPreferencesHelper preferencesHelper = new SharedPreferencesHelper();
    return preferencesHelper.getUserEmail();
  }

  Future<http.Response> postChangeEmail(String initEmail, String finalEmail) async {
    final response = await UserServices.postChangeEmail(initEmail, finalEmail);
    return response;
  }

  void makePostChangeEmail(String initEmail, String finalEmail) async {
    http.Response response = await postChangeEmail(initEmail, finalEmail);
    print(response);
    print(response.statusCode);
    print(response.body);

    if(response.statusCode == 200){
      SharedPreferencesHelper preferencesHelper = new SharedPreferencesHelper();
      preferencesHelper.setUserEmail(_controller.text);
      initialEmail = _controller.text;
      setState(() {
        checkVisible = false;
      });
    }else{
      return await showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            content: Text("Ha habido un error actualizando el email"),
          );
        },
      );
    }
  }

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) async {
      _controller.text = await _readEmail();
      initialEmail = _controller.text;
    });
  }

  void evaluateTextFieldChange(String text){
    if(text == ""){
      print("Texto vacio");
      setState(() {
        checkVisible = false;
      });
    }else{
      if(text == initialEmail){
        print("El email no ha cambiado");
        setState(() {
          checkVisible = false;
        });
      }else{
        print("El email sí ha cambiado");
        setState(() {
          checkVisible = true;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xfff1f2f4),
      appBar: AppBar(
        leading: new IconButton(
            icon: new Icon(Icons.arrow_back),
            onPressed: (){
              int count = 0;
              Navigator.popUntil(context, (route) {
                return count++ == 2;
              });
              Navigator.of(context).push(MaterialPageRoute(builder: (context) => ProfilePage()));
            }
        ),
        backgroundColor: Colors.orangeAccent,
        title: Text('Tu email'),
        actions: <Widget>[
          Visibility(
            visible: checkVisible,
            child: InkWell(
              onTap: () {
                makePostChangeEmail(initialEmail,_controller.text);
              }, // handle your onTap here
              child: Padding(
                  padding: EdgeInsets.only(right: 20.0),
                  child: Icon(
                    Icons.check,
                    size: 26.0,
                  )
              ),
            ),
          )
        ],
      ),
      body: Container(
        child: Stack(
          children: <Widget>[
            Container(
              child: SingleChildScrollView(
                child: Column(
                  children: <Widget>[
                    Padding(
                      // Izquierda, Arriba, Derecha, Abajo
                        padding: EdgeInsets.fromLTRB(20, 20, 0, 5),
                        child: Text('EMAIL',
                            style: TextStyle(fontSize: 16))
                    ),
                    TextField(
                      onChanged: (text) {
                        evaluateTextFieldChange(text.trim());
                      },
                      controller: _controller,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: 'Introduce tu email',
                        suffixIcon: IconButton(
                          onPressed: () {
                            setState(() {
                              _controller.clear();
                              checkVisible = false;
                            });
                          },
                          icon: Icon(Icons.clear),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
