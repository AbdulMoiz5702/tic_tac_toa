import 'dart:async';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:tic/text_widets.dart';

import 'custom_button.dart';


class MemoryGameScreen extends StatefulWidget {
  @override
  _MemoryGameScreenState createState() => _MemoryGameScreenState();
}

class _MemoryGameScreenState extends State<MemoryGameScreen> {
  List<int> _items = [];
  List<bool> _revealed = [];
  int  ?_previousIndex;
  bool _isProcessing = false;
  Timer  ? _timer;
  int _pairsFound = 0;

  @override
  void initState() {
    super.initState();
    _initializeGame();
  }

  void _initializeGame() {
    _items.clear();
    _revealed.clear();
    _pairsFound = 0;
    // Increase the number of pairs to 10
    for (int i = 0; i < 24; i++) {
      _items.add(i ~/ 2);
      _revealed.add(false);
    }
    _items.shuffle();
  }

  void _onItemTapped(int index) {
    if (_isProcessing || _revealed[index]) return;

    setState(() {
      _revealed[index] = true;
    });

    if (_previousIndex != null) {
      _isProcessing = true;
      _timer = Timer(Duration(seconds: 1), () {
        if (_items[index] == _items[_previousIndex!]) {
          _pairsFound++;
          if (_pairsFound == 8) {
            _showWinDialog();
          }
        } else {
          setState(() {
            _revealed[_previousIndex!] = false;
            _revealed[index] = false;
          });
        }
        _isProcessing = false;
        _previousIndex = null;
      });
    } else {
      _previousIndex = index;
    }
  }

  void _showWinDialog() {
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title:largeText(title: 'Congratulations!'),
        content: normalText( title: 'You won the Memory Game!'),
        actions: [
          CustomButton(title: 'Play Again', onTap:  () {
        Navigator.pop(context);
        _initializeGame();
      },),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: largeText(title: 'Memory Game'),
      ),
      body: GridView.builder(
        gridDelegate:
       const  SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 4),
        itemCount: _items.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () => _onItemTapped(index),
            child: Card(
              color: Colors.deepOrange,
              child: Center(
                child: _revealed[index]
                    ? normalText(
                  title :_items[index].toString(),
                  textSize: 18.0,
                  fontWeight: FontWeight.bold,
                )
                    : const Text(''),
              ),
            ),
          );
        },
      ),
    );
  }
}
