
import 'package:creater_project/controllers/friendctrl.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SplashScreen extends StatelessWidget {
 SplashScreen({super.key});
  final Frendctrl ctrl= Get.put(Frendctrl());

  @override
  Widget build(BuildContext context) {
    // Get.put(SplashCtrl());
    return Scaffold(
appBar: AppBar(),
body: Column(
  children: [
          Center(child: Obx(() => Text(ctrl.names.value))),
          TextFormField(controller:ctrl.namectrl),

          ElevatedButton(
            
            onPressed: (){
              ctrl.addfriend();
              // ignore: avoid_print
              print(ctrl.box.read('name'));

            }
          , child: Text('Enter'))

  ],
),



    );

//     return Scaffold(
//       body: Container(
//         width: double.infinity,
//         height: double.infinity,
//         color: Colors.deepOrangeAccent, 
//         child: const Center(
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               FlutterLogo(size: 100), 
//               SizedBox(height: 20),
//               Text(
//                 'My App',
//                 style: TextStyle(fontSize: 28, color: Colors.white, fontWeight: FontWeight.bold),
//               ),
//               SizedBox(height: 30),
//             SimpleCircularProgressBar(
//     mergeMode: true,
//     animationDuration: 3,
// ),

//             ],
//           ),
//         ),
//       ),
//     );
  }
}