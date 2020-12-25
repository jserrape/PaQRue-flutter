import 'package:flutter/material.dart';
import 'package:history_maker/src/screens/introduction/bluetooth.dart';
import 'package:history_maker/src/screens/introduction/location.dart';
import 'package:history_maker/src/screens/login/signup.dart';
import 'package:history_maker/src/util/Visual.dart';

class MorePage extends StatefulWidget {
  MorePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MorePageState createState() => _MorePageState();
}

class _MorePageState extends State<MorePage> {

  Widget _ListViewWidget() {
    return ListView(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      children: <Widget>[
        Divider(height: 0.1,color: Colors.black38),
        Ink(
          color: Colors.white,
          child: ListTile(
            onTap: () {
              Navigator.of(context).pushNamed('/ProfileScreen');
            },
            leading: Icon(Icons.supervised_user_circle),
            title: Text('Mi perfil'),
            trailing: Icon(Icons.navigate_next),
          ),
        ),
        Divider(height: 0.1,color: Colors.black38),
        Ink(
          color: Colors.white,
          child: ListTile(
            onTap: () {
              Navigator.of(context).pushNamed('/BlogScreen');
            },
            leading: Icon(Icons.description),
            title: Text('Blog'),
            trailing: Icon(Icons.navigate_next),
          ),
        ),
        Divider(height: 0.1,color: Colors.black38),
        Ink(
          color: Colors.white,
          child: ListTile(
            onTap: () {
              Navigator.of(context).pushNamed('/TermsScreen');
            },
            leading: Icon(Icons.done_all),
            title: Text('Términos y condiciones'),
            trailing: Icon(Icons.navigate_next),
          ),
        ),
        Divider(height: 0.1,color: Colors.black38),
        Ink(
          color: Colors.white,
          child: ListTile(
            onTap: () {
              Navigator.of(context).pushNamed('/HelpScreen');
            },
            leading: Icon(Icons.accessible_forward),
            title: Text('Centro de ayuda'),
            trailing: Icon(Icons.navigate_next),
          ),
        ),
        Divider(height: 0.1,color: Colors.black38),
      ],
    );
  }

  Widget _NewParKWidget() {
    return  Container(
      padding: EdgeInsets.symmetric(horizontal: 50),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            (new Visual()).title2(context),
            Padding(
              // Izquierda, Arriba, Derecha, Abajo
                padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
                child: Text('¿Sabes de más parques?',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 15))
            ),
            Padding(
              // Izquierda, Arriba, Derecha, Abajo
                padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                child: Text('Infórmanos de éstos para que podamos publicarlos y todo el mundo los conozca',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 15))
            ),
            Padding(
              // Izquierda, Arriba, Derecha, Abajo
                padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                child: Text(
                  'Saber más >',
                  style: TextStyle(
                      color: Color(0xfff79c4f),
                      fontSize: 15,
                      fontWeight: FontWeight.w600),
                ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    // https://medium.com/comunidad-flutter/decodificando-listview-ad6e8288ef96
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Color(0xfff1f2f4),
      appBar: AppBar(
        backgroundColor: Colors.orangeAccent,
        title: Text('Más'),
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
                    SizedBox(height: height * .05),
                    _ListViewWidget(),
                    SizedBox(height: height * .07),
                    _NewParKWidget(),
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
