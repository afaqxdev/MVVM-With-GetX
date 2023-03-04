import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../view_model/controller/home/home_user_view.dart';

class UserListBuilder extends StatelessWidget {
  UserListBuilder({super.key});
  final homeController = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        itemCount: homeController.userList.value.data!.length,
        itemBuilder: (context, index) {
          var data = homeController.userList.value.data![index];
          // ignore: prefer_const_constructors
          return Card(
              child: ListTile(
            leading: CircleAvatar(
              backgroundImage: NetworkImage(data.avatar.toString()),
            ),
            title: Text(data.firstName.toString()),
          ));
        },
      ),
    );
    ;
  }
}
