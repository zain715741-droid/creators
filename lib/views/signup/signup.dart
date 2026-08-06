// ignore_for_file: deprecated_member_use

import 'package:creater_project/controllers/loginctrl.dart';
import 'package:creater_project/views/login%20page/login_page.dart' show LoginPage;
import 'package:creater_project/widgets/custom_textfield.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Signup extends StatefulWidget {
  const Signup({super.key});

  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  // final TextEditingController phonectrl=TextEditingController();
  // final TextEditingController bloodctrl=TextEditingController();
  final _formkey = GlobalKey<FormState>();
  final emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
  bool show = true;

  final Loginctrl ctrl = Get.put(Loginctrl());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                    color: const Color.fromARGB(255, 15, 234, 132).withOpacity(.18),
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
                    color: const Color.fromARGB(255, 5, 228, 38).withOpacity(.12),
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
                              Icons.person_add,
                              size: 45,
                              color: Colors.blue,
                            ),
                          ),

                          SizedBox(height: 20),

                          Text(
                            "Create Account",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 30,
                              fontWeight: FontWeight.bold,
                            ),
                          ),

                          SizedBox(height: 8),

                          Text(
                            "Signup to get started",
                            style: TextStyle(
                              color: Colors.white70,
                              fontSize: 16,
                            ),
                          ),

                          SizedBox(height: 35),

                          // Email Field
                          Container(
                            decoration: BoxDecoration(
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
                              controller: ctrl.ctrl1,
                              keyboardType: TextInputType.emailAddress,
                              hintText: "Email",
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Email required';
                                }
                                if (!emailRegex.hasMatch(value)) {
                                  return 'Sahi email likhein';
                                }
                                return null;
                              },
                            ),
                          ),

                          SizedBox(height: 20),

                          // Password
                          Container(
                            decoration: BoxDecoration(
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
                              controller: ctrl.ctrl2,
                              keyboardType: TextInputType.text,
                              hintText: "Password",
                              obscureText: show,
                              obscuringCharacter: '*',
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
                                  return ('Password Required');
                                }
                                if (value.length <= 6) {
                                  return ('Password Must be up to 6 characters');
                                }
                                return null;
                              },
                            ),
                          ),

                          // Padding(
                          //   padding: const EdgeInsets.all(8.0),
                          //   child: CustomTextField(text: 'text', controller: phonectrl, keyboardType: TextInputType.number, hintText: 'Phone Number',
                          // )),

                          // Padding(
                          //   padding: const EdgeInsets.all(8.0),
                          //   child: CustomTextField(text: 'text', controller: bloodctrl, keyboardType: TextInputType.text, hintText: 'Blood Group',
                          // )),

                          SizedBox(height: 30),

                          SizedBox(
                            width: double.infinity,
                            height: 55,
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.orange,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(15),
                                ),
                              ),
                              onPressed: () {
                                ctrl.signupbutton();

                                if (_formkey.currentState!.validate()) {
                                  // ScaffoldMessenger.of(context).showSnackBar(
                                  //   const SnackBar(content: Text('Signup Successfully')),);
                                  setState(() {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => LoginPage(),
                                      ),
                                    );
                                  });
                                }
                              },
                              child: Text('Signup'),
                            ),
                          ),

                          SizedBox(height: 20),

                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "Already have an account?",
                                style: TextStyle(
                                  color: Colors.white,
                                ),
                              ),
                              TextButton(
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (_) => LoginPage(),
                                    ),
                                  );
                                },
                                child: Text(
                                  "Login",
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
            ],
          ),
        ),
      ),
    );
  }
}