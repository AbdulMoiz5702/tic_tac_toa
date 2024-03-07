import 'dart:math';
import 'package:flutter/material.dart';
import 'package:tic/text_widets.dart';

import 'custom_button.dart';


class NumberGuessingGameScreen extends StatefulWidget {
  @override
  _NumberGuessingGameScreenState createState() =>
      _NumberGuessingGameScreenState();
}

class _NumberGuessingGameScreenState extends State<NumberGuessingGameScreen> {
  final _random = Random();
  int? _targetNumber;
  int? _guess;
  String? _feedback;

  @override
  void initState() {
    super.initState();
    _resetGame();
  }

  void _resetGame() {
    _targetNumber = _random.nextInt(100) + 1;
    _guess = null;
    _feedback = null;
  }

  void _checkGuess() {
    setState(() {
      if (_guess == _targetNumber) {
        _feedback = 'Congratulations! You guessed it right!';
      } else if (_guess! < _targetNumber!) {
        _feedback = 'Too low. Try again!';
      } else {
        _feedback = 'Too high. Try again!';
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: largeText(title: 'Number Guessing Game'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            normalText(
              title: 'Guess a number between 1 and 100:',
            ),
            SizedBox(height: MediaQuery.sizeOf(context).height * 0.05),
            TextFormField(
              style: TextStyle(color: Colors.white),
              decoration: InputDecoration(
                focusedBorder:  OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: const BorderSide(color: Colors.deepOrange),
                ),
                  border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: const BorderSide(color: Colors.deepOrange),
              ),
              ),
              keyboardType: TextInputType.number,
              onChanged: (value) {
                setState(() {
                  _guess = int.tryParse(value);
                });
              },
            ),
            SizedBox(height: MediaQuery.sizeOf(context).height * 0.05),
            CustomButton(
              title: 'Check',
              onTap:() {
                _checkGuess();
              },
            ),
            SizedBox(height: MediaQuery.sizeOf(context).height * 0.05),
            if (_feedback != null)
              normalText(
                title: _feedback!,
              ),
            SizedBox(height: MediaQuery.sizeOf(context).height * 0.05),
            CustomButton(
              title: 'Reset',
              onTap: () {
                setState(() {
                  _resetGame();
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}
