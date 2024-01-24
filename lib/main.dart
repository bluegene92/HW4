import 'package:flutter/material.dart';

import 'pages/home_page.dart';

// Estimate Completion time: 4 Hours
// Actual Completition time:

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Flutter Demo',
      home: HomePage(),
    );
  }
}
