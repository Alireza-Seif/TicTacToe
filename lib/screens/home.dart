import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  bool isTurnO = true;
  List<String> xOrOList = ['', '', '', '', '', '', '', '', ''];
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
              child: Text(
                xOrOList[index],
                style: TextStyle(
                  fontSize: 60,
                  color: Colors.white,
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  void tapped(int index) {
    print('click on $index');
    setState(() {
      if (isTurnO && xOrOList[index] == '') {
        xOrOList[index] = 'O';
        isTurnO = false;
      }
      if (!isTurnO && xOrOList[index] == '') {
        xOrOList[index] = 'X';
        isTurnO = true;
      }
    });
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
}
