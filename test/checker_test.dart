import 'package:test/expect.dart';
import 'package:test/scaffolding.dart';
import 'package:test_utils/test_utils.dart';

void main() {
  group('withinDuration', () {
    final d = DateTime(2011, 11, 11);
    test('days before', () {
      final d2 = DateTime(2011, 11, 10);
      expect(d.withinDuration(d2, 1.days), isTrue);
    });

    test('days after', () {
      final d3 = DateTime(2011, 11, 12);
      expect(d.withinDuration(d3, 1.days), isTrue);
    });

    test('months before', () {
      final d4 = DateTime(2011, 12, 11);
      expect(d.withinDuration(d4, 30.days), isTrue);
    });
  });
}

extension IntDuration on int {
  Duration get days => Duration(days: this);
}
