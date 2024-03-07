import 'package:flutter/material.dart';


Widget largeText ({title , Color color = Colors.white, double textSize = 18.0,FontWeight fontWeight = FontWeight.bold }){
  return Text(title,style: TextStyle(color: color,fontSize: textSize,fontWeight: fontWeight),);
}



Widget normalText ({title , Color color = Colors.white, double textSize = 14.0,FontWeight fontWeight = FontWeight.bold }){
  return Text(title,style: TextStyle(color: color,fontSize: textSize,fontWeight: fontWeight),);
}