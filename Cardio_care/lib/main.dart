import 'package:flutter/material.dart';
import 'package:cardio_care/constants.dart';

import 'input_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Cardiocare',
      theme: ThemeData(
        colorScheme: ColorScheme.dark(),
        useMaterial3: true,
      ).copyWith(scaffoldBackgroundColor: Colors.black),
      home: const MyHomePage(title: ''),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<String> dropdownItems = ['Below 60', '60-100', 'Above 100'];
  String selectedItem = 'Below 60';

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black,
          title: Center(child: Text(widget.title)),
        ),
        body: Column(
          children: [
            SizedBox(
              height: 20,
            ),
            Center(
                child: Text(
              'CardioCare',
              style: kButtonTextStyle,
            )),
            SizedBox(
              height: 10,
            ),
            Container(
              width: double.infinity,
              child: Image(
                image: AssetImage('assets/images/home.jpg'),
                fit: BoxFit.fitWidth,
              ),
            ),
            // SizedBox(height: 40,),
            Column(
              children: [
                Text("Select your pulse range"),
                DropdownButton<String>(
                  items: const [
                    DropdownMenuItem(child: Text("Below 60"), value: 'Below 60'),
                    DropdownMenuItem(child: Text("60-100"), value: '60-100'),
                    DropdownMenuItem(child: Text("Above 100"), value: 'Above 100'),
                  ],
                  value: selectedItem,
                  onChanged: (String? newValue) {
                    if (newValue != null) {
                      // Handle null safety
                      setState(() {
                        selectedItem = newValue;
                      });
                      // Handle the selected item here
                    }
                  },
                ),
              ],
            ),
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
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Input_page(value: selectedItem)));
                  },
                  child: Text(
                    'Check your pulse',
                    style: kButtonTextStyle.copyWith(fontSize: 18),
                  )),
            )
          ],
        ),
      ),
    );
  }
}
