import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Visual{

  Widget title2(context) {
    return RichText(
      textAlign: TextAlign.center,
      text: TextSpan(
          text: 'Pa',
          style: GoogleFonts.portLligatSans(
            fontSize: 30,
            fontWeight: FontWeight.w700,
            color: Color(0xffe46b10),
          ),
          children: [
            TextSpan(
              text: 'QR',
              style: TextStyle(color: Colors.black, fontSize: 30),
            ),
            TextSpan(
              text: 'ue',
              style: TextStyle(color: Color(0xffe46b10), fontSize: 30),
            ),
          ]),
    );
  }

  Widget backButton(context) {
    return InkWell(
      onTap: () {
        //Navigator.pop(context);
        Navigator.of(context).pushReplacementNamed('/LoginScreen');
      },
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 10),
        child: Row(
          children: <Widget>[
            Container(
              padding: EdgeInsets.only(left: 0, top: 10, bottom: 10),
              child: Icon(Icons.keyboard_arrow_left, color: Colors.black),
            ),
            Text('Atrás',
                style: TextStyle(fontSize: 12, fontWeight: FontWeight.w500))
          ],
        ),
      ),
    );
  }

}

