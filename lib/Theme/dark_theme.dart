import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_tutorials/Theme/theme_changer_provider.dart';

class ThemeScreen extends StatefulWidget {
  const ThemeScreen({super.key});

  @override
  State<ThemeScreen> createState() => _ThemeScreenState();
}

class _ThemeScreenState extends State<ThemeScreen> {
  @override
  Widget build(BuildContext context) {
    final themeChange= Provider.of<ThemeChanger>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text("Theme Changer"),
      ),
      body: Column(
        children: [
          RadioListTile<ThemeMode>(
              title:Text("Light Theme"),
              value: ThemeMode.light,
              groupValue: themeChange.themeMode,
              onChanged: themeChange.setTheme),
          RadioListTile<ThemeMode>(
              title:Text("Dark Theme"),
              value: ThemeMode.dark,
              groupValue: themeChange.themeMode,
              onChanged: themeChange.setTheme),
          RadioListTile<ThemeMode>(
              title:Text("System Theme"),
              value: ThemeMode.system,
              groupValue: themeChange.themeMode,
              onChanged: themeChange.setTheme),
          Icon(Icons.heart_broken)
        ],
      ),
    );
  }
}
