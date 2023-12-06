import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:unit_test_example/user/user_repository.dart';

import 'user_model.dart';

class UserScreen extends StatefulWidget {
  const UserScreen({super.key});

  @override
  State<UserScreen> createState() => _UserScreenState();
}

class _UserScreenState extends State<UserScreen> {
  Future<User> getUser = UserRepository(client: Client()).getUser();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
          future: getUser,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const CircularProgressIndicator(
                color: Colors.red,
              );
            }
            return Center(
              child: Text("${snapshot.data}"),
            );
          }),
    );
  }
}
