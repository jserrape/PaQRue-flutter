import 'package:flutter/material.dart';
import 'package:history_maker/app_localizations.dart';
import 'package:history_maker/src/util/SharedPreferencesHelper.dart';

class bluetooth extends StatefulWidget {
  bluetooth({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _bluetoothState createState() => _bluetoothState();
}

class _bluetoothState extends State<bluetooth> {

  Widget _submitButton() {
    return InkWell(
      onTap: () {
        _savePreference();
        Navigator.of(context).pushReplacementNamed('/LoginScreen');
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
          AppLocalizations.of(context).translate('bluetooth_button'),
          style: TextStyle(fontSize: 20, color: Colors.white),
        ),
      ),
    );
  }

  _savePreference() async {
    SharedPreferencesHelper preferencesHelper = new SharedPreferencesHelper();
    preferencesHelper.setShowIntroductionScreens(false);

    var value = await preferencesHelper.getShowIntroductionScreens();

    print(value);
  }

  Widget _textWidget() {
    return Column(
      children: <Widget>[
        Text(
          AppLocalizations.of(context).translate('bluetooth_text'),
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
          AppLocalizations.of(context).translate('bluetooth_title'),
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
                      image: NetworkImage('https://fscomps.fotosearch.com/compc/CSP/CSP365/bluetooth-icono-dibujo__k35650213.jpg'),
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
