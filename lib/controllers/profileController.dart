import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_example/models/user.dart';
import 'package:get/get.dart';

class ProfileController extends GetxController {
  User _user;
  String _inputText = "";

  User get user => _user;

  @override
  void onInit() {
    super.onInit();

    this._user = Get.arguments as User;
  }

  void onInputTextChange(String text) {
    this._inputText = text;
  }

  void goToBackWithData() {
    if (this._inputText.trim().length > 0) {
      Get.back(result: this._inputText);
    } else {
      showCupertinoModalPopup(
        context: Get.overlayContext,
        builder: (_) => CupertinoActionSheet(
          title: Text("Error:"),
          message: Text("Ingrese un valor válido"),
          cancelButton: CupertinoActionSheetAction(
            child: Text("Aceptar"),
            onPressed: () => Get.back(),
          ),
        ),
      );
      // Get.dialog(
      //   AlertDialog(
      //     title: Text("Error:"),
      //     content: Text("Ingrese un valor válido"),
      //     actions: [
      //       TextButton(
      //         onPressed: Get.back,
      //         child: Text("Aceptar"),
      //       ),
      //     ],
      //   ),
      // );
    }
  }
}
