import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../app_localizations.dart';

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

}

