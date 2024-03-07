import 'package:flutter/material.dart';

import 'Memory_Game_Screen.dart';
import 'Number_Guessing_Game.dart';
import 'Tic_Tac_Toe_Game_Screen.dart';




class BottomScreen extends StatefulWidget {
  const BottomScreen({super.key});



  @override
  State<BottomScreen> createState() => _BottomScreenState();
}

class _BottomScreenState extends State<BottomScreen> {
  int indexx = 0;
  List<Widget> screens= [
    NumberGuessingGameScreen(),
    MemoryGameScreen(),
    TicTacToeGameScreen(),
  ];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screens[indexx],
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.black,
        currentIndex: indexx,
        type:BottomNavigationBarType.fixed,
        selectedFontSize: 14.0,
        unselectedFontSize: 10.0,
        selectedIconTheme: const IconThemeData(color: Colors.red),
        unselectedIconTheme:const  IconThemeData(color: Colors.orangeAccent),
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.white54,
        onTap: (index){
          indexx=index;
          setState(() {
          });
        },
        items: const [
          BottomNavigationBarItem(icon:Icon(Icons.hub_outlined),label:'Guess'),
          BottomNavigationBarItem(icon:Icon(Icons.spoke_outlined),label:'Memory'),
          BottomNavigationBarItem(icon:Icon(Icons.dialpad_outlined),label:'Tic Toe'),
        ],
      ),
    );
  }
}
