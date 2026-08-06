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

  const CustomTextField({
    super.key,
    required this.text,
    this.color,
    required this.keyboardType,
    this.validator,
    required this.controller,
    this.suffixicon,
    this.obscureText,
    this.obscuringCharacter,
    required this.hintText,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      keyboardType: keyboardType,
      validator: validator,
      obscureText: obscureText ?? false,
      obscuringCharacter: obscuringCharacter ?? '*',
      cursorColor: const Color(0xff667EEA),

      style: const TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w500,
        color: Colors.black87,
      ),

      decoration: InputDecoration(
        hintText: hintText,

        hintStyle: TextStyle(
          color: Colors.grey.shade500,
          fontSize: 15,
        ),

        filled: true,
        fillColor: Colors.white,

        contentPadding: const EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 18,
        ),

        suffixIcon: suffixicon,

        prefixIcon: hintText == "Email"
            ? const Icon(
                Icons.email_outlined,
                color: Color(0xff667EEA),
              )
            : hintText == "Password"
                ? const Icon(
                    Icons.lock_outline,
                    color: Color(0xff667EEA),
                  )
                : null,

        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(18),
          borderSide: BorderSide(
            color: Colors.grey.shade300,
            width: 1.5,
          ),
        ),

        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(18),
          borderSide: const BorderSide(
            color: Color(0xff667EEA),
            width: 2.2,
          ),
        ),

        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(18),
          borderSide: const BorderSide(
            color: Colors.red,
            width: 2,
          ),
        ),

        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(18),
          borderSide: const BorderSide(
            color: Colors.red,
            width: 2,
          ),
        ),
      ),
    );
  }
}



















// import 'package:flutter/material.dart';

// class CustomTextField extends StatelessWidget {
// final TextEditingController? controller;
// final String? text;
// final Color? color;
// final TextInputType? keyboardType;
// final String? hintText;
// final String? Function(String?)? validator;
// final Widget? suffixicon;
// final bool? obscureText;
// final String? obscuringCharacter;


//   const CustomTextField({super.key, required this.text, this.color,required this.keyboardType, this.validator, required this.controller, this.suffixicon, this.obscureText, this.obscuringCharacter,required this.hintText, });

//   @override
//   Widget build(BuildContext context) {
//     return TextFormField(
//                           keyboardType: keyboardType,
//                                 controller: controller,                            
//                                 cursorColor: color,
//                                 validator: validator,
//                                 obscureText: obscureText??false,
//                                 obscuringCharacter: obscuringCharacter??'*',
//                                 decoration: InputDecoration(
                                  
//                                   hintText: hintText,
//                                   suffixIcon:suffixicon  ,                          
//                                   border: OutlineInputBorder(
//                                     borderRadius: BorderRadius.circular(20),
//                                   ),                          
//                                 ),
//                               );
//   }
// }