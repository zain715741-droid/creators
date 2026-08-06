// import 'dart:js_interop';
// ignore_for_file: deprecated_member_use

import 'package:creater_project/controllers/loginctrl.dart';
import 'package:creater_project/views/signup/signup.dart';
import 'package:creater_project/widgets/custom_textfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';


class LoginPage extends StatefulWidget {
   const LoginPage({super.key});
  // final SplashCtrl ctrl = Get.put(SplashCtrl());
  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController emailctrl=TextEditingController();
  final TextEditingController passwordctrl=TextEditingController();
  final emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');

  final _formkey = GlobalKey<FormState>();
 
  bool show=true;

  @override
  Widget build(BuildContext context,) {
      final Loginctrl loginctrl = Get.put(Loginctrl());

    return Scaffold(
      //  backgroundColor:  Colors.cyanAccent,
      // appBar: AppBar(title: Text(''),),

body: SafeArea(
  child: Container(
    width: double.infinity,
    height: double.infinity,
 decoration: const BoxDecoration(
  gradient: LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [
      Color(0xff667EEA),
      Color(0xff764BA2),
    ],
  ),
),
child: Stack(
  children: [

    // Top Right Glow
    Positioned(
      top: -120,
      right: -80,
      child: Container(
        width: 280,
        height: 280,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.white.withOpacity(.15),
        ),
      ),
    ),

    // Bottom Left Glow
    Positioned(
      bottom: -140,
      left: -100,
      child: Container(
        width: 320,
        height: 320,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.pinkAccent.withOpacity(.18),
        ),
      ),
    ),

    // Middle Glow
    Positioned(
      top: 220,
      left: -60,
      child: Container(
        width: 170,
        height: 170,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.cyanAccent.withOpacity(.12),
        ),
      ),
    ),

    Center(
      child: SingleChildScrollView(
        padding: const EdgeInsets.all(25),
        child: Form(
          key: _formkey,
          child: Container(
            padding: const EdgeInsets.all(25),
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(.18),
              borderRadius: BorderRadius.circular(30),
              border: Border.all(
                color: Colors.white.withOpacity(.25),
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(.18),
                  blurRadius: 30,
                  offset: const Offset(0, 15),
                )
              ],
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [

                CircleAvatar(
                  radius: 42,
                  backgroundColor: Colors.white,
                  child: Icon(
                    Icons.person,
                    size: 45,
                    color: Colors.blue,
                  ),
                ),

                SizedBox(height: 20),

                Text(
                  "Welcome Back",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                SizedBox(height: 8),

                Text(
                  "Login to continue",
                  style: TextStyle(
                    color: Colors.white70,
                    fontSize: 16,
                  ),
                ),

                SizedBox(height: 35),

                // Email Field

                Container( decoration: BoxDecoration(
    borderRadius: BorderRadius.circular(18),
    boxShadow: [
      BoxShadow(
        color: Colors.black.withOpacity(0.12),
        blurRadius: 18,
        offset: const Offset(0, 8),
      ),
    ],
  ),
                  child: CustomTextField(
                    text: 'text',
                    controller: emailctrl,
                    keyboardType: TextInputType.emailAddress,
                    hintText: "Email",
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Email Required";
                      }
                      if (!emailRegex.hasMatch(value)) {
                        return "Enter Valid Email";
                      }
                      return null;
                    },
                  ),
                ),

                SizedBox(height: 20),

                // Password

                Container( decoration: BoxDecoration(
    borderRadius: BorderRadius.circular(18),
    boxShadow: [
      BoxShadow(
        color: Colors.black.withOpacity(0.12),
        blurRadius: 18,
        offset: const Offset(0, 8),
      ),
    ],
  ),
                  child: CustomTextField(
                    text: 'text',
                    controller: passwordctrl,
                    hintText: "Password",
                    obscureText: show,
                    obscuringCharacter: "*",
                    suffixicon: IconButton(
                      icon: Icon(
                        show
                            ? Icons.visibility_off
                            : Icons.visibility,
                      ),
                      onPressed: () {
                        setState(() {
                          show = !show;
                        });
                      },
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Password Required";
                      }
                  
                      if (value.length <= 6) {
                        return "Minimum 6 Characters";
                      }
                  
                      return null;
                    }, keyboardType: null,
                  ),
                ),

                SizedBox(height: 30),

                SizedBox(
                  width: double.infinity,
                  height: 55,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.orange,
                      shape: RoundedRectangleBorder(
                        borderRadius:
                            BorderRadius.circular(15),
                      ),
                    ),
                    onPressed: () {
                      HapticFeedback.vibrate();

                      final enteredEmail = emailctrl.text;
                      final enteredPassword =
                          passwordctrl.text;

                      if (_formkey.currentState!
                          .validate()) {
                        loginctrl.loginbutton(
                          enteredEmail,
                          enteredPassword,
                        );

                        emailctrl.clear();
                        passwordctrl.clear();
                      }
                    },
                    child: Text(
                      "LOGIN",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),

                SizedBox(height: 20),

                Row(
                  mainAxisAlignment:
                      MainAxisAlignment.center,
                  children: [

                    Text(
                      "Don't have an account?",
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),

                    TextButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => Signup(),
                          ),
                        );
                      },
                      child: Text(
                        "Sign Up",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.orange,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    ),
  ]
  ),
  ),
    )
    );
  }
}
