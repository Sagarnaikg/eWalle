import 'package:ewalle/pages/auth/screen.dart';
import 'package:ewalle/pages/home/screen.dart';
import 'package:ewalle/resources/theme_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(MyApp());

  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    statusBarIconBrightness: Brightness.dark,
    statusBarColor: Colors.transparent,
  ));
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'eWalle',
      theme: themeData,
      home: HomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}
