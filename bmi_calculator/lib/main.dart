import 'package:bmi_calculator/screens/results_page.dart';
import 'package:flutter/material.dart';
import 'screens/input_page.dart';


void main() => runApp(const BMI_Calculator());

class BMI_Calculator extends StatelessWidget {
  const BMI_Calculator({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(
          scaffoldBackgroundColor: Color(0xFF0A0E21),
          primaryColor: Color(0xFF0A0E21),
      ),
      home: InputPage(),
    );
  }
}
