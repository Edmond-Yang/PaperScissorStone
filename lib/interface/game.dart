import 'dart:math';

import 'package:flutter/material.dart';

class Game extends StatefulWidget {
  const Game({Key? key}) : super(key: key);

  @override
  _GameState createState() => _GameState();
}

class _GameState extends State<Game> {
  int cntPlayer = 0;
  int cntComputer = 0;
  String announce = 'No One';

  List _colorComputer = [Colors.grey[350], Colors.grey[350], Colors.grey[350]];
  List _colorPlayer = [Colors.grey[350], Colors.grey[350], Colors.grey[350]];

  @override
  void initState() {
    super.initState();
  }

  void resetScore() {
    setState(() {
      cntComputer = 0;
      cntPlayer = 0;
      announce = 'No One';
    });
  }

  void resetColor() {
    setState(() {
      _colorComputer = [Colors.grey[350], Colors.grey[350], Colors.grey[350]];
      _colorPlayer = [Colors.grey[350], Colors.grey[350], Colors.grey[350]];
    });
  }

  void isWin(int computer, int player) {
    if (computer == player)
      announce = 'Fair';
    else if ((computer == 0 && player == 1) ||
        (computer == 1 && player == 2) ||
        (computer == 2 && player == 0)) {
      announce = 'Computer';
      cntComputer++;
    } else {
      announce = 'Player';
      cntPlayer++;
    }
  }

  int computerValue() {
    int num = Random().nextInt(3);
    _colorComputer[num] = Colors.amber;
    return num;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green[900],
        title: Text(
          'Paper Scissors Stone',
          style: TextStyle(
              fontFamily: 'Nunito',
              fontSize: 27.0,
              fontWeight: FontWeight.w300),
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          SizedBox(
            height: 20.0,
          ),
          Center(
            child: ClipRect(
                child: Container(
              padding: EdgeInsets.fromLTRB(50.0, 5.0, 50.0, 5.0),
              color: Colors.grey,
              child: Text(
                'Winner  :   $announce',
                style: TextStyle(
                    fontFamily: 'Nunito',
                    fontSize: 27.0,
                    fontWeight: FontWeight.w300),
              ),
            )),
          ),
          SizedBox(height: 10.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text(
                'Computer',
                style: TextStyle(
                    fontFamily: 'Nunito',
                    fontSize: 27.0,
                    fontWeight: FontWeight.w300),
              ),
              SizedBox(width: 10.0),
              Text(
                'Player',
                style: TextStyle(
                    fontFamily: 'Nunito',
                    fontSize: 27.0,
                    fontWeight: FontWeight.w300),
              ),
            ],
          ),
          SizedBox(height: 10.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text(
                'Win: $cntComputer',
                style: TextStyle(
                    fontFamily: 'Nunito',
                    fontSize: 27.0,
                    fontWeight: FontWeight.w300),
              ),
              SizedBox(width: 10.0),
              Text(
                'Win: $cntPlayer',
                style: TextStyle(
                    fontFamily: 'Nunito',
                    fontSize: 27.0,
                    fontWeight: FontWeight.w300),
              ),
            ],
          ),
          SizedBox(height: 15.0),
          Row(
            children: [
              SizedBox(
                width: 50.0,
              ),
              Container(
                padding: EdgeInsets.fromLTRB(5.0, 65.0, 5.0, 65.0),
                color: _colorComputer[1],
              ),
              SizedBox(
                width: 60.0,
              ),
              IconButton(
                icon: Image.asset('images/scissors.png'),
                onPressed: () {
                  setState(() {
                    resetColor();
                    int _num = computerValue();
                    _colorPlayer[1] = Colors.amber;
                    isWin(_num, 1);
                  });
                },
                iconSize: 130.0,
              ),
              SizedBox(
                width: 60.0,
              ),
              Container(
                padding: EdgeInsets.fromLTRB(5.0, 65.0, 5.0, 65.0),
                color: _colorPlayer[1],
              ),
            ],
          ),
          SizedBox(
            height: 20.0,
          ),
          Row(
            children: [
              SizedBox(
                width: 50.0,
              ),
              Container(
                padding: EdgeInsets.fromLTRB(5.0, 65.0, 5.0, 65.0),
                color: _colorComputer[0],
              ),
              SizedBox(
                width: 70.0,
              ),
              IconButton(
                icon: Image.asset('images/stone.png'),
                onPressed: () {
                  setState(() {
                    resetColor();
                    int _num = computerValue();
                    _colorPlayer[0] = Colors.amber;
                    isWin(_num, 0);
                  });
                },
                iconSize: 110.0,
              ),
              SizedBox(
                width: 70.0,
              ),
              Container(
                padding: EdgeInsets.fromLTRB(5.0, 65.0, 5.0, 65.0),
                color: _colorPlayer[0],
              ),
            ],
          ),
          SizedBox(
            height: 20.0,
          ),
          Row(
            children: [
              SizedBox(
                width: 50.0,
              ),
              Container(
                padding: EdgeInsets.fromLTRB(5.0, 65.0, 5.0, 65.0),
                color: _colorComputer[2],
              ),
              SizedBox(
                width: 60.0,
              ),
              IconButton(
                icon: Image.asset('images/paper.png'),
                onPressed: () {
                  setState(() {
                    resetColor();
                    int _num = computerValue();
                    _colorPlayer[2] = Colors.amber;
                    isWin(_num, 2);
                  });
                },
                iconSize: 130.0,
              ),
              SizedBox(
                width: 60.0,
              ),
              Container(
                padding: EdgeInsets.fromLTRB(5.0, 65.0, 5.0, 65.0),
                color: _colorPlayer[2],
              ),
            ],
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.green[900],
        child: Icon(Icons.restart_alt_outlined),
        onPressed: () {
          setState(() {
            resetScore();
            resetColor();
          });
        },
      ),
    );
  }
}
