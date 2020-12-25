import 'package:flutter/material.dart';
import 'package:history_maker/src/screens/introduction/location.dart';
import 'package:history_maker/src/screens/login/signup.dart';

class ProfilePage extends StatefulWidget {
  ProfilePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {

  Widget _ListViewDetailsWidget() {
    return ListView(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      children: <Widget>[
        Divider(height: 0.1,color: Colors.black38),
        Ink(
          color: Colors.white,
          child: ListTile(
            onTap: () {
              Navigator.of(context).pushNamed('/NameScreen');
            },
            title: Text('Nombre',style: TextStyle(fontWeight: FontWeight.bold)),
            trailing: Text('[null]'),
          ),
        ),
        Divider(height: 0.1,color: Colors.black38),
        Ink(
          color: Colors.white,
          child: ListTile(
            onTap: () {
              //Navigator.of(context).pushNamed('/BlogScreen');
            },
            title: Text('Email',style: TextStyle(fontWeight: FontWeight.bold)),
            trailing: Text('[null]'),
          ),
        ),
        Divider(height: 0.1,color: Colors.black38),
        Ink(
          color: Colors.white,
          child: ListTile(
            onTap: () {
              //Navigator.of(context).pushNamed('/TermsScreen');
            },
            title: Text('País',style: TextStyle(fontWeight: FontWeight.bold)),
            trailing: Text('[null]'),
          ),
        ),
        Divider(height: 0.1,color: Colors.black38),
        Ink(
          color: Colors.white,
          child: ListTile(
            onTap: () {
              //Navigator.of(context).pushNamed('/HelpScreen');
            },
            title: Text('Cambiar contraseña',style: TextStyle(fontWeight: FontWeight.bold)),
            trailing: Icon(Icons.navigate_next),
          ),
        ),
        Divider(height: 0.1,color: Colors.black38),
      ],
    );
  }

  Widget _ListViewSettingsWidget() {
    return ListView(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      children: <Widget>[
        Divider(height: 0.1,color: Colors.black38),
        Ink(
          color: Colors.white,
          child: ListTile(
            onTap: () {
              //Navigator.of(context).pushNamed('/ProfileScreen');
            },
            title: Text('Notificaciones',style: TextStyle(fontWeight: FontWeight.bold)),
            trailing: Icon(Icons.navigate_next),
          ),
        ),
        Divider(height: 0.1,color: Colors.black38),
        Ink(
          color: Colors.white,
          child: ListTile(
            onTap: () {
              //Navigator.of(context).pushNamed('/ProfileScreen');
            },
            title: Text('Privacidad',style: TextStyle(fontWeight: FontWeight.bold)),
            trailing: Icon(Icons.navigate_next),
          ),
        ),
        Divider(height: 0.1,color: Colors.black38),
        Ink(
          color: Colors.white,
          child: ListTile(
            onTap: () {
              //Navigator.of(context).pushNamed('/ProfileScreen');
            },
            title: Text('Idioma',style: TextStyle(fontWeight: FontWeight.bold)),
            trailing: Icon(Icons.navigate_next),
          ),
        ),
        Divider(height: 0.1,color: Colors.black38),
      ],
    );
  }

  Widget _ListViewCloseSessionWidget() {
    return ListView(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      children: <Widget>[
        Divider(height: 0.1,color: Colors.black38),
        Ink(
          color: Colors.white,
          child: ListTile(
            onTap: () {
              //Navigator.of(context).pushNamed('/ProfileScreen');
            },
            title: Text('Cerrar sesión',style: TextStyle(fontWeight: FontWeight.bold,color: Colors.red[300])),
          ),
        ),
        Divider(height: 0.1,color: Colors.black38),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Color(0xfff1f2f4),
      appBar: AppBar(
        backgroundColor: Colors.orangeAccent,
        title: Text('Mi perfil'),
      ),
      body: Container(
        child: Stack(
          children: <Widget>[
            Container(
              child: SingleChildScrollView(
                child: Column(
                  children: <Widget>[
                    SizedBox(height: height * .05),
                    Padding(
                      // Izquierda, Arriba, Derecha, Abajo
                        padding: EdgeInsets.fromLTRB(0, 0, 0, 5),
                        child: Text('DETALLES DE TU CUENTA',
                            style: TextStyle(fontSize: 16))
                    ),
                    _ListViewDetailsWidget(),
                    SizedBox(height: height * .05),
                    Padding(
                      // Izquierda, Arriba, Derecha, Abajo
                        padding: EdgeInsets.fromLTRB(0, 0, 0, 5),
                        child: Text('AJUSTES',
                            style: TextStyle(fontSize: 16))
                    ),
                    _ListViewSettingsWidget(),
                    SizedBox(height: height * .05),
                    _ListViewCloseSessionWidget(),
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
