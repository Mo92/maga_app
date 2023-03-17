import 'package:flutter/material.dart';
import 'package:maga_app/router.dart';

void main() {
  runApp(const MagaApp());
}

class MagaApp extends StatelessWidget {
  const MagaApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Maga App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      onGenerateRoute: MagaRouter.generateRoute,
    );
  }
}
