import 'package:flutter/material.dart';

import 'text_widets.dart';





class CustomButton extends StatelessWidget {
   CustomButton({this.height = 0.05,this.width =0.6,required this.title,required this.onTap});

  final double height ;
  final double width ;
  final String title ;
  final VoidCallback onTap ;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(8),
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: Colors.deepOrange,
        ),
        height: MediaQuery.sizeOf(context).height * height,
        width:MediaQuery.sizeOf(context).width * width,
        child: Center(child: normalText(title: title)),
      ),
    );
  }
}
