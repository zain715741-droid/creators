// ignore_for_file: deprecated_member_use

import 'package:creater_project/controllers/loginctrl.dart';
import 'package:creater_project/views/login%20page/login_page.dart';
import 'package:creater_project/widgets/custom_textfield.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Signup extends StatefulWidget {
  const Signup({super.key});

  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  final _formkey = GlobalKey<FormState>();

  final emailRegex =
      RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');

  bool showPassword = true;
  bool showConfirmPassword = true;

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
                    color: const Color.fromARGB(
                      255,
                      15,
                      234,
                      132,
                    ).withOpacity(.18),
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
                    color: const Color.fromARGB(
                      255,
                      5,
                      228,
                      38,
                    ).withOpacity(.12),
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
                          ),
                        ],
                      ),

                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [

                          // Icon
                          const CircleAvatar(
                            radius: 42,
                            backgroundColor: Colors.white,
                            child: Icon(
                              Icons.person_add,
                              size: 45,
                              color: Colors.blue,
                            ),
                          ),

                          const SizedBox(height: 20),

                          const Text(
                            "Create Account",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 30,
                              fontWeight: FontWeight.bold,
                            ),
                          ),

                          const SizedBox(height: 8),

                          const Text(
                            "Signup to get started",
                            style: TextStyle(
                              color: Colors.white70,
                              fontSize: 16,
                            ),
                          ),

                          const SizedBox(height: 35),

                          // ================= NAME =================

                          CustomTextField(
                            text: 'text',
                            controller: ctrl.nameCtrl,
                            keyboardType: TextInputType.name,
                            hintText: "Full Name",
                            validator: (value) {
                              if (value == null || value.trim().isEmpty) {
                                return 'Name required';
                              }
                              return null;
                            },
                          ),

                          const SizedBox(height: 20),

                          // ================= EMAIL =================

                          CustomTextField(
                            text: 'text',
                            controller: ctrl.emailCtrl,
                            keyboardType: TextInputType.emailAddress,
                            hintText: "Email",
                            validator: (value) {
                              if (value == null || value.trim().isEmpty) {
                                return 'Email required';
                              }

                              if (!emailRegex.hasMatch(value.trim())) {
                                return 'Sahi email likhein';
                              }

                              return null;
                            },
                          ),

                          const SizedBox(height: 20),

                          // ================= PHONE =================

                          CustomTextField(
                            text: 'text',
                            controller: ctrl.phoneCtrl,
                            keyboardType: TextInputType.phone,
                            hintText: "Phone Number",
                            validator: (value) {
                              if (value == null || value.trim().isEmpty) {
                                return 'Phone number required';
                              }

                              if (value.trim().length < 10) {
                                return 'Valid phone number enter karein';
                              }

                              return null;
                            },
                          ),

                          const SizedBox(height: 20),

                          // ================= CNIC =================

                          CustomTextField(
                            text: 'text',
                            controller: ctrl.cnicCtrl,
                            keyboardType: TextInputType.number,
                            hintText: "CNIC",
                            validator: (value) {
                              if (value == null || value.trim().isEmpty) {
                                return 'CNIC required';
                              }

                              if (value.trim().length != 13) {
                                return 'CNIC must contain 13 digits';
                              }

                              return null;
                            },
                          ),

                          const SizedBox(height: 20),

                          // ================= BLOOD GROUP =================

                          CustomTextField(
                            text: 'text',
                            controller: ctrl.bloodCtrl,
                            keyboardType: TextInputType.text,
                            hintText: "Blood Group (e.g. A+)",
                            validator: (value) {
                              if (value == null || value.trim().isEmpty) {
                                return 'Blood Group required';
                              }

                              return null;
                            },
                          ),

                          const SizedBox(height: 20),

                          // ================= PASSWORD =================

                          CustomTextField(
                            text: 'text',
                            controller: ctrl.passwordCtrl,
                            keyboardType: TextInputType.text,
                            hintText: "Password",
                            obscureText: showPassword,
                            obscuringCharacter: '*',

                            suffixicon: IconButton(
                              icon: Icon(
                                showPassword
                                    ? Icons.visibility_off
                                    : Icons.visibility,
                                color: Colors.white,
                              ),
                              onPressed: () {
                                setState(() {
                                  showPassword = !showPassword;
                                });
                              },
                            ),

                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Password required';
                              }

                              if (value.length < 6) {
                                return 'Password must be at least 6 characters';
                              }

                              return null;
                            },
                          ),

                          const SizedBox(height: 20),

                          // ================= CONFIRM PASSWORD =================

                          CustomTextField(
                            text: 'text',
                            controller: ctrl.confirmPasswordCtrl,
                            keyboardType: TextInputType.text,
                            hintText: "Confirm Password",
                            obscureText: showConfirmPassword,
                            obscuringCharacter: '*',

                            suffixicon: IconButton(
                              icon: Icon(
                                showConfirmPassword
                                    ? Icons.visibility_off
                                    : Icons.visibility,
                                color: Colors.white,
                              ),
                              onPressed: () {
                                setState(() {
                                  showConfirmPassword =
                                      !showConfirmPassword;
                                });
                              },
                            ),

                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Confirm password required';
                              }

                              if (value != ctrl.passwordCtrl.text) {
                                return 'Passwords do not match';
                              }

                              return null;
                            },
                          ),

                          const SizedBox(height: 30),

                          // ================= SIGNUP BUTTON =================

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

                              onPressed: () async {
                                if (_formkey.currentState!.validate()) {
                                  await ctrl.signupbutton();
                                }
                              },

                              child: const Text(
                                'Signup',
                                style: TextStyle(
                                  fontSize: 17,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),

                          const SizedBox(height: 20),

                          // ================= LOGIN =================

                          Row(
                            mainAxisAlignment:
                                MainAxisAlignment.center,

                            children: [

                              const Text(
                                "Already have an account?",
                                style: TextStyle(
                                  color: Colors.white,
                                ),
                              ),

                              TextButton(
                                onPressed: () {
                                  Get.to(() => LoginPage());
                                },

                                child: const Text(
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