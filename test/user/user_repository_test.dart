import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart';
import 'package:mocktail/mocktail.dart';
import 'package:unit_test_example/user/user_model.dart';
import 'package:unit_test_example/user/user_repository.dart';

class MockHttpClient extends Mock implements Client {}

void main() {
  late UserRepository userRepo;
  late MockHttpClient mockHttpClient;
  setUp(() {
    mockHttpClient = MockHttpClient();
    userRepo = UserRepository(client: mockHttpClient);
  });
  group("User Repository - ", () {
    group("getUserFunction", () {
      test(
          "give UserRepository class when getUser function is called and status code is 200 then a usermodel should be returned",
          () async {
        //Arrange
        when(() => mockHttpClient
                .get(Uri.parse('https://jsonplaceholder.typicode.com/users/1')))
            .thenAnswer((invocation) async {
          return Response('''
          {
           "id": 1,
            "name": "Leanne Graham",
            "email": "Sincere@april.biz",
            "website": "hildegard.org"
          }
          ''', 200);
        });
        //Act
        final user = await userRepo.getUser();
        //Assert
        expect(user, isA<User>());
      });

      test(
          "given UserRepository class when getUser function is called and status code is not 200 then a exception should be thrown",
          () async {
        //Arrange
        when(() => mockHttpClient
                .get(Uri.parse('https://jsonplaceholder.typicode.com/users/1')))
            .thenAnswer((invocation) async => Response('{body}', 500));
        //Act
        final user = userRepo.getUser();
        //Assert
        expect(user, throwsException);
      });
    });
  });
}
