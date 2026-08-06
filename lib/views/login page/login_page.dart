// import 'dart:js_interop';
import 'package:creater_project/controllers/loginctrl.dart';
import 'package:creater_project/controllers/splash_ctrl.dart';
import 'package:creater_project/utils/app_images.dart';
import 'package:creater_project/views/landing_page/landing_page.dart';
import 'package:creater_project/views/signup/signup.dart';
import 'package:creater_project/widgets/custom_text.dart' show CustomTextWidget;
import 'package:creater_project/widgets/custom_textfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';


class LoginPage extends StatefulWidget {
   LoginPage({super.key});
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

body:SafeArea(
  child: Container(
    width: double.infinity,
    height: double.infinity,
    decoration: BoxDecoration(
      image:DecorationImage( image: AssetImage(AppImages.aabb),fit: BoxFit.fill),
    ),
    child: Form(
      key: _formkey,
      child: SingleChildScrollView(
        
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
        Padding(
          padding: const EdgeInsets.only(top:180, left: 30,right: 30),
            child: SizedBox(height:70,child: CustomTextWidget(text: 'Login Page' , color: Colors.blueAccent, fontSize: 40, fontWeight:FontWeight.bold,
            shadows: [
              Shadow(
                color: Colors.white,
                offset: Offset(2, 2),
                blurRadius: 10,
  
              )
            ],))),
      
        
        SizedBox(width: MediaQuery.of(context).size.height,
          child: Padding(
            padding: const EdgeInsets.only(top:60, left: 30,right: 30,),
            child: Column(
              // mainAxisAlignment: MainAxisAlignment.center,
              // crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: CustomTextField(text: 'text', controller: emailctrl, keyboardType:TextInputType.text, hintText: 'Email',
                  validator: (value) { 
                    if(value == null || value.isEmpty){
                    return('Email required');
                  }
                  if (!emailRegex.hasMatch(value)) {
                    return 'Sahi email likhein';
                   }
                    return null;
                  },),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0), 
                  child: CustomTextField(text: 'text', controller: passwordctrl, keyboardType: TextInputType.text, hintText: 'Password',suffixicon: InkWell(
                    onTap:() {
                      setState(() {
                        show =! show;
                      });
                    },
                    
                    child: Icon(Icons.remove_red_eye)),obscureText: show,obscuringCharacter: '*',
               validator: (value) {
                 if(value == null || value.isEmpty){
                    return('Password Required');
                  }
                  if (value.length <= 6){
                    return ('Password Must be up to 6 characters');
                  }
                  return null;
                 
               }, )),
            
            
                  Padding(
                    padding: const EdgeInsets.only(left: 200,top: 20),
                    child: ElevatedButton( 
                      style: ElevatedButton.styleFrom(backgroundColor:Colors.deepOrangeAccent,foregroundColor: Colors.white),
                      onPressed:(){
                      HapticFeedback.vibrate();
                      final enteredEmail = emailctrl.text;
                      final enteredPassword = passwordctrl.text;
                       
                      if (_formkey.currentState!.validate()) {
                      ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Login Successfully')),
              );
              loginctrl.loginbutton(enteredEmail, enteredPassword);
                      setState((
                      ) {
                         
                      });
                         emailctrl.clear();
                         passwordctrl.clear();
                        }
                    
                    }
                    , child: Text('Login')),
                  ),
                  SizedBox(width: 250,
                    child: Padding(
                      padding: const EdgeInsets.only(top: 50),
                      child: ElevatedButton( 
                        style: ElevatedButton.styleFrom(backgroundColor:Colors.deepOrangeAccent,foregroundColor: Colors.white),
  
                        onPressed:(){
                        setState(()  {
                             Navigator.push(context,MaterialPageRoute(builder: (context)=> Signup()));
                          });
                        }
                        
                        
                        , child: Text('Create a new Account',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),)),
                    ),
                  ),
              ],
            ),
          ),
        )
          ],
              ),
      ),
    ),
  ),
),
    );
  }
}