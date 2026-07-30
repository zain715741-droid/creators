// import 'dart:async';
// import 'package:creater_project/views/landing_page/landing_page.dart';
// import 'package:creater_project/widgets/custom_text.dart' show CustomTextWidget;
// import 'package:creater_project/widgets/custom_textfield.dart';
// import 'package:flutter/material.dart';

// class Newscreen extends StatefulWidget {
//   const Newscreen({super.key});

//   @override
//   State<Newscreen> createState() => _NewscreenState();
// }

// class _NewscreenState extends State<Newscreen> {

//  bool show=true;
//   final TextEditingController nameController =TextEditingController();
//  final TextEditingController passwordController =TextEditingController();
//  final TextEditingController emailController =TextEditingController();
//   final _formKey = GlobalKey<FormState>(); 
//   String name = 'Enter Name';
//   String password = 'Password'; 
//   String email = 'Enter Email';
//     @override
//     void dispose() {
//     nameController.dispose();
//     emailController.dispose();
//     passwordController.dispose();
//     super.dispose();
//   }
//   @override
//   Widget build(BuildContext context,) {
//     return Scaffold(

// appBar: AppBar(title: Text('Login Page',style: TextStyle(color: Colors.orangeAccent,fontWeight: FontWeight.bold),),
// backgroundColor: Colors.tealAccent,
//    ),
    
//    body: SingleChildScrollView(
//      child: Form(
//       key:_formKey,
//        child: Padding(
//          padding: const EdgeInsets.all(10.0),
//          child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           crossAxisAlignment: CrossAxisAlignment.center,
//                    children: [
         
//                     Center(
//                       child: CustomTextWidget(text: 'Login page', color: Colors.blue, fontSize: 20, fontWeight:FontWeight.bold ,
//                         ),
//                     ),
                   
//                    SizedBox(width: 200, child: CustomTextField(text: name,hintText: 'Enter Name', color:Colors.deepOrange,keyboardType: TextInputType.name,validator:(value) {
//                     if(value == null || value.isEmpty){
//                       return('Enter the Name');
//                     }
//                      return null;
//                    }, controller:nameController, )),
                  
//          Column(
//           children: [
                   
//                    SizedBox(width: 200, child: CustomTextField(text: email, color:Colors.blueAccent,keyboardType: TextInputType.emailAddress, hintText: 'Enter Email',
//                    validator: (value) {
                     
//                    if(value == null || value.isEmpty){
//                       return('Enter your email');
//                     }
//                     if(!value.contains('@')){
//                       return('Sahi email likho');
//                     }
//                      return null;}, controller:emailController,)),
                  
//                    SizedBox(width: 200,  child: CustomTextField(text: password, color:Colors.deepOrange, keyboardType: TextInputType.visiblePassword, hintText: 'Password',
//                    validator: (value) {
//                       if (value == null || value.isEmpty) {
//                         return 'Password required hai';
//                       }
//                       if (value.length < 6) {
//                         return 'Password kam se kam 6 characters ka ho';
//                       }
//                       return null;
//                     }, controller: passwordController,suffixicon: InkWell( 
//                       onTap: () {
//                         setState(() {
//                           show =!show;
//                         });
//                       },
                                   
//                       child: Icon(Icons.remove_red_eye)),obscureText: show,)),
//                    ElevatedButton(  onPressed:(){
//                     if (_formKey.currentState!.validate()) {
              
//                       ScaffoldMessenger.of(context).showSnackBar(
//                         const SnackBar(content: Text('Form valid hai!')),
//           );
                    
//                     Navigator.push(context, MaterialPageRoute(builder: (context)=>LandingPage(name: nameController.text,password:passwordController.text,email: emailController.text,)));
//                   } 
//                 Timer(Duration(seconds: 2), ()=> nameController.clear());
                  
//                    }, 
                       
//                    child: Text('Login'))
//           ]
//          )
//                    ],


//          ),
//        ),
//      ),
//    )
    
    
    
    
    
//     );
//   }
// }