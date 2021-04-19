import 'dart:async';

import 'package:faker/faker.dart';
import 'package:get/get.dart';

class SocketClientController extends GetxController {
  RxString _message = "".obs;
  Timer _timer;
  final _faker = Faker();

  RxString get message => _message;

  @override
  void onInit() {
    super.onInit();
    _init();
  }

  @override
  void onClose() {
    if (_timer != null) {
      _timer.cancel();
    }
    super.onClose();
  }

  _init() {
    _timer = Timer.periodic(
      Duration(seconds: 5),
      (timer) {
        _message.value = _faker.lorem.sentence();
      },
    );
  }
}
