import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:benjola_app/data/lessons.dart';

final lessonsProvider = Provider(
  (ref) {
    return lessons;
  },
);
