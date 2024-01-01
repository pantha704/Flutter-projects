import 'package:flutter/material.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.teal,
        body: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const CircleAvatar(
                radius: 50,
                backgroundImage: NetworkImage("data:image/jpeg;base64,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"),
              ),
              const Text("Panther",
              style: TextStyle(
                fontFamily: "Pacifico",
                fontSize: 40,
                color: Colors.white,
                fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                'A FLUTTER DEVELOPER',
                style: TextStyle(
                  fontFamily: 'Source sans',
                  color: Colors.teal[100],
                  fontSize: 20,
                  letterSpacing: 2.5,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                height: 25,
                width: 200,
                child: Divider(
                  color: Colors.teal.shade100,
                ),
              ),
              Card(
                color: Colors.white,
                margin: EdgeInsets.symmetric(vertical: 10, horizontal: 25),
                child: ListTile(
                  leading: Icon(
                    Icons.phone,
                    size: 40,
                    color: Colors.teal,
                  ),
                  title: Text("+91 85829 95868",
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.teal[900],
                    ),
                  ),
                )
              ),
              Card(
                color: Colors.white,
                margin: EdgeInsets.symmetric(vertical: 10,horizontal: 25),
                child: ListTile(
                  leading: Icon(
                      Icons.email,
                      color: Colors.teal,
                      size: 40,
                    ),
                  title: Text("prathamjaiswal204@gmail.com",
                    style: TextStyle(
                      fontSize: 17,
                      color: Colors.teal.shade900,
                      fontFamily: "Source sans",
                    ),)
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
