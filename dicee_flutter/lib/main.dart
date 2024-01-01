import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  return runApp(
    MaterialApp(
      theme: ThemeData.dark(),
      home: Scaffold(
        // backgroundColor: Colors.red,
        appBar: AppBar(
          title: Center(child: Text('Play the Dice!')),
        ),
        body: DicePage(),
      ),
    ),
  );
}

class DicePage extends StatefulWidget {
  @override
  State<DicePage> createState() => _State();
}

class _State extends State<DicePage> {
  int leftDiceNumber = 1;
  int rightDiceNumber = 1;

  void changeLeft() {
    setState(() {
      // rightDiceNumber = Random().nextInt(6)+1;
      leftDiceNumber = Random().nextInt(6) + 1;
    });
  }

  void changeRight() {
    setState(() {
      rightDiceNumber = Random().nextInt(6) + 1;
      // leftDiceNumber = Random().nextInt(6)+1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16),
        child: Row(
          children: [
            Expanded(
                flex: 1,
                child: TextButton(
                  onPressed: () {
                    setState(() {
                      changeLeft();
                    });
                  },
                  child: Image.asset('images/dice$leftDiceNumber.png'),
                )),
            SizedBox(
              width: 32,
            ),
            Expanded(
              flex: 1,
              child: TextButton(
                  onPressed: () {
                    setState(() {
                      changeRight();
                    });
                  },
                  child: Image.asset('images/dice$rightDiceNumber.png')),
            ),
          ],
        ),
      ),
    );
  }
}
