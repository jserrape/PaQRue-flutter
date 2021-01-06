import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:history_maker/src/screens/main/more/ParkProperties.dart';
import 'package:history_maker/src/util/SharedPreferencesHelper.dart';
import 'package:history_maker/src/model/Park.dart';

import 'package:geolocator/geolocator.dart' as geo;

import 'package:http/http.dart' as http;
import 'package:history_maker/src/services/ParkServices.dart' as ParkServices;

class DiscoverPage extends StatefulWidget {
  DiscoverPage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _DiscoverPageState createState() => _DiscoverPageState();
}

class _DiscoverPageState extends State<DiscoverPage> {

  var ciudad = "-";
  double width;
  List <Widget> items = [];

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

  Future<http.Response> solicitarParquesPetition(Position position) async {
    //final response = await ParkServices.getLimit_distanceParks(position);
    final response = await ParkServices.getAllParks();
    return response;
  }

  void solicitarParques() async {
    print("Solicito los parques");
    Position position = await Geolocator().getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
    http.Response response = await solicitarParquesPetition(position);
    //print((jsonDecode(response.body))['element']);
    var allParks = (jsonDecode(response.body))['element']; //TODOS
    print(allParks.length );
    List <Widget> itemsAux = [];
    int i=0;

    for (var parkJson in allParks) {
      if(i==0){
        items.add(null);
        setState(() {
          items = itemsAux;
        });
      }
      Park parkObj = new Park(parkJson);
      items.add(cardParkNew(parkObj));
      setState(() {
        items = itemsAux;
      });
      i+=1;
    }
  }

  @override
  void initState() {
    super.initState();
    establecerPuntoBusqueda();
    solicitarParques();
  }

  @override
  Widget build(BuildContext context) {
    width = MediaQuery.of(context).size.width;
    return Scaffold(
        backgroundColor: Color(0xfff1f2f4),
        appBar: AppBar(
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
        body: SingleChildScrollView(
            child: Container(
              child: Column(
                children: <Widget>[
                  _courseList()
                ],
              ),
            )
        )
    );
  }

  Widget _courseList() {
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Column(
        children: items,
      ),
    );
  }

  Widget cardParkNew(Park parkObj) {
    return Center(
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(8.0))),
        child: InkWell(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => ParkProperties(id: parkObj.id),
              ),
            );
          },
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,  // add this
            children: <Widget>[
              ClipRRect(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(8.0),
                  topRight: Radius.circular(8.0),
                ),
                child: Image.network(
                    parkObj.imagenLista,
                    height: 120,
                    fit:BoxFit.fill
                ),
              ),
              ListTile(
                visualDensity: VisualDensity(horizontal: 0, vertical: -3),
                title: Text(parkObj.nombre),
                subtitle: Text(parkObj.horario + ' | ' + parkObj.distancia.toString() + ' km'),
                trailing: Icon(Icons.favorite),
              ),
            ],
          ),
        ),
      ),
    );
  }


  Widget _circularContainer(double height, Color color,
      {Color borderColor = Colors.transparent, double borderWidth = 2}) {
    return Container(
      height: height,
      width: height,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: color,
        border: Border.all(color: borderColor, width: borderWidth),
      ),
    );
  }
}
