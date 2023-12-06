import 'package:flutter/material.dart';
import 'package:http/http.dart';

import 'photo_repository.dart';

class PhotoScreen extends StatefulWidget {
  const PhotoScreen({super.key});

  @override
  State<PhotoScreen> createState() => _PhotoScreenState();
}

class _PhotoScreenState extends State<PhotoScreen> {
  final getPhoto = PhotoRepository(client: Client()).getPhoto();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: FutureBuilder(
            future: getPhoto,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const CircularProgressIndicator();
              }
              return Text("${snapshot.data}");
            }),
      ),
    );
  }
}
