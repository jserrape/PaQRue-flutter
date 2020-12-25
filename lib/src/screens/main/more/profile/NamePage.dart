import 'package:flutter/material.dart';
import 'package:history_maker/src/screens/introduction/location.dart';
import 'package:history_maker/src/screens/login/signup.dart';

class NamePage extends StatefulWidget {
  NamePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _NamePageState createState() => _NamePageState();
}

class _NamePageState extends State<NamePage> {

  var _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xfff1f2f4),
      appBar: AppBar(
        backgroundColor: Colors.orangeAccent,
        title: Text('Tu nombre'),
        actions: <Widget>[
          Padding(
              padding: EdgeInsets.only(right: 20.0),
              child: GestureDetector(
                onTap: () {},
                child: Icon(
                  Icons.check,
                  size: 26.0,
                ),
              )
          ),
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
                        child: Text('NOMBRE',
                            style: TextStyle(fontSize: 16))
                    ),
                    TextField(
                      decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          hintText: 'Introduce tu nombre',
                          suffixIcon: IconButton(
                          onPressed: () => _controller.clear(),
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
