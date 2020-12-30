import 'package:flutter/material.dart';

class DiscoverPage extends StatefulWidget {
  DiscoverPage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _DiscoverPageState createState() => _DiscoverPageState();
}

class _DiscoverPageState extends State<DiscoverPage> {

  @override
  void initState() {
    super.initState();
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
              const Text("Jaén", textAlign: TextAlign.center,),
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
