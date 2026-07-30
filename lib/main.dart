import 'package:creater_project/controllers/user_ctrl.dart';
import 'package:creater_project/views/Display/display_screen.dart';
import 'package:creater_project/views/dataentry/data_entry_screen.dart';
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

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final box = GetStorage();
    final bool hasData = box.hasData('name');
    return GetMaterialApp(
home: hasData ? DisplayScreen() : DataEntryScreen(), debugShowCheckedModeBanner: false,); 
  }
}
