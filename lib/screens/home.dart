import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  bool isTurnO = true;
  List<String> xOrOList = ['', '', '', '', '', '', '', '', ''];
  int filledBoxes = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[900],
      appBar: AppBar(
        title: const Text(
          'TicTacToe',
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.grey[900],
        actions: [
          IconButton(
              onPressed: () {
                cleanGame();
              },
              icon: const Icon(
                Icons.refresh,
                color: Colors.white,
                size: 30,
              ))
        ],
      ),
      body: SafeArea(
        child: Column(
          children: [
            const SizedBox(height: 20),
            getScoreBorad(),
            const SizedBox(height: 40),
            getGridView(),
            getTurn()
          ],
        ),
      ),
    );
  }

  Text getTurn() {
    return Text(
      isTurnO ? 'Turn O' : 'Turn X',
      style: const TextStyle(
        color: Colors.white,
        fontSize: 20.0,
        fontWeight: FontWeight.bold,
      ),
    );
  }

  Widget getGridView() {
    return Expanded(
      child: GridView.builder(
        itemCount: 9,
        gridDelegate:
            const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
        itemBuilder: (BuildContext context, int index) {
          return GestureDetector(
            onTap: () {
              tapped(index);
            },
            child: Container(
              width: 100,
              height: 100,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey),
              ),
              child: Center(
                child: Text(
                  xOrOList[index],
                  style: TextStyle(
                    fontSize: 60,
                    fontWeight: FontWeight.bold,
                    color: xOrOList[index] == 'X'
                        ? Colors.white
                        : Colors.blueAccent,
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  void tapped(int index) {
    setState(() {
      if (xOrOList[index] != '') {
        return;
      }

      if (isTurnO) {
        xOrOList[index] = 'O';
        filledBoxes = filledBoxes + 1;
      } else {
        xOrOList[index] = 'X';
        filledBoxes = filledBoxes + 1;
      }
      isTurnO = !isTurnO;

      checkWineer();
    });
  }

  void checkWineer() {
    if (xOrOList[0] == xOrOList[1] &&
        xOrOList[0] == xOrOList[2] &&
        xOrOList[0] != '') {
      print(xOrOList[0] + ' is winner');
      return;
    }

    if (xOrOList[3] == xOrOList[4] &&
        xOrOList[3] == xOrOList[5] &&
        xOrOList[3] != '') {
      print(xOrOList[3] + ' is winner');
      return;
    }

    if (xOrOList[6] == xOrOList[7] &&
        xOrOList[6] == xOrOList[8] &&
        xOrOList[6] != '') {
      print(xOrOList[6] + ' is winner');
      return;
    }

    if (xOrOList[0] == xOrOList[3] &&
        xOrOList[0] == xOrOList[6] &&
        xOrOList[0] != '') {
      print(xOrOList[0] + ' is winner');
      return;
    }

    if (xOrOList[1] == xOrOList[4] &&
        xOrOList[1] == xOrOList[7] &&
        xOrOList[1] != '') {
      print(xOrOList[1] + ' is winner');
      return;
    }

    if (xOrOList[2] == xOrOList[5] &&
        xOrOList[2] == xOrOList[8] &&
        xOrOList[2] != '') {
      print(xOrOList[2] + ' is winner');
      return;
    }

    if (xOrOList[0] == xOrOList[4] &&
        xOrOList[0] == xOrOList[8] &&
        xOrOList[0] != '') {
      print(xOrOList[0] + ' is winner');
      return;
    }

    if (xOrOList[2] == xOrOList[4] &&
        xOrOList[2] == xOrOList[6] &&
        xOrOList[2] != '') {
      print(xOrOList[2] + ' is winner');
      return;
    }

    if (filledBoxes == 9) {
      print('Game is equal');
    }
  }

  Widget getScoreBorad() {
    return const Row(
      children: [
        Expanded(
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.all(8.0),
                child: Text(
                  'Player O',
                  style: TextStyle(fontSize: 25.0, color: Colors.white),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(8.0),
                child: Text(
                  '0',
                  style: TextStyle(fontSize: 25.0, color: Colors.white),
                ),
              ),
            ],
          ),
        ),
        Expanded(
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.all(8.0),
                child: Text(
                  'Player X',
                  style: TextStyle(fontSize: 25.0, color: Colors.white),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(8.0),
                child: Text(
                  '0',
                  style: TextStyle(fontSize: 25.0, color: Colors.white),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  void cleanGame() {
    setState(() {
      for (var i = 0; i < xOrOList.length; i++) {
        xOrOList[i] = '';
      }
      filledBoxes = 0;
    });
  }
}
