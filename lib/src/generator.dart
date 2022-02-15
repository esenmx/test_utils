part of test_utils;

abstract class Generator {
  /// [0, ... , length - 1]
  static List<int> seqElements(int length) {
    return List.generate(length, (index) => index);
  }

  /// [0, 2, 4, ... , (length - 1) * 2]
  static List<int> seqEvenElements(int length) {
    return List.generate(length, (index) => index * 2);
  }

  /// [1, 3, 5, ... , ((length + 1) * 2) - 1]
  static List<int> seqOddElements(int length) {
    return List.generate(length, (index) => index * 2 + 1);
  }

  /// {Random().nextInt(), Random().nextInt(), ... , Random().nextInt()};
  static List<int> randElements(int length, [int? max]) {
    return List.generate(length, (index) => Random().nextInt(max ?? length));
  }

  /// {0: true, 1: true, ... , (length - 1): true};
  static List<MapEntry<int, bool>> seqEntries(int length) {
    return seqElements(length).map((e) => MapEntry(e, true)).toList();
  }

  /// {0: true, 2: true, ... , ((length - 1) * 2): true};
  static List<MapEntry<int, bool>> seqEvenEntries(int length) {
    return seqEvenElements(length).map((e) => MapEntry(e, true)).toList();
  }

  /// {1: true, 3: true, ... , (((length + 1) * 2) - 1): true};
  static List<MapEntry<int, bool>> seqOddEntries(int length) {
    return seqOddElements(length).map((e) => MapEntry(e, true)).toList();
  }

  /// {Random().nextInt(): true, Random().nextInt(): true, ... , Random().nextInt(): true};
  static List<MapEntry<int, bool>> randEntries(int length) {
    return randElements(length).map((e) => MapEntry(e, true)).toList();
  }
}