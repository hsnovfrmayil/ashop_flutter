import 'package:flutter_riverpod/flutter_riverpod.dart';

final chooseCountryKey = StateProvider<String>(
  (ref) {
    return '+49';
  },
);
