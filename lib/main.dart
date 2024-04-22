import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_tutorials/ExampleTwo/example_two.dart';
import 'package:provider_tutorials/Favourite/favourite_items.dart';
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

      ],
      child: MaterialApp(
          title: 'Flutter Demo',
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
            useMaterial3: true,
          ),
          home: const FavouriteItem(),
      ),
    );
  }
}

