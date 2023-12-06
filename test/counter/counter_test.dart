import 'package:flutter_test/flutter_test.dart';
import 'package:unit_test_example/counter/counter.dart';

void main() {
  late Counter counter;
  setUp(() => counter = Counter());
  // setUpAll(() => null);

  // tearDown(() => null);
  // tearDownAll(() => null);

  group("Counter Class - ", () {
    test(
        'given counter class when it is instantiated then the counter value should be 0',
        () {
      //Arrange
      // final Counter counter = Counter();
      //Act
      final val = counter.count;
      //Assert
      expect(val, 0);
    });

    test(
        "given counter class when it is incremented then the counter value should be 1",
        () {
      //Arrange
      // final Counter counter = Counter();
      //Act
      counter.incrementCounter();
      final val = counter.count;
      //Assert
      expect(val, 1);
    });
    test(
        "given counter class when it is dectemented then the counter value should be -1",
        () {
      //Arrange
      // final Counter counter = Counter();
      //Act
      counter.decrementCounter();
      final val = counter.count;
      //Assert
      expect(val, -1);
    });
    test(
        "given counter class when it is reset then the counter value should be 0",
        () {
      //Arrange
      // final Counter counter = Counter();
      //Act
      counter.reset();
      final val = counter.count;
      //Assert
      expect(val, 0);
    });
  });
}
