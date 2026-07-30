import 'package:flutter/material.dart';
class CustomWidget extends StatelessWidget {
  const CustomWidget({super.key, required this.height, required this.width,  this.color, this.child, required this.ontap, });
  final double height;
  final double width;
  final Color? color;
  final Widget? child;
  final Function() ontap;
    @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: ontap,
      
      child: Container( height: height, width: width,color: color ?? Colors.red,child: child ,));
  }
}