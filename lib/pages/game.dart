import 'package:flutter/material.dart';
import '../models/ques.model.dart';
import '../widgets/word_find_widget.dart';

class WordFind extends StatefulWidget {
  const WordFind({Key? key}) : super(key: key);

  @override
  WordFindState createState() => WordFindState();
}

class WordFindState extends State<WordFind> {
  GlobalKey<WordFindWidgetState> globalKey = GlobalKey();
  late List<WordFindQues> listQuestions = [];

  @override
  void initState() {
    super.initState();
    listQuestions = [
      WordFindQues(
        answer: "mickey",
        idx: 1,
        pathImage: "assets/images/IMG.png",
      ),
      WordFindQues(
        answer: "elsa",
        idx: 2,
        pathImage: "assets/images/elsa.png",
      ),
      WordFindQues(
        answer: "totoro",
        idx: 3,
        pathImage: "assets/images/totoro.jpeg",
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFBF5F2),
      body: SafeArea(
        child: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage("assets/images/back2.png"),
                fit: BoxFit.cover),
          ),
          child: Column(
            children: [
              Expanded(
                child: LayoutBuilder(
                  builder: (context, constraints) {
                    return WordFindWidget(
                      size: constraints.biggest,
                      listQuestions: [
                        ...listQuestions.map((ques) => ques.clone())
                      ],
                      key: globalKey,
                    );
                  },
                ),
              ),
              Container(
                height: 48,
                color: Colors.white,
                padding:
                    const EdgeInsets.only(left: 30, right: 265, bottom: 15),
                child: OutlinedButton(
                    style: OutlinedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 2),
                      backgroundColor: Colors.white,
                      side: const BorderSide(color: Colors.orange, width: 0.5),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(11.0),
                      ),
                    ),
                    onPressed: () {
                      globalKey.currentState?.generatePuzzle(
                        loop: [...listQuestions.map((ques) => ques.clone())],
                      );
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        SizedBox(
                          width: 22,
                          height: 18,
                          child: Image.asset("assets/images/reload.png"),
                        ),
                        const Padding(padding: EdgeInsets.only(left: 5)),
                        const Text(
                          "reset",
                          style: TextStyle(
                              color: Color(0xFFFF9002),
                              fontFamily: "OktaNeue",
                              fontSize: 20),
                        ),
                      ],
                    )),
              )
            ],
          ),
        ),
      ),
    );
  }
}
