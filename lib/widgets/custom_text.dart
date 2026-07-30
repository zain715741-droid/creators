import 'package:flutter/material.dart';
class CustomTextWidget extends StatelessWidget {
  final String text;
  final Color color;
  final double fontSize;
  final FontWeight fontWeight;
  final List<Shadow>? shadows;



  const CustomTextWidget({super.key,
    required this.text,
    required this.color,
   required this.fontSize,
   required this.fontWeight,
   this.shadows, 
});


  @override
  Widget build(BuildContext context) {
    return Text( 
      text,
      textAlign: TextAlign.center,
      style: TextStyle(
        color: color,
        shadows: shadows,
        fontSize: fontSize,
        fontWeight: fontWeight ),
    );
  }
}