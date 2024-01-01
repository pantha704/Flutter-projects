import 'package:flutter/material.dart';
import '../constants.dart';

class BottomButton extends StatelessWidget {

  BottomButton({required this.text, required this.onTap});
  final String text;
  final Function onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onTap();
        // Navigator.push(context,
        //     MaterialPageRoute(builder: (context) => ResultsPage()));
      },
      child: Container(
        color: kBottomContainerColour,
        margin: EdgeInsets.only(top: 10),
        padding: EdgeInsets.only(bottom: 15),
        width: double.infinity,
        height: kBottomContainerHeight,
        child: Center(
          child: Text(
            "$text",
            style: kLargeButtonTextStyle,
          ),
        ),
      ),
    );
  }
}
