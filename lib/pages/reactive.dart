import 'package:flutter/material.dart';
import 'package:flutter_example/controllers/reactive.dart';
import 'package:flutter_example/controllers/socket_client.dart';
import 'package:get/get.dart';

class ReactivePage extends StatelessWidget {
  const ReactivePage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final socketClientcontroller = Get.find<SocketClientController>();

    return GetBuilder<ReactiveController>(
      init: ReactiveController(),
      builder: (_) {
        return Scaffold(
          // // body: Column(
          // //   mainAxisAlignment: MainAxisAlignment.center,
          // //   // crossAxisAlignment: CrossAxisAlignment.center,
          // //   children: [
          // //     Obx(
          // //       () {
          // //         return Text(
          // //           _.counter.value.toString(),
          // //           style: TextStyle(fontSize: 30),
          // //         );
          // //       },
          // //     ),
          // //     Obx(
          // //       () {
          // //         return Text(
          // //           _.currentDate.value,
          // //           style: TextStyle(fontSize: 30),
          // //         );
          // //       },
          // //     ),
          // //   ],
          // // ),
          // // body: Obx(
          // //   () => ListView.builder(
          // //     itemBuilder: (__, index) {
          // //       final String text = _.dates[index];
          // //       return ListTile(
          // //         title: Text(text),
          // //         trailing: IconButton(
          // //           icon: Icon(
          // //             Icons.delete,
          // //             color: Colors.red,
          // //           ),
          // //           onPressed: () {
          // //             _.removeDate(index);
          // //           },
          // //         ),
          // //       );
          // //     },
          // //     itemCount: _.dates.length,
          // //   ),
          // // ),
          // body: Obx(
          //   () => ListView(
          //     children: _.mapDates.values
          //         .map(
          //           (e) => ListTile(
          //             title: Text(e),
          //             trailing: IconButton(
          //                 icon: Icon(Icons.delete),
          //                 onPressed: () => _.removeMap(e)),
          //           ),
          //         )
          //         .toList(),
          //   ),
          // ),
          // floatingActionButton: Row(
          //   mainAxisAlignment: MainAxisAlignment.end,
          //   children: [
          //     FloatingActionButton(
          //       heroTag: 'add',
          //       child: Icon(Icons.add),
          //       onPressed: () {
          //         // _.increment();
          //         // _.addDate();
          //         _.addMapDate();
          //       },
          //     ),
          //     FloatingActionButton(
          //       heroTag: 'date',
          //       child: Icon(Icons.calendar_today),
          //       onPressed: () {
          //         _.getDate();
          //       },
          //     ),
          //   ],
          // ),
          body: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Obx(
                // () => Text("Age ${_.myPet.value.age}"),
                // () => Text("Age ${_.myPet.age}"),
                () => Text(socketClientcontroller.message.value),
              ),
              TextButton(
                onPressed: () {
                  // _.setPetAge(_.myPet.value.age + 1);
                  _.setPetAge(_.myPet.age + 1);
                },
                child: Text("Set Age"),
              ),
            ],
          ),
        );
      },
    );
  }
}
