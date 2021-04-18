import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_example/controllers/home.dart';
import 'package:flutter_example/controllers/profileController.dart';
import 'package:get/get.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProfileController>(
      init: ProfileController(),
      builder: (_) {
        print("USER: ${_.user}");

        return Scaffold(
          appBar: AppBar(
            leading: IconButton(
              icon: Icon(Icons.arrow_back),
              onPressed: () => Get.back(),
            ),
          ),
          body: SafeArea(
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text("${_.user.firstName} ${_.user.lastName}"),
                  SizedBox(
                    height: 10,
                  ),
                  CupertinoTextField(
                    onChanged: _.onInputTextChange,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  CupertinoButton(
                    child: Text("Aceptar"),
                    onPressed: _.goToBackWithData,
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
