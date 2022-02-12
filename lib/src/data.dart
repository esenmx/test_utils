part of test_utils;

abstract class Data {
  /// sequential integer [List] that starts from `0`
  static List<int> seqIntArray(int length) {
    return List.generate(length, (index) => index);
  }

  /// evenly sequential integer [List] that starts from `0`
  static List<int> seqEvenIntArray(int length) {
    return List.generate(length * 2, (index) => index * 2);
  }

  /// Oddly sequential integer [List] that starts from `0`
  static List<int> seqOddIntArray(int length) {
    return List.generate(length * 2, (index) => index * 2 + 1);
  }

  /// [List] with size of [length] and filled random [int]s
  /// can have duplicates, if [max] is not provided [length] is [max]
  static List<int> randIntArray(int length, [int? max]) {
    return List.generate(length, (index) => Rand.integer(max ?? length));
  }
}
