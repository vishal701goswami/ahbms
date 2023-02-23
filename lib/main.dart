

import 'package:ahbmss/screen/login_page.dart';

import 'package:flutter/material.dart';


Future<void> main() async {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // This widget is the root of your application.
  
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: LoginPage(),
    );
  }

 
}


class InterNetError extends StatefulWidget {
  const InterNetError({super.key});

  @override
  State<InterNetError> createState() => _InterNetErrorState();
}

class _InterNetErrorState extends State<InterNetError> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}