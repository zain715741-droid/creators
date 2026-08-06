import 'package:creater_project/controllers/user_ctrl.dart';
import 'package:creater_project/views/login%20page/login_page.dart';
import 'package:creater_project/views/signup/signup.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'firebase_options.dart'; // Add this line
  

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
  await GetStorage.init();
    Get.put(UserCtrl());
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your appli.
  @override
  Widget build(BuildContext context) {
    // final box = GetStorage();
    return GetMaterialApp(
home: LoginPage(), debugShowCheckedModeBanner: false,); 
  }
}
