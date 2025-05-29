import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:google_fonts/google_fonts.dart';
warningtext(String normaltext, Color textcolor){
  return  Text(normaltext, textAlign: TextAlign.center, style: GoogleFonts.manrope(
      textStyle: TextStyle(
        fontWeight: FontWeight.w500, fontSize: 12.5, color: textcolor, height: 3
      )
  ),);
}

headingtext(String normaltext, Color textcolor){
  return Text(normaltext, textAlign: TextAlign.center, style: GoogleFonts.dmSans(
      textStyle: TextStyle(
          fontWeight: FontWeight.w700, fontSize: 39,letterSpacing: 0, color: textcolor,
      )
  ),);
}