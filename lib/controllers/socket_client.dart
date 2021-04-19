import 'dart:async';

import 'package:faker/faker.dart';
import 'package:get/get.dart';

class SocketClientController extends GetxController {
  RxString _message = "".obs;
  RxInt _counter = 0.obs;
  RxString _searchText = ''.obs;

  Timer _timer;
  Timer _timerCounter;
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
    // if (_timerCounter != null) {
    //   _timerCounter.cancel();
    // }
    super.onClose();
  }

  _init() {
    // ever(_counter, (_) {
    //   print("_counter has been changed ${_counter.value}");
    // });

    // once(_counter, (_) {
    //   print("_counter has been changed ${_counter.value}");
    // });

    // debounce(
    //   _counter,
    //   (_) {
    //     print("_counter has been changed ${_counter.value}");
    //   },
    //   time: Duration(seconds: 1),
    // );

    // _timerCounter = Timer.periodic(
    //   Duration(seconds: 1),
    //   (timer) {
    //     _counter.value++;
    //   },
    // );

    // debounce(
    //   _searchText,
    //   (_) {
    //     print("_searchText: ${_searchText.value}");
    //   },
    //   time: Duration(milliseconds: 500),
    // );

    interval(
      _searchText,
      (_) {
        print("_searchText: ${_searchText.value}");
      },
      time: Duration(seconds: 1),
    );

    // ever(_searchText, (_) {
    //   print("_searchText: ${_searchText.value}");
    // });

    _timer = Timer.periodic(
      Duration(seconds: 5),
      (timer) {
        _message.value = _faker.lorem.sentence();
      },
    );
  }

  void setSearchText(String text) {
    _searchText.value = text;
  }
}
