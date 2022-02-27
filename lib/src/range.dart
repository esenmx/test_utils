part of test_utils;

extension RangeIntExtensions on int {
  /// [0, ... , length - 1]
  List<int> rangeSeq([int? offset]) {
    return List.generate(this, (index) => index + (offset ?? 0));
  }

  /// [0, 2, 4, ... , (length - 1) * 2]
  List<int> rangeEvenSeq([int? offset]) {
    return List.generate(this, (index) => index * 2 + (offset ?? 0));
  }

  /// [1, 3, 5, ... , ((length + 1) * 2) - 1]
  List<int> rangeOddSeq([int? offset]) {
    return List.generate(this, (index) => index * 2 + 1 + (offset ?? 0));
  }

  /// {Random().nextInt(), Random().nextInt(), ... , Random().nextInt()};
  List<int> rangeRandom([int? max]) {
    return List.generate(this, (index) => Random().nextInt(max ?? this));
  }

  /// {0: true, 1: true, ... , (length - 1): true};
  List<MapEntry<int, bool?>> rangeSeqEntries([bool? value = true]) {
    return rangeSeq(this).map((e) => MapEntry(e, true)).toList();
  }

  /// {0: true, 2: true, ... , ((length - 1) * 2): true};
  List<MapEntry<int, bool?>> rangeEvenSeqEntries([bool? value = true]) {
    return rangeEvenSeq(this).map((e) => MapEntry(e, value)).toList();
  }

  /// {1: true, 3: true, ... , (((length + 1) * 2) - 1): true};
  List<MapEntry<int, bool?>> rangeOddEntries([bool? value = true]) {
    return rangeOddSeq(this).map((e) => MapEntry(e, value)).toList();
  }

  /// {Random().nextInt(): true, ... , Random().nextInt(): true};
  List<MapEntry<int, bool?>> rangeRandomEntries([bool? value = true]) {
    return rangeRandom(this).map((e) => MapEntry(e, value)).toList();
  }
}
