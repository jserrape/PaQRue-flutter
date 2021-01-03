import 'dart:convert';

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

  var ciudad = "-";

  ///Establece desde qué punto central va a buscar los parques. Seleccionándolo en el menú se podrá cambiar y elegir otro punto
  void establecerPuntoBusqueda() async {
    SharedPreferencesHelper preferencesHelper = new SharedPreferencesHelper();

    String pos = await preferencesHelper.getUserPosition();
    if(pos == null){ //Si es la primera vez, usará la ubicación actual del usuario
      print("PRIMERA VEZ QUE BUSCO LA UBICACION");
      Position position = await Geolocator().getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
      var lat = position.latitude;
      var long = position.longitude;

      await Geolocator().placemarkFromCoordinates(lat, long).then((result) {
        //TODO ¿qué pasa si no estoy en una ciudad?
        geo.Placemark placeMark = result[0];
        String address = placeMark.locality + ", " + placeMark.country;
        String srtJson = '{"latitud":"$lat","longitud":"$long","adress":"$address"}';
        preferencesHelper.setUserPosition(srtJson); //Guarda las coordenadas y direccion

        setState(() {
          ciudad = address;
        });
      });
    }else{ //Si no es la primera vez la buscará en las preferencias
      print("BUSCO LA UBICACION EN LAS PREFERENCES");
      print(pos);
      var posJson= json.decode(pos);
      print(posJson['latitud']);

      setState(() {
        ciudad = posJson['adress'];
      });
    }



  }

  @override
  void initState() {
    super.initState();
    establecerPuntoBusqueda();
  }

  @override
  Widget build(BuildContext context) {
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
              InkWell(
                child: Text('$ciudad', textAlign: TextAlign.center),
                onTap: () {Navigator.of(context).pushNamed('/MapPositionScreen');},
              ),
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
