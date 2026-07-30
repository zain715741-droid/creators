import 'dart:async';

import 'package:get/get.dart';

import '../views/login page/login_page.dart';

class SplashCtrl extends GetxController{

@override
  void onInit() {
    Timer(Duration (seconds: 3),(){ Get.to(() => LoginPage());
    });
    super.onInit();
  }

}