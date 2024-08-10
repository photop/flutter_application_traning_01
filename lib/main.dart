import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
     
     initialRoute: '/',    // การประกาศหน้าเริ่มต้น
     routes: {
       '/': (context) => const MyHomePage(title: 'Flutter Demo Home Page'),
       '/second': (context) => const SecondPage(title: 'Second Page'),
     },

    );
  }
}
