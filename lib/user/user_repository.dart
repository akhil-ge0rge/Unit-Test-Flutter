import 'package:unit_test_example/user/user_model.dart';
import 'package:http/http.dart' as http;

class UserRepository {
  Future<User> getUser() async {
    final response = await http
        .get(Uri.parse('https://jsonplaceholder.typicode.com/users/1'));
    if (response.statusCode == 200) {
      return User.fromJson(response.body);
    }
    throw Exception('some error occoured');
  }
}
