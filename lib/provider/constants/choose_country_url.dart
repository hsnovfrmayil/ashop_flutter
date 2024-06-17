import 'package:flutter_riverpod/flutter_riverpod.dart';

final chooseCountryUrl = StateProvider<String>(
  (ref) {
    return 'assets/images/germany.svg';
  },
);
