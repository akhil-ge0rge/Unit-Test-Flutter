import 'package:flutter_test/flutter_test.dart';
import 'package:unit_test_example/user/user_model.dart';
import 'package:unit_test_example/user/user_repository.dart';

void main() {
  late UserRepository userRepo;
  setUp(() => userRepo = UserRepository());
  group("User Repository - ", () {
    group("getUserFunction", () {
      test(
          "give UserRepository class when getUser function is called and status code is 200 then a usermodel should be returned",
          () async {
        //Arrange
        //Act
        final user = await userRepo.getUser();
        //Assert
        expect(user, isA<User>());
      });
    });
  });
}
