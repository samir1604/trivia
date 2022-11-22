import 'package:flutter_test/flutter_test.dart';
import 'package:trivia/src/data/sources/local_consumer.dart';

const testUri = 'assets/data/nivel_1.json';
const badUri = 'assets/data/nivel.json';

void main() {
  late LocalConsumer sut;

  setUp(() {
    TestWidgetsFlutterBinding.ensureInitialized();
    sut = LocalConsumer();
  });

  group('Get level one data', () {

    test('test consumer success result', () async {
      final result = await sut.consume(testUri);
      expect(result.data?.length, greaterThan(0));
    });

    test('consumer fail loading result', () async {
      try {
        final result = await sut.consume(badUri);
        expect(result.success, false);
        expect(result.message.length, greaterThan(0));
      } catch (e) {
        print(e.toString());
      }
    });
  });
}
