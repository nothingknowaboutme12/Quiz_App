import 'package:flutter/material.dart';
import 'package:quiz_app/Wdget/Button.dart';
import 'package:quiz_app/Wdget/Text.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int totalScore = 0;
  List<Map<String, Object>> question = [
    {
      'questiontext': 'What is your favourite color',
      'questionAnswer': [
        {'name': 'Black', 'value': 20},
        {'name': 'Red', 'value': 10},
        {'name': 'Green', 'value': 15},
        {'name': 'white', 'value': 20}
      ]
    },
    {
      'questiontext': 'What is your favourite car',
      'questionAnswer': [
        {'name': 'Audio', 'value': 5},
        {'name': 'LandCrosser', 'value': 15},
        {'name': 'civic', 'value': 10},
        {'name': 'Honda civic', 'value': 20}
      ]
    },
    {
      'questiontext': 'What is your favourite game',
      'questionAnswer': [
        {'name': 'football', 'value': 5},
        {'name': 'cricket', 'value': 20},
        {'name': 'glow', 'value': 10},
        {'name': 'basketball', 'value': 15}
      ]
    },
    {
      'questiontext': 'whait is your favourite food dish',
      'questionAnswer': [
        {'name': 'Biryani', 'value': 15},
        {'name': 'Chicken Roast', 'value': 5},
        {'name': 'Mix vegetable', 'value': 20},
        {'name': 'Boneless Karyie', 'value': 20},
      ]
    },
    {
      'questiontext': 'whait is your favourite shoes Brand',
      'questionAnswer': [
        {'name': 'nike', 'value': 5},
        {'name': 'Addidas', 'value': 10},
        {'name': 'Bata', 'value': 15},
        {'name': 'zstore', 'value': 20}
      ]
    },
  ];
  int questionNumber = 0;
  void onpressed(int score) {
    setState(() {
      questionNumber++;
      totalScore += score;
    });
  }

  UpdateUi() {
    if (totalScore < 50) {
      return "You are very good choice hope so Enjoy good life👌👌";
    }
    if (totalScore < 100) {
      return "You are doing best but update yourself a litle bit 👌👌";
    }
    if (totalScore < 150) {
      return "Your condition is not too bad try to update yourself";
    }
    if (totalScore < 200) {
      return "Bad choice Update yourself 🤨😗😮";
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "QuiZ App",
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text("Quiz App"),
          centerTitle: true,
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: questionNumber < 5
              ? Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Question(
                        questions:
                            question[questionNumber]['questiontext'] as String),
                    ...(question[questionNumber]['questionAnswer']
                            as List<Map<String, Object>>)
                        .map((answer) => Button(
                              ButtonValue: answer['name'] as String,
                              onpressed: () =>
                                  onpressed(answer['value'] as int),
                            )),
                  ],
                )
              : Container(
                  child: Center(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: Center(

                            child: Text(UpdateUi(),style: TextStyle(
                              fontSize: 24,

                            ),),
                          ),
                        ),
                        Button(
                            onpressed: () {
                              setState(() {
                                questionNumber = 0;
                              });
                            },
                            ButtonValue: "Reset now")
                      ],
                    ),
                  ),
                ),
        ),
      ),
    );
  }
}
