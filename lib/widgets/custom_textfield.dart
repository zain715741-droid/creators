import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
final TextEditingController? controller;
final String? text;
final Color? color;
final TextInputType? keyboardType;
final String? hintText;
final String? Function(String?)? validator;
final Widget? suffixicon;
final bool? obscureText;
final String? obscuringCharacter;


  const CustomTextField({super.key, required this.text, this.color,required this.keyboardType, this.validator, required this.controller, this.suffixicon, this.obscureText, this.obscuringCharacter,required this.hintText, });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
                          keyboardType: keyboardType,
                                controller: controller,                            
                                cursorColor: color,
                                validator: validator,
                                obscureText: obscureText??false,
                                obscuringCharacter: obscuringCharacter??'*',
                                decoration: InputDecoration(
                                  
                                  hintText: hintText,
                                  suffixIcon:suffixicon  ,                          
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(20),
                                  ),                          
                                ),
                              );
  }
}