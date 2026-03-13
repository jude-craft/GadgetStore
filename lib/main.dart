import 'package:flutter/material.dart';
import 'package:provider/screens/home_screen.dart';
import 'package:provider/utils/app_theme.dart';

void main() {
  runApp(const GadgetApp());
}

class GadgetApp extends StatelessWidget {
  const GadgetApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: AppTheme.theme,
      home: const HomeScreen(),
    );
  }
}

