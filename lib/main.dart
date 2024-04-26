import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_tutorials/ExampleTwo/example_two.dart';
import 'package:provider_tutorials/Favourite/favourite_items.dart';
import 'package:provider_tutorials/Theme/dark_theme.dart';
import 'package:provider_tutorials/Theme/theme_changer_provider.dart';
import 'package:provider_tutorials/count_example.dart';

import 'ExampleTwo/example_two_provider.dart';
import 'Favourite/favourite_provider.dart';
import 'count_provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_)=> CountProvider()),
        ChangeNotifierProvider(create: (_)=> ExampleTwoProvider()),
        ChangeNotifierProvider(create: (_)=> FavouriteProvider()),
        ChangeNotifierProvider(create: (_)=> ThemeChanger()),
      ],
      child: Builder(builder: (BuildContext context){
        return MaterialApp(
          title: 'Flutter Demo',
          themeMode: Provider.of<ThemeChanger>(context).themeMode,
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
            useMaterial3: true,
          ),
          darkTheme: ThemeData(
            brightness: Brightness.dark,
            appBarTheme: AppBarTheme(
              color: Colors.pink,
            ),
            iconTheme: IconThemeData(
              color: Colors.pink,
            ),

          ),
          home: const ThemeScreen(),
        );
      }),
    );
  }
}

