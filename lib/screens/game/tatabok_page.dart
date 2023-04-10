import 'dart:math';

import 'package:flutter/material.dart';

class TataboqPage extends StatefulWidget {
  const TataboqPage({Key? key}) : super(key: key);

  @override
  State<TataboqPage> createState() => _TataboqPageState();
}

Random random = Random();

class _TataboqPageState extends State<TataboqPage> {
  int num1 = 1;
  int num2 = 2;
  int score = 0;
  bool succes1 = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white.withOpacity(0.99),
      appBar: AppBar(
        backgroundColor: Colors.blue[200],
        title: const Text(
          'لعبة التطابق',
          style: TextStyle(fontFamily: 'Cairo', fontSize: 25),
        ),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  'Score: $score',
                  style: const TextStyle(fontSize: 18.0),
                ),
              )
            ],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              succes1
                  ? Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                          Text('مبروك لقد نجحت ',
                              style: TextStyle(
                                  color: Colors.black45, fontSize: 29.0)),
                        ])
                  : Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Text('حاول مرة أخرى',
                            style: TextStyle(
                                color: Colors.black45, fontSize: 29.0))
                      ],
                    ),
              GestureDetector(
                onTap: () {
                  setState(() {
                    num1 = random.nextInt(5) + 1;
                    num2 = random.nextInt(5) + 1;
                  });
                  setState(() {});
                  if (num1.toString() == num2.toString()) {
                    setState(() {
                      succes1 = true;
                      score++;
                    });
                  } else {
                    setState(() {
                      succes1 = false;
                    });
                  }
                },
                child: Row(
                  children: [
                    Expanded(
                        flex: 1,
                        child: Padding(
                          padding: const EdgeInsets.fromLTRB(50, 50, 25, 50),
                          child: SizedBox(
                            width: 300,
                            height: 300,
                            child: Image.asset(
                              'assets/images/$num1.png',
                              fit: BoxFit.contain,
                            ),
                          ),
                        )),
                    Expanded(
                        flex: 1,
                        child: Padding(
                          padding: const EdgeInsets.fromLTRB(25, 50, 50, 50),
                          child: SizedBox(
                            width: 300,
                            height: 300,
                            child: Image.asset(
                              'assets/images/$num2.png',
                              fit: BoxFit.contain,
                            ),
                          ),
                        )),
                  ],
                ),
              ),
              SizedBox(
                width: double.infinity,
                height: MediaQuery.of(context).size.height * 0.2,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
