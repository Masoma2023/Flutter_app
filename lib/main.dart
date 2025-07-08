import 'package:flutter/material.dart';
import 'package:flutter_project/views/pages/welcome_page.dart';
import 'package:flutter_project/views/widget_tree.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  
  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(valueListenable: isDarkModeNotifier, builder: (context, isDarkMode, child){
      return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.teal,
        brightness: isDarkMode ? Brightness.dark : Brightness.light,
        ),
      ),
      home:  MyHomePage(),
    );
    });
  }
}
class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
     debugShowCheckedModeBanner: false,
     theme:ThemeData(
      colorScheme: ColorScheme.fromSeed(seedColor:Colors.teal, brightness: Brightness.dark),
     ),
    
    home: WelcomePage(),
      );
  }
}
