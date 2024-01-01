import 'package:flutter/material.dart';
import 'dart:math';

void main() => runApp(
    MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Center(
            child: Text("Ask Me Anything"),
          ),
          backgroundColor: Colors.blue.shade800,
        ),
        body: Ball(),
      ),
    )
  );

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.blue,
      child: Center(
        child: TextButton(
            onPressed: () { print("I got clicked"); },
            child: Image.asset("images/ball1.png")
        )
      ),
    );
  }
}

class Ball extends StatefulWidget {
  const Ball({super.key});

  @override
  State<Ball> createState() => _BallState();
}

class _BallState extends State<Ball> {
  int ballNumber = 1;

  void clicked() {
    setState(() {
    ballNumber = Random().nextInt(5)+1;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.blue,
      child: Center(
          child: TextButton(
              onPressed: () {
                setState(() {
                  clicked();
                 });
                },
              child: Image.asset("images/ball$ballNumber.png")
          ),
      ),
    );
  }
}
