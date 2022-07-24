import 'dart:math';

import 'package:flutter/material.dart';

void main() {
  return runApp(
    MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.red,
        appBar: AppBar(
          title: Text('Dicee'),
          backgroundColor: Colors.red,
        ),
        body: DicePage(),
      ),
    ),
  );
}

class DicePage extends StatefulWidget {
  @override
  State<DicePage> createState() => _DicePageState();
}

class _DicePageState extends State<DicePage> {
  int leftDiceNumber = 1;
  int rightDiceNumber = 1;
  Random randomNum = Random();
  Color _selectedColor;
  List<Color> colors = [
    Colors.red,
    Colors.green,
    Colors.blue,
    Colors.grey,
    Colors.black87,
    Colors.yellow
  ];

  void _rollDice() {
    setState(() {
      leftDiceNumber = randomNum.nextInt(6) + 1;
      rightDiceNumber = randomNum.nextInt(6) + 1;
      _selectedColor = colors[randomNum.nextInt(6)];
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _selectedColor = colors[randomNum.nextInt(6)];
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: _selectedColor,
      child: Center(
        child: Row(
          children: <Widget>[
            Expanded(
              child: TextButton(
                onPressed: _rollDice,
                child: Image.asset("images/dice$leftDiceNumber.png"),
              ),
            ),
            Expanded(
              child: TextButton(
                onPressed: _rollDice,
                child: Image.asset("images/dice$rightDiceNumber.png"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
