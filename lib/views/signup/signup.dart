import 'package:creater_project/utils/app_images.dart';
import 'package:creater_project/views/login%20page/login_page.dart' show LoginPage;
import 'package:creater_project/widgets/custom_text.dart' show CustomTextWidget;
import 'package:creater_project/widgets/custom_textfield.dart' show CustomTextField;
import 'package:flutter/material.dart';

class Signup extends StatefulWidget {
  const Signup({super.key});

  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  final TextEditingController emailctrl=TextEditingController();
  final TextEditingController passwordctrl=TextEditingController();
  final TextEditingController phonectrl=TextEditingController();
  final TextEditingController bloodctrl=TextEditingController(); 
  final _formkey=GlobalKey<FormState>();
  final emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
  bool show=true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
backgroundColor:  Colors.cyanAccent,
      // appBar: AppBar(title: Text(''),),

body:Container(
  width: double.infinity,
  height: double.infinity,
  decoration: BoxDecoration(
    image:DecorationImage( image: AssetImage(AppImages.aabb),fit: BoxFit.fill),),
  child: Form(
    key: _formkey,
    child: SingleChildScrollView(
      
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
      const Padding(
        padding: EdgeInsets.only(top:150, left: 30,right: 30),
          child: SizedBox(height:60,child: CustomTextWidget(text: 'Signup Page' , color: Colors.blueAccent, fontSize: 30, fontWeight:FontWeight.bold))),
    
      
      SizedBox(width: MediaQuery.of(context).size.height,
        child: Padding(
          padding: const EdgeInsets.only(top:40, left: 30,right: 30,),
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
                  
                  child: const Icon(Icons.remove_red_eye)),obscureText: show,obscuringCharacter: '*',
                  validator: (value) {
                 if(value == null || value.isEmpty){
                    return('Password Required');
                  }
                  if (value.length <= 6){
                    return ('Password Must be up to 6 characters');
                  }
                  return null;
                 
               },
              )),
                
                
                Padding(
                padding: const EdgeInsets.all(8.0), 
                child: CustomTextField(text: 'text', controller: phonectrl, keyboardType: TextInputType.number, hintText: 'Phone Number',         
                )),
               
               
                Padding(
                padding: const EdgeInsets.all(8.0), 
                child: CustomTextField(text: 'text', controller: bloodctrl, keyboardType: TextInputType.text, hintText: 'Blood Group',
              )),
          
          
                Padding(
                  padding: const EdgeInsets.only(left: 200,top: 20),
                  child: ElevatedButton( onPressed:(){
                                       
                       if (_formkey.currentState!.validate()) {
                
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text('Signup Successfully')),);
                    setState(() {
                       Navigator.push(context,MaterialPageRoute(builder: (context)=> LoginPage( )));
                    });
                      
                      }
                  
                  }
                  , child: Text('Signup')),
                ),
                    
            ],
          ),
        ),
      ),
        ],
    ),
        ),
  ),
),
        );

  }
}
     
     
  