import 'package:flutter/material.dart';
import 'package:history_maker/src/util/SharedPreferencesHelper.dart';


class LanguagePage extends StatefulWidget {
  LanguagePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _LanguagePageState createState() => _LanguagePageState();
}

class _LanguagePageState extends State<LanguagePage> {

  String lang = "ES";

  final TextStyle bold = new TextStyle(fontWeight: FontWeight.bold);
  final TextStyle noBold = new TextStyle();

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) async {
      lang = await _readLanguage();
    });
  }

  static _readLanguage() async {
    SharedPreferencesHelper preferencesHelper = new SharedPreferencesHelper();
    return preferencesHelper.getAppLanguage();
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
            title: Text('Español', style: lang == 'ES' ? bold : noBold),
          ),
        ),
        Divider(height: 0.1,color: Colors.black38),
        Ink(
          color: Colors.white,
          child: ListTile(
            onTap: () {
              //Navigator.of(context).pushNamed('/ProfileScreen');
            },
            title: Text('Inglés'),
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
                    _ListViewSettingsWidget(),
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

