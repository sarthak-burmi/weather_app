import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:weather_app/home_page.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Color.fromARGB(255, 3, 134, 248),
    ),
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    //final height = MediaQuery.of(context).size.height;
    //final width = MediaQuery.of(context).size.width;
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        // scaffoldBackgroundColor:
        //     Color.fromARGB(210, 0, 55, 255).withOpacity(0.7),
      ),
      home: HomePage(),
    );
  }
}
