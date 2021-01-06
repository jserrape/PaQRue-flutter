import 'package:flutter/material.dart';

import '../../../../app_localizations.dart';


class ParkProperties extends StatefulWidget {
  ParkProperties({@required this.id}) : super();

  final int id;

  @override
  _ParkPropertiesState createState() => _ParkPropertiesState(id);
}

class _ParkPropertiesState extends State<ParkProperties> {

  final int id;

  _ParkPropertiesState( this.id): super();

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

                    const Image(
                      image: NetworkImage('https://image.freepik.com/vector-gratis/codigo-qr-dibujos-animados-planos-pantalla-telefono-inteligente-o-telefono-movil_101884-726.jpg'),
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
