import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapPosition extends StatefulWidget {
  @override
  _MapPositionState createState() => _MapPositionState();
}

class _MapPositionState extends State<MapPosition> {

  MapType _defaultMapType = MapType.normal;
  CameraPosition _initialPosition = CameraPosition(target: LatLng(26.8206, 30.8025));
  Completer<GoogleMapController> _controller = Completer();
  LatLng _lastMapPosition;

  void _getUserLocation() async {
    Position position = await Geolocator().getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
    print('position.latitude');
    print(position.latitude);
    print(position.longitude);
  }

  void _changeMapType() {
    setState(() {
      _defaultMapType = _defaultMapType == MapType.normal ? MapType.satellite : MapType.normal;
    });
  }

  void _onMapCreated(GoogleMapController controller) {
    _controller.complete(controller);
  }

  @override
  void initState() {
    super.initState();
    _getUserLocation();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(100.0),
          child: AppBar(
            automaticallyImplyLeading: false, // hides leading widget
            flexibleSpace: FlexibleSpaceBar(
              title:  Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisAlignment: MainAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  InkWell(
                    child: Text('Selecciona la ubicación desde la que buscar', textAlign: TextAlign.center),
                  ),
                ],
              ),
              centerTitle: true,
            ),
          )
      ),
      body: Stack(
          children: <Widget>[
            GoogleMap(
              mapType: MapType.terrain, // https://mapstyle.withgoogle.com/
              compassEnabled:false, // desactiva la brujula
              myLocationEnabled: true,
              //myLocationButtonEnabled: false, // mi posicion
              zoomControlsEnabled: false, // Botones de zoom
              //zoomGesturesEnabled: false, // Desactivar poder hacer zoom por gestos
              onMapCreated: _onMapCreated,
              initialCameraPosition: _initialPosition,
              onCameraMove: _onCameraMove,
            ),

            Align(
              alignment: Alignment.bottomCenter,

              child:  Container(
                padding: EdgeInsets.symmetric(vertical: 40,horizontal:MediaQuery.of(context).size.width*0.25),
                //padding: EdgeInsets.symmetric(vertical: 40,horizontal: 100),
                color: Colors.white,
                child: Row(
                  children: <Widget>[
                    Flexible(
                      child: _submitButton(),
                    ),
                  ],
                ),
              )
            ),
          ]),
    );
  }

  void _onCameraMove(CameraPosition position) {
    print('camera move');
    print(position.target);
    _lastMapPosition = position.target;
  }

  Widget _submitButton() {
    return InkWell(
      onTap: () {
        print(_lastMapPosition);
      },

      child: Container(

        width: MediaQuery.of(context).size.width*0.5,
        padding: EdgeInsets.symmetric(vertical: 15),
        //alignment: FractionalOffset.bottomCenter,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(5)),
            gradient: LinearGradient(
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
                colors: [Color(0xfffbb448), Color(0xfff7892b)]
            )),
        child: Text(
          'Buscar',
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 20, color: Colors.white),
        ),
      ),
    );
  }
}