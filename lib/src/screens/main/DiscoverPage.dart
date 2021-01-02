import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:history_maker/src/util/SharedPreferencesHelper.dart';

import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart' as geo;

class DiscoverPage extends StatefulWidget {
  DiscoverPage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _DiscoverPageState createState() => _DiscoverPageState();
}

class _DiscoverPageState extends State<DiscoverPage> {

  ///Establece desde qué punto central va a buscar los parques. Seleccionándolo en el menú se podrá cambiar y elegir otro punto
  void establecerPuntoBusqueda() async {
    SharedPreferencesHelper preferencesHelper = new SharedPreferencesHelper();

    String pos = await preferencesHelper.getUserPosition();
    if(pos == null){ //Si es la primera vez, usará la ubicación actual del usuario
      Position position = await Geolocator().getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
      print('-Coordenadas:');
      print(position.latitude);
      print(position.longitude);

      await Geolocator().placemarkFromCoordinates(position.latitude, position.longitude).then((result) {
        geo.Placemark placeMark = result[0];

        String locality = placeMark.locality;
        String country = placeMark.country;
        String address = "${locality}, ${country}";
        print(address);
      });
    }else{ //Si no es la primera vez la buscará en las preferencias

    }



  }

  @override
  void initState() {
    super.initState();
    establecerPuntoBusqueda();
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Color(0xfff1f2f4),
      appBar: AppBar(
        //title: Text('Title 1'),
        centerTitle: true,
        flexibleSpace: FlexibleSpaceBar(
          title:  Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              const Text("Posición actual", textAlign: TextAlign.center,),
              const Text("A menos de 3Km", style: TextStyle(fontSize: 12.0),textAlign: TextAlign.center,),
            ],
          ),
          centerTitle: true,
        ),
        backgroundColor: Colors.orangeAccent,
      ),
      body: Container(
        child: Stack(
          children: <Widget>[
            Container(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[

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
