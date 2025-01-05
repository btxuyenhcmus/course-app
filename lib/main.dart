import 'package:flutter/material.dart';
import 'package:flutter_application_1/screens/root_app.dart';
import 'package:flutter_application_1/theme/color.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        scaffoldBackgroundColor: AppColor.appBgColor,
        primaryColor: AppColor.primary,
      ),
      home: RootApp(),
    );
  }
}
