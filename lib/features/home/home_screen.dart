import 'package:applite_solutions/theme/text_style.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Text("Home Screen", style: AppTextTheme.titleBoldStyle)),
    );
  }
}
