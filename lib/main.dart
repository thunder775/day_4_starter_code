import 'dart:math';

import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      home: Dicepage(),
    ),
  );
}

class Dicepage extends StatefulWidget {
  @override
  _DicepageState createState() => _DicepageState();
}

class _DicepageState extends State<Dicepage> {
  int leftDiceNumber = 1;
  int rightDiceNumber = 2;
  Random rand = Random();

  void leftmodify() {
    setState(() {
      rightDiceNumber = 1 + rand.nextInt(6);
      leftDiceNumber = 1 + rand.nextInt(6);
    });
  }

  void righttmodify() {
    setState(() {
      rightDiceNumber = 1 + rand.nextInt(6);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.refresh),
        onPressed: leftmodify,
        backgroundColor: Colors.black,
      ),
      backgroundColor: Colors.redAccent,
      appBar: AppBar(
        title: Center(child: Text('Roll the Dice')),
        backgroundColor: Colors.red,
      ),
      body: Center(
        child: Row(
          children: <Widget>[
            Expanded(
              flex: 1,
              child: FlatButton(
                onPressed: leftmodify,
                child: Image(
                  image: AssetImage('assets/dice$leftDiceNumber.png'),
                ),
              ),
            ),
            Expanded(
              flex: 1,
              child: FlatButton(
                onPressed: leftmodify,
                child: Image(
                  image: AssetImage('assets/dice$rightDiceNumber.png'),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
