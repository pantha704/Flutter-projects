import 'package:flutter/material.dart';
import 'constants.dart';

class Input_page extends StatefulWidget {
  final String value;
  Input_page({required this.value});

  @override
  State<Input_page> createState() => _Input_pageState();
}

class _Input_pageState extends State<Input_page> {
  @override
  void initState() {
    super.initState();
    choose_img();
  }

  var img;
  var msg;
  var clr;
  void choose_img() {
    if (widget.value == "Below 60") {
      img = 'low.png';
      msg = '⚠ Your pulse rate is low. You may have bradycardia or a heart block. Consult a doctor.';
      clr = Colors.brown.shade400;
    } else if (widget.value == "60-100") {
      img = 'normal.jpg';
      msg = 'Your pulse rate is normal. Keep up the good work. 🥂';
      clr = Colors.greenAccent;
    } else {
      img = 'high.jpg';
      msg = '⚠ Your pulse rate is high. You may have tachycardia or a fever. Seek medical attention.';
      clr = Colors.redAccent;
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black,
        ),
        body: Column(
          children: [
            SizedBox(
              height: 20,
            ),
            Center(
                child: Text(
              'Cardiocare',
              style: kButtonTextStyle,
            )),
            SizedBox(
              height: 10,
            ),
            Container(
              width: double.infinity,
              child: Image(
                image: AssetImage('assets/images/$img'),
                fit: BoxFit.fitWidth,
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 20),
                child: Text(msg, style: kButtonTextStyle.copyWith(fontSize: 25, color: clr),)),
            SizedBox(
              height: 70,
            ),
            Container(
              height: 40,
              width: 200,
              child: ElevatedButton(
                  style: ButtonStyle(
                      backgroundColor: MaterialStatePropertyAll(Colors.red),
                      foregroundColor: MaterialStatePropertyAll(Colors.white)),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text(
                    'Check again',
                    style: kButtonTextStyle.copyWith(fontSize: 18),
                  )),
            )
          ],
        ),
      ),
    );
  }
}
