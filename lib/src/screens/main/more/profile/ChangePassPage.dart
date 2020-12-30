import 'package:flutter/material.dart';
import 'package:history_maker/src/model/User.dart';
import 'package:history_maker/src/screens/main/more/ProfilePage.dart';
import 'package:history_maker/src/util/SharedPreferencesHelper.dart';

import 'package:http/http.dart' as http;
import 'package:history_maker/src/services/UserServices.dart' as UserServices;

class ChangePassPage extends StatefulWidget {
  ChangePassPage({Key key, this.title}) : super(key: key);

  final String title;


  @override
  _ChangePassPageState createState() => _ChangePassPageState();
}

class _ChangePassPageState extends State<ChangePassPage> {

  TextEditingController _controller1 = TextEditingController();
  TextEditingController _controller2 = TextEditingController();
  TextEditingController _controller3 = TextEditingController();
  bool checkVisible = false;

  //BorderSide borderError = BorderSide(color: Colors.red, width: 2.0);


  Future<http.Response> postChangeName() async {
    //final response = await UserServices.postChangeName(user);
    //return response;
    return null;
  }

  void makePostChangeName() async {
    http.Response response = await postChangeName();
    print(response);
    print(response.statusCode);
    print(response.body);

    if(response.statusCode == 201){

      setState(() {
        checkVisible = false;
      });
    }else{
      return await showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            content: Text("Ha habido un error actualizando el nombre"),
          );
        },
      );
    }
  }

  @override
  void initState() {
    super.initState();
  }

  void evaluateTextFieldChange(){
    bool showCheck = true;
    //Evaluo campo 1
    if(_controller1.text.length > 0){
      if(_controller1.text.length > 5){

      }else{
        showCheck = false;
      }
    }
    //Evaluo campo 2
    //Evaluo campo 3
    //Comparo campos 2 y 3
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
        title: Text('Cambiar contraseña'),
        actions: <Widget>[
          Visibility(
            visible: checkVisible,
            child: InkWell(
              onTap: () {
                makePostChangeName();
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
                        child: Text('CONTRASEÑA ACTUAL', style: TextStyle(fontSize: 16))
                    ),
                    TextField(
                      onChanged: (text) {
                        evaluateTextFieldChange();
                      },
                      controller: _controller1,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        //enabledBorder: OutlineInputBorder(
                        //  borderSide: borderError,
                        //),
                        //focusedBorder: OutlineInputBorder(
                        //  borderSide: borderError,
                        //),
                        hintText: 'Introduce tu contraseña actual',
                        suffixIcon: IconButton(
                          onPressed: () {
                            setState(() {

                              _controller1.clear();
                              checkVisible = false;
                            });
                          },
                          icon: Icon(Icons.clear),
                        ),
                      ),
                    ),
                    Padding(
                      // Izquierda, Arriba, Derecha, Abajo
                        padding: EdgeInsets.fromLTRB(20, 20, 0, 5),
                        child: Text('NUEVA CONTRASEÑA', style: TextStyle(fontSize: 16))
                    ),
                    TextField(
                      onChanged: (text) {
                        evaluateTextFieldChange();
                      },
                      controller: _controller2,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: 'Introduce tu nueva contraseña',
                        suffixIcon: IconButton(
                          onPressed: () {
                            setState(() {
                              _controller2.clear();
                              checkVisible = false;
                            });
                          },
                          icon: Icon(Icons.clear),
                        ),
                      ),
                    ),
                    Padding(
                      // Izquierda, Arriba, Derecha, Abajo
                        padding: EdgeInsets.fromLTRB(20, 20, 0, 5),
                        child: Text('REPITE NUEVA CONTRASEÑA', style: TextStyle(fontSize: 16))
                    ),
                    TextField(
                      onChanged: (text) {
                        evaluateTextFieldChange();
                      },
                      controller: _controller3,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: 'Repite tu nueva contraseña',
                        suffixIcon: IconButton(
                          onPressed: () {
                            setState(() {
                              _controller3.clear();
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
