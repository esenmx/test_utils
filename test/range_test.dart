import 'package:test/test.dart';
import 'package:test_utils/test_utils.dart';

void main() async {
  group('Range', () {
    test('range', () {
      expect(5.range(), [0, 1, 2, 3, 4]);
      expect(5.range(5), [5, 6, 7, 8, 9]);
    });
    test('rangeEven', () {
      expect(5.rangeEven(), [0, 2, 4, 6, 8]);
      expect(5.rangeEven(5), [10, 12, 14, 16, 18]);
    });
    test('rangeOdd', () {
      expect(5.rangeOdd(), [1, 3, 5, 7, 9]);
      expect(5.rangeOdd(5), [11, 13, 15, 17, 19]);
    });
    test('rangeEntry', () {
      expect(Map.fromEntries(3.rangeEntry()), {0: true, 1: true, 2: true});
      expect(
          Map.fromEntries(3.rangeEntry(false)), {0: false, 1: false, 2: false});
    });
    test('rangeEntryEven', () {
      expect(Map.fromEntries(3.rangeEntryEven()), {0: true, 2: true, 4: true});
      expect(Map.fromEntries(3.rangeEntryEven(false)),
          {0: false, 2: false, 4: false});
    });
    test('rangeEntryOdd', () {
      expect(Map.fromEntries(3.rangeEntryOdd()), {1: true, 3: true, 5: true});
      expect(Map.fromEntries(3.rangeEntryOdd(false)),
          {1: false, 3: false, 5: false});
    });
  });
}
