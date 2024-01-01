import 'package:bmi_calculator/calculator_brain.dart';
import 'package:bmi_calculator/components/bottom_button.dart';
import 'package:bmi_calculator/screens/input_page.dart';
import 'package:flutter/material.dart';
import '../constants.dart';
import '../components/cards.dart';
import 'package:bmi_calculator/calculator_brain.dart';

class ResultsPage extends StatelessWidget {

  ResultsPage({required this.bmiResult, required this.resultText, required this.interpretation});
  final String bmiResult;
  final String resultText;
  final String interpretation;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kInactiveCardColour,
        title: Container(
            margin: EdgeInsets.only(right: 56),
            child: Center(child: Text("BMI Calculator"))),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
              child: Container(
            child: Center(
              child: Text(
                "Your Result",
                style: kTitleTextStyle,
              ),
            ),
          )),
          Expanded(
              flex: 5,
              child: CustomCard(
                colour: kActiveCardColour,
                cardChild: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      resultText.toUpperCase(),
                      style: resultTextStyle,
                    ),
                    Text(
                      "$bmiResult",
                      style: kBMITextStyle,
                    ),
                    Text(
                      "$interpretation",
                      textAlign: TextAlign.center,
                      style: kResultBodyTextStyle,
                    ),
                  ],
                ),
              )),
          BottomButton(text: "RE-CALCULATE", onTap: () => Navigator.pop(context))
        ],
      ),
    );
  }
}
