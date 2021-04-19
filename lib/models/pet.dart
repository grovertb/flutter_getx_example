import 'package:get/get.dart';
import 'package:meta/meta.dart' show required;

class RxPet {
  final RxString name;
  final RxInt age;

  RxPet({
    @required this.name,
    @required this.age,
  });
}

class Pet {
  // String name;
  // int age;

  // Pet({
  //   @required this.name,
  //   @required this.age,
  // });

  // Pet copyWith({String name, int age}) {
  //   return Pet(
  //     name: name ?? this.name.o,
  //     age: age ?? this.age,
  //   );
  // }

  RxPet rx;

  Pet({
    @required String name,
    @required int age,
  }) {
    this.rx = RxPet(name: name.obs, age: age.obs);
  }

  String get name => this.rx.name.value;
  int get age => this.rx.age.value;

  set name(String value) {
    this.rx.name.value = value;
  }

  set age(int value) {
    this.rx.age.value = value;
  }
}
