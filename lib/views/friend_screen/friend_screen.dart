import 'package:creater_project/controllers/friendctrl.dart';
import 'package:creater_project/views/friend_screen/ad_friend.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FriendScreen extends StatelessWidget {
  FriendScreen({super.key});
  final Frendctrl ctrl = Get.put(Frendctrl());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.to(() =>AdFriend());
        },
          child: Icon(Icons.add),
        ),
        appBar:AppBar(),
        body:Obx(
          ()=> ListView.builder(itemCount: ctrl.friends.length,
          itemBuilder: (BuildContext context,int i){
            final name = ctrl.friends[i];
            return ListTile(title: Text(name));
          },
        ),
        ),   
    );
  }   
}