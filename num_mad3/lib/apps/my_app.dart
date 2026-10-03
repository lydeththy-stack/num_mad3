import 'package:flutter/material.dart';
import 'package:num_mad3/providers/color_provider.dart';
import 'package:num_mad3/screens/my_home.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:num_mad3/providers/theme_provider.dart';
import 'package:num_mad3/screens/main_screen.dart';

List<Color> colorList = [
  Colors.yellow,
  Colors.orange,
  Colors.deepOrange,
  Colors.pink,
  Colors.red,
  Colors.purple,
  Colors.deepPurple,
  Colors.lime,
  Colors.lightGreen,
  Colors.green,
  Colors.cyan,
  Colors.blue,
  Colors.indigo,
  Colors.blueGrey,

];

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    bool dark = ref.watch(themeProvider);
    
    int index = ref.watch(colorProvider);
    Color seedColor= colorList[index];

    return MaterialApp(
        title: 'Flutter Demo',
        themeMode: dark ? ThemeMode.dark : ThemeMode.light,
        theme: ThemeData(
            brightness: Brightness.light,
            colorScheme: ColorScheme.fromSeed(seedColor: seedColor),

        ),
        darkTheme: ThemeData(
            brightness: Brightness.dark,
            colorScheme: ColorScheme.fromSeed(seedColor: seedColor, brightness: Brightness.dark),
        ),
        // home: const MyHomePage(title: 'Flutter Demo Home Page') as Widget,
        home: MainScreen(),

    );
  }
}