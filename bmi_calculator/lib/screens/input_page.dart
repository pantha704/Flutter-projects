import 'package:bmi_calculator/screens/results_page.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../components/cards.dart';
import '../components/icon_content.dart';
import '../constants.dart';
import '../components/bottom_button.dart';
import '../components/round_icon_button.dart';
import 'package:bmi_calculator/calculator_brain.dart';

class InputPage extends StatefulWidget {
  const InputPage({super.key});

  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Color maleCardColour = kInactiveCardColour;
  Color femaleCardColour = kInactiveCardColour;
  int height = 180;
  int weight = 60;
  int age = 15;

  setMale() {
    setState(() {
      maleCardColour == kActiveCardColour
          ? maleCardColour = kInactiveCardColour
          : maleCardColour = kActiveCardColour;
    });
    setState(() {
      femaleCardColour = kInactiveCardColour;
    });
  }

  setFemale() {
    setState(() {
      femaleCardColour == kActiveCardColour
          ? femaleCardColour = kInactiveCardColour
          : femaleCardColour = kActiveCardColour;
    });
    setState(() {
      maleCardColour = kInactiveCardColour;
    });
  }

  addFn(variable, {value = 1}) {
    variable = variable + value;
    return variable;
  }

  minusFn(variable, {value = 1}) {
    variable = variable - value;
    return variable;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: kInactiveCardColour,
          title: Center(
              child: Text(
            'BMI Calculator',
          )),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
                child: Row(
              children: [
                Expanded(
                    child: CustomCard(
                  colour: maleCardColour,
                  setGender: setMale,
                  cardChild: IconContent(
                    text: "MALE",
                    icon: FontAwesomeIcons.mars,
                  ),
                )),
                Expanded(
                    child: CustomCard(
                        setGender: setFemale,
                        colour: femaleCardColour,
                        cardChild: IconContent(
                            text: "FEMALE", icon: FontAwesomeIcons.venus))),
              ],
            )),
            Expanded(
                flex: 1,
                child: CustomCard(
                  colour: kActiveCardColour,
                  cardChild: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "HEIGHT",
                        style: kLabelTextStyle,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.baseline,
                        textBaseline: TextBaseline.alphabetic,
                        children: [
                          Text(
                            height.toString(),
                            style: kNumberTextStyle,
                          ),
                          Text(
                            "cm",
                            style: kLabelTextStyle,
                          )
                        ],
                      ),
                      SliderTheme(
                        data: SliderTheme.of(context).copyWith(
                          thumbShape:
                              RoundSliderThumbShape(enabledThumbRadius: 15),
                          overlayShape:
                              RoundSliderOverlayShape(overlayRadius: 30),
                          activeTrackColor: Colors.white,
                          overlayColor: Color(0x3deb1555),
                          thumbColor: Color(0xffeb1555),
                          inactiveTrackColor: Color(0xff8d8e98),
                        ),
                        child: Slider(
                          value: height.toDouble(),
                          onChanged: (double newValue) {
                            setState(() {
                              height = newValue.round();
                              // print(height);
                            });
                          },
                          min: 120.0,
                          max: 220.0,
                        ),
                      )
                    ],
                  ),
                )),
            Expanded(
                child: Row(
              children: [
                Expanded(
                    child: CustomCard(
                  colour: kActiveCardColour,
                  cardChild: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "WEIGHT",
                        style: kLabelTextStyle,
                      ),
                      Text(
                        "$weight",
                        style: kNumberTextStyle,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Expanded(
                              child: RoundIconButton(
                            icon: FontAwesomeIcons.minus,
                            fn: () => {
                              setState(() {
                                weight = minusFn(weight);
                              })
                            },
                            longFn: () {
                              setState(() {
                                weight = minusFn(weight, value: 15);
                              });
                            },
                          )),
                          Expanded(
                              child: RoundIconButton(
                            icon: FontAwesomeIcons.plus,
                            fn: () => {
                              setState(() {
                                weight = addFn(weight);
                              }),
                            },
                            longFn: () {
                              setState(() {
                                weight = addFn(weight, value: 15);
                              });
                            },
                          )),
                        ],
                      ),
                    ],
                  ),
                )),
                Expanded(
                    child: CustomCard(
                  colour: kActiveCardColour,
                  cardChild: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        "AGE",
                        style: kLabelTextStyle,
                      ),
                      Text(
                        "$age",
                        style: kNumberTextStyle,
                      ),
                      Row(
                        children: [
                          Expanded(
                              child: RoundIconButton(
                            icon: FontAwesomeIcons.minus,
                            fn: () {
                              setState(() {
                                age = minusFn(age);
                              });
                            },
                            longFn: () {
                              setState(() {
                                age = minusFn(age, value: 15);
                              });
                            },
                          )),
                          Expanded(
                              child: RoundIconButton(
                            icon: FontAwesomeIcons.plus,
                            fn: () {
                              setState(() {
                                age = addFn(age);
                              });
                            },
                            longFn: () {
                              setState(() {
                                age = addFn(age, value: 15);
                              });
                            },
                          )),
                        ],
                      )
                    ],
                  ),
                )),
              ],
            )),
            BottomButton(
              text: "CALCULATE",
              onTap: () {
                CalculatorBrain calc =
                    CalculatorBrain(height: height, weight: weight);

                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => ResultsPage(
                      bmiResult: calc.calculateBMI(),
                      resultText: calc.getResults(),
                      interpretation: calc.getInterpretation(),
                    )));
              },
            ),
          ],
        ));
  }
}
