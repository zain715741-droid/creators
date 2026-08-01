import 'package:creater_project/controllers/user_ctrl.dart';
import 'package:creater_project/views/list_screen/list_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';


void main() async{
  WidgetsFlutterBinding.ensureInitialized();
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
home: ListScreen(), debugShowCheckedModeBanner: false,); 
  }
}
