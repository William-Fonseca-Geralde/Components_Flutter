import 'package:flutter_riverpod/flutter_riverpod.dart';

final expandedItemsProvider = StateProvider<Map<String, bool>>((ref) => {});

final expandedExplanationProvider = StateProvider<bool>((ref) => false);

final expandedColorsProvider = StateProvider<bool>((ref) => false);