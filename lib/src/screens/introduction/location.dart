import 'package:flutter/material.dart';
import 'package:history_maker/src/screens/introduction/camera.dart';
import 'package:history_maker/src/screens/login/signup.dart';

class location extends StatefulWidget {
  location({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _locationState createState() => _locationState();
}

class _locationState extends State<location> {

  Widget _submitButton() {
    return InkWell(
      onTap: () {
        Navigator.of(context).pushReplacementNamed('/CameraScreen');
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
          '¡Estupendo!',
          style: TextStyle(fontSize: 20, color: Colors.white),
        ),
      ),
    );
  }

  Widget _textWidget() {
    return Column(
      children: <Widget>[
        Text(
          'PaQRue hará uso de tu posición GPS para poder mostrarte dónde te encuentras así como tus objetivos',
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
          'Geoposicionamiento',
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
                      image: NetworkImage('https://cdn5.dibujos.net/dibujos/pintados/202023/un-satelite-espacio-11815414.jpg'),
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
