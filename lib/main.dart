import 'dart:math';

import 'package:flutter/material.dart';

void main() {
  runApp(RockPaperScissorsApp());
}

class RockPaperScissorsApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Rock Paper Scissors',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: RockPaperScissorsHomePage(),
    );
  }
}

class RockPaperScissorsHomePage extends StatefulWidget {
  @override
  _RockPaperScissorsHomePageState createState() =>
      _RockPaperScissorsHomePageState();
}

class _RockPaperScissorsHomePageState extends State<RockPaperScissorsHomePage> {
  final List<String> choices = ['Rock', 'Paper', 'Scissors'];
  String playerChoice = '';
  String computerChoice = '';
  String result = '';
  int gamesPlayed = 0;
  int playerWins = 0;
  int computerWins = 0;

  void playGame(String playerChoice) {
    final Random random = Random();
    final int randomNumber = random.nextInt(3); // 0, 1, or 2

    setState(() {
      gamesPlayed++; // Increment games played

      this.playerChoice = playerChoice;
      this.computerChoice = choices[randomNumber];

      // Determine the winner
      if (this.playerChoice == this.computerChoice) {
        result = "It's a tie!";
      } else if ((this.playerChoice == 'Rock' && this.computerChoice == 'Scissors') ||
          (this.playerChoice == 'Paper' && this.computerChoice == 'Rock') ||
          (this.playerChoice == 'Scissors' && this.computerChoice == 'Paper')) {
        result = 'You win!';
        playerWins++; // Increment player wins
      } else {
        result = 'You lose!';
        computerWins++; // Increment computer wins
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Rock Paper Scissors'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Games played: $gamesPlayed',
              style: TextStyle(fontSize: 20.0),
            ),
            SizedBox(height: 20.0),
            Text(
              'Player wins: $playerWins',
              style: TextStyle(fontSize: 20.0),
            ),
            SizedBox(height: 20.0),
            Text(
              'Computer wins: $computerWins',
              style: TextStyle(fontSize: 20.0),
            ),
            SizedBox(height: 20.0),
            Text(
              'Choose your move:',
              style: TextStyle(fontSize: 20.0),
            ),
            SizedBox(height: 20.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: choices.map((choice) {
                return ElevatedButton(
                  onPressed: () {
                    playGame(choice);
                  },
                  child: Image.asset(
                    'assets/${choice.toLowerCase()}.png',
                    width: 100,
                    height: 100,
                  ),
                );
              }).toList(),
            ),
            SizedBox(height: 20.0),
            Text(
              'Your choice: $computerChoice',
              style: TextStyle(fontSize: 18.0),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 20.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Text(
                  'Computer\'s choice:',
                  style: TextStyle(fontSize: 18.0),
                ),
                Image.asset(
                  'assets/${computerChoice.toLowerCase()}.png',
                  width: 100,
                  height: 100,
                ),
              ],
            ),
            SizedBox(height: 20.0),
            Text(
              result,
              style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
