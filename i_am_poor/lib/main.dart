import 'package:flutter/material.dart';

// The main function is the starting point for all our Flutter apps.
void main() {
  runApp(
    MaterialApp(
      home:  Scaffold(
        backgroundColor: Colors.blue[900],
        appBar: AppBar(
          title: Center(child: Text('Yo Poor!')),
          backgroundColor: Colors.blue,
        ),
        body: Center(
          child: Image(
            image: AssetImage('images/poor.jpeg'),
          ),
        ),
      ),
    ),
  );
}
