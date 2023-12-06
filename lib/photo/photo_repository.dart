import 'package:unit_test_example/photo/photo_model.dart';
import 'package:http/http.dart' as http;

class PhotoRepository {
  final http.Client client;
  PhotoRepository({required this.client});
  Future<PhotoModel> getPhoto() async {
    final response = await client
        .get(Uri.parse("https://jsonplaceholder.typicode.com/photos/1"));

    if (response.statusCode == 200) {
      return photoModelFromJson(response.body);
    }
    throw Exception("some error occoured");
  }
}
