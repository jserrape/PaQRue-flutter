import 'package:flutter/material.dart';
import 'package:history_maker/src/screens/introduction/careful.dart';

class welcome extends StatefulWidget {
  welcome({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _welcomeState createState() => _welcomeState();
}

class _welcomeState extends State<welcome> {

  Widget _submitButton() {
    return InkWell(
      onTap: () {
        Navigator.of(context).pushReplacementNamed('/CarefulScreen');
      },
      child: Container(
        width: MediaQuery.of(context).size.width,
        padding: EdgeInsets.symmetric(vertical: 15),
        alignment: FractionalOffset.bottomCenter,
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
          '¡Qué ganas de empezar!',
          style: TextStyle(fontSize: 20, color: Colors.white),
        ),
      ),
    );
  }

  Widget _textWidget() {
    return Column(
      children: <Widget>[
        Text(
          'Hay decenas de parques que... Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s',
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),
        ),
        SizedBox(
          height: 20,
        ),
      ],
    );
  }

  Widget _titleWidget() {
    return Column(
      children: <Widget>[
        Text(
          '¡Bienvenido!',
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 30),
        ),
        SizedBox(
          height: 20,
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Center(
        child: Column(
          children: <Widget>[
            Container(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    SizedBox(height: height * .1),
                    _titleWidget(),
                    //TODO PUT THE LOCAL IMAGE
                    const Image(
                      image: NetworkImage('https://image.winudf.com/v2/image/bW9saWF0YXN0dWRpby5yZW5kZXJ3b3JsZF9pY29uXzlndmtyZXVp/icon.png?w=170&fakeurl=1'),
                    ),
                    SizedBox(
                      height: 50,
                    ),
                    _textWidget(),
                  ],
                ),
              ),
            ),
            Expanded(
              child: Container(
                //The empty space between the text and the button
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: SingleChildScrollView(
                child: Column(
                  children: <Widget>[
                    _submitButton(),
                    SizedBox(
                      height: 50,
                    ),
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
