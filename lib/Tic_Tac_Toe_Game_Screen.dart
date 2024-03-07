import 'package:flutter/material.dart';
import 'package:tic/text_widets.dart';


class TicTacToeGameScreen extends StatefulWidget {
  @override
  _TicTacToeGameScreenState createState() => _TicTacToeGameScreenState();
}

class _TicTacToeGameScreenState extends State<TicTacToeGameScreen> {
  List<List<String>>? _gameBoard;
  bool? _player1Turn;

  @override
  void initState() {
    super.initState();
    _initializeBoard();
  }

  void _initializeBoard() {
    _gameBoard = List.generate(3, (_) => List.filled(3, ''));
    _player1Turn = true;
  }

  void _onTilePressed(int row, int col) {
    if (_gameBoard![row][col] == '') {
      setState(() {
        _gameBoard![row][col] = _player1Turn! ? 'X' : 'O';
        _player1Turn = !_player1Turn!;
      });
    }
  }

  Widget _buildTile(int row, int col) {
    return GestureDetector(
      onTap: () => _onTilePressed(row, col),
      child: Container(
        margin: EdgeInsets.all(5),
        width: 100,
        height: 100,
        decoration: BoxDecoration(
          border: Border.all(color: Colors.deepOrange),
        ),
        child: Center(
          child: normalText(
            title: _gameBoard![row][col],
          ),
        ),
      ),
    );
  }

  Widget _buildBoard() {
    List<Widget> rows = [];
    for (int i = 0; i < 3; i++) {
      List<Widget> cols = [];
      for (int j = 0; j < 3; j++) {
        cols.add(_buildTile(i, j));
      }
      rows.add(Row(children: cols));
    }
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: rows,
    );
  }

  void _resetGame() {
    setState(() {
      _initializeBoard();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: largeText(title: 'Tic Tac Toe'),
        actions: [
          IconButton(
            icon: Icon(Icons.refresh,color: Colors.deepOrange,size: 30,),
            onPressed: _resetGame,
          ),
        ],
      ),
      body: Center(
        child: _buildBoard(),
      ),
    );
  }
}
