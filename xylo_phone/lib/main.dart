import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

void main() => runApp(XxylophoneApp());

class XxylophoneApp extends StatelessWidget {

  Expanded buildKey({required int n, required Color color}){
    return Expanded(
      child: TextButton(
        onPressed: () {
          playSound(n);
        },
        child: Container(
          height: 95,
          width: double.infinity,
          color: color,
        ),
      ),
    );
  }

  void playSound(int num) {
    final player = AudioPlayer();
    player.play(AssetSource("note$num.wav"));
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.black,
        body: SafeArea(
          child: Center(
            child: Column(
            children: [
              buildKey(n: 1, color: Colors.red),
              buildKey(n: 2, color: Colors.orange),
              buildKey(n: 3, color: Colors.yellow),
              buildKey(n: 4, color: Colors.green),
              buildKey(n: 5, color: Colors.teal),
              buildKey(n: 6, color: Colors.blue),
              buildKey(n: 7, color: Colors.purple),
              ],
            )
          ),
        ),
      ),
    );
  }
}