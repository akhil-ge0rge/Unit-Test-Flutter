import 'dart:math';

import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart';
import 'package:mocktail/mocktail.dart';
import 'package:unit_test_example/photo/photo_model.dart';
import 'package:unit_test_example/photo/photo_repository.dart';

class MockHtppClient extends Mock implements Client {}

void main() {
  late MockHtppClient mockHtppClient;
  late PhotoRepository photoRepo;
  setUp(() {
    mockHtppClient = MockHtppClient();
    photoRepo = PhotoRepository(client: mockHtppClient);
  });
  group("Photo Repository", () {
    group('getPhoto Function', () {
      test(
          'give getPhotoRepository class when getPhoto function is called and status code is 200 then PhotoModel should be returned',
          () async {
        //Arrange
        when(() => mockHtppClient.get(
                Uri.parse("https://jsonplaceholder.typicode.com/photos/1")))
            .thenAnswer((invocation) async {
          return Response('''
              {
                "albumId": 1,
                "id": 1,
                "title": "accusamus beatae ad facilis cum similique qui sunt",
                "url": "https://via.placeholder.com/600/92c952",
                "thumbnailUrl": "https://via.placeholder.com/150/92c952"
              }
        ''', 200);
        });
        //Act
        final photo = await photoRepo.getPhoto();
        //Asset
        expect(photo, isA<PhotoModel>());
      });

      test(
          'give getPhotoRepository class when getPhoto function is called and status code is not 200 then an exception should be returned',
          () {
        //Arrange
        when(() => mockHtppClient.get(
                Uri.parse("https://jsonplaceholder.typicode.com/photos/1")))
            .thenAnswer((invocation) async {
          return Response('''{}''', 500);
        });
        //Act
        final photo = photoRepo.getPhoto();
        //Assert
        expect(photo, throwsException);
      });
    });
  });
}
