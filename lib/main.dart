import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/material.dart';
import 'package:tasbeh/screens/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  MyAppState createState() => MyAppState();
}

class MyAppState extends State<MyApp> {
  bool isDarkTheme = false;

  void saveThemePreferences(bool value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool('themeIsDark', value);
  }

  Future<bool> loadThemePreferences() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getBool('themeIsDark') ?? true;
  }

  void setDarkTheme(bool value) {
    setState(() {
      isDarkTheme = value;
      saveThemePreferences(value);
    });
  }

  @override
  void initState() {
    super.initState();
    loadThemePreferences().then((value) {
      setState(() {
        isDarkTheme = value;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: isDarkTheme ? ThemeData.dark() : ThemeData.light(),
      home: HomeScreen(
        title: 'Tasbih',
        isDarkTheme: isDarkTheme,
        setDarkTheme: setDarkTheme,
      ),
    );
  }
}