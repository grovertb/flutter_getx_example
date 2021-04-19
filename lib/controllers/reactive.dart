import 'package:flutter_example/models/pet.dart';
import 'package:get/get.dart';

class ReactiveController extends GetxController {
  RxInt counter = 0.obs;
  RxString currentDate = ''.obs;

  RxList<String> dates = List<String>().obs;
  RxMap<String, dynamic> mapDates = Map<String, dynamic>().obs;

  // Rx<Pet> myPet = Pet(
  //   name: 'Lulu',
  //   age: 1,
  // ).obs;
  Pet myPet = Pet(name: 'Lulu', age: 1);

  void increment() {
    counter.value++;
    // update();
  }

  void getDate() {
    currentDate.value = DateTime.now().toString();
  }

  void addDate() {
    dates.add(DateTime.now().toString());
  }

  void addMapDate() {
    String keyValue = DateTime.now().toString();
    mapDates.addIf(true, keyValue, keyValue);
  }

  void removeDate(int index) {
    dates.removeAt(index);
  }

  void removeMap(String key) {
    mapDates.remove(key);
  }

  void setPetAge(int age) {
    // myPet.value.age = age;
    // myPet.value = myPet.value.copyWith(age: age);
    myPet.age = age;
  }
}
