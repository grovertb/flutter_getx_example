import 'package:get/get.dart';
import 'package:flutter/material.dart';

import 'package:flutter_example/controllers/home.dart';
import 'package:flutter_example/models/user.dart';

class HomeList extends StatelessWidget {
  const HomeList({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
      id: 'users',
      builder: (_) {
        if (_.loading) {
          return Center(
            child: LinearProgressIndicator(),
          );
        }
        return ListView.builder(
          itemBuilder: (context, index) {
            final User user = _.users[index];
            return ListTile(
              title: Text(user.firstName),
              subtitle: Text(user.email),
              onTap: () => _.showUserProfile(user),
            );
          },
          itemCount: _.users.length,
        );
      },
    );
  }
}
