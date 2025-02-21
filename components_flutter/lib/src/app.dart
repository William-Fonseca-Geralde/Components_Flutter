import 'package:flutter/material.dart';
import 'package:components_flutter/src/providers/theme_notifier.dart';
import 'package:components_flutter/src/views/home_page.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class MainApp extends ConsumerWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final themeMode = ref.watch(themeProvider);
    final primaryColor = ref.watch(colorProvider);

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Material 3',
      theme: ThemeData(
        useMaterial3: true,
        brightness: themeMode ? Brightness.dark : Brightness.light,
        colorSchemeSeed: primaryColor
      ),
      home: HomePage(),
    );
  }
}