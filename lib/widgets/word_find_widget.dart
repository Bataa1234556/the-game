import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:icode_test/models/char.model.dart';
import 'package:icode_test/widgets/gradient_letter_widget.dart';
import 'package:icode_test/widgets/gradient_text_widget.dart';
import 'package:icode_test/widgets/image_widget.dart';
import 'package:icode_test/widgets/modals/modal_widget.dart';
import 'package:icode_test/widgets/modals/exit_modal_widget.dart';
import 'package:word_search_safety/word_search_safety.dart';
import 'dart:math';
import '../models/ques.model.dart';

class WordFindWidget extends StatefulWidget {
  final Size size;
  final List<WordFindQues> listQuestions;

  const WordFindWidget({
    required this.size,
    required this.listQuestions,
    Key? key,
  }) : super(key: key);

  @override
  State<WordFindWidget> createState() => WordFindWidgetState();
}

class WordFindWidgetState extends State<WordFindWidget> {
  final nameBox = Hive.box("nameBox");

  late Size size;
  late List<WordFindQues> listQuestions;
  GlobalKey<WordFindWidgetState> globalKey = GlobalKey();

  int indexQues = 0;
  int hintCount = 0;
  int life = 5;
  int totalScore = 0;
  int incorrect = 0;
  String name = '';

  @override
  void initState() {
    super.initState();
    size = widget.size;
    listQuestions = widget.listQuestions;
    generatePuzzle();
    name = nameBox.get("name");
  }

  @override
  Widget build(BuildContext context) {
    WordFindQues currentQues = listQuestions[indexQues];

    void handleScore() {
      if (currentQues.isDone) {
        if (totalScore < 3) {
          totalScore = totalScore + 1;
        }
      } else if (currentQues.isFull) {
        incorrect = incorrect + 1;
        life = life - 1;
      }
      if (totalScore == listQuestions.length) {
        dialogBuilder(context, "WINNER!", "Play again");
      } else if (life == 0) {
        dialogBuilder(context, "GAME OVER", "Try again");
      }
    }

    return SizedBox(
        width: double.maxFinite,
        child: SingleChildScrollView(
          child: Column(
            children: [
              const Padding(padding: EdgeInsets.only(top: 8.0)),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextButton(
                      onPressed: () {
                        exitDialog(
                            context, "ARE YOU SURE TO QUIT?", "Yes", "No");
                      },
                      child: SizedBox(
                        width: 32,
                        child: Image.asset('assets/images/exit.png'),
                      )),
                  GradientText(name, "Ribeye", 24.0, 0.1661, 0.361, false),
                  Row(
                    children: [
                      SizedBox(
                        width: 24,
                        child: Image.asset('assets/images/trophy 1.png'),
                      ),
                      const Padding(padding: EdgeInsets.only(left: 5.0)),
                      GradientText(
                          "$totalScore", "Ribeye", 20.0, 0.1661, 0.361, false),
                      const Padding(padding: EdgeInsets.only(right: 15.0))
                    ],
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Padding(padding: EdgeInsets.only(top: 50.0)),
                  for (int i = 0; i < life; i++)
                    Row(
                      children: [
                        const Padding(padding: EdgeInsets.only(left: 5)),
                        SizedBox(
                          width: 25,
                          height: 25,
                          child: Image.asset('assets/images/orange.png'),
                        )
                      ],
                    ),
                  for (int i = 0; i < incorrect; i++)
                    Row(
                      children: [
                        const Padding(padding: EdgeInsets.only(left: 5)),
                        SizedBox(
                          width: 25,
                          height: 25,
                          child: Image.asset('assets/images/orangeGray.png'),
                        )
                      ],
                    ),
                ],
              ),
              const Padding(padding: EdgeInsets.only(top: 20.0)),
              GradientText("${indexQues + 1}/${listQuestions.length}", "Ribeye",
                  20.0, 0.1661, 0.361, false),
              Container(
                alignment: Alignment.center,
                padding:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: 32,
                      child: InkWell(
                        onTap: () => generatePuzzle(left: true),
                        child: Image.asset(indexQues == 0
                            ? 'assets/images/previousGray.png'
                            : 'assets/images/previous 1.png'),
                      ),
                    ),
                    const Padding(padding: EdgeInsets.only(left: 7)),
                    SizedBox(
                        width: 265,
                        height: 263,
                        child: StyledImage(
                          currentQues.pathImage,
                        )),
                    const Padding(padding: EdgeInsets.only(left: 7)),
                    SizedBox(
                      width: 32,
                      child: InkWell(
                        onTap: () => generatePuzzle(next: true),
                        child: Image.asset(indexQues + 1 == listQuestions.length
                            ? 'assets/images/nextGray.png'
                            : 'assets/images/next.png'),
                      ),
                    )
                  ],
                ),
              ),
              Container(
                padding: const EdgeInsets.only(top: 18.0),
                alignment: Alignment.center,
                child: LayoutBuilder(
                  builder: (context, constraints) {
                    return Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      mainAxisSize: MainAxisSize.max,
                      children: currentQues.puzzles.map((puzzle) {
                        // later change color based condition
                        Color color;

                        if (currentQues.isDone) {
                          color = Colors.green;
                        } else if (puzzle.hintShow) {
                          color = Colors.yellow;
                        } else if (currentQues.isFull) {
                          color = Colors.red;
                        } else {
                          color = const Color(0xFFE48000);
                        }

                        return InkWell(
                          onTap: () {
                            if (puzzle.hintShow || currentQues.isDone) return;

                            currentQues.isFull = false;
                            puzzle.clearValue();
                            setState(() {});
                          },
                          child: Container(
                            padding: const EdgeInsets.all(1),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12),
                            ),
                            alignment: Alignment.center,
                            margin: const EdgeInsets.all(3),
                            child: GradientLetter(
                                puzzle.currentValue?.toUpperCase() ?? '',
                                43,
                                43,
                                23,
                                11,
                                8,
                                40,
                                const Color.fromRGBO(255, 144, 2, 0),
                                color),
                          ),
                        );
                      }).toList(),
                    );
                  },
                ),
              ),
              Container(
                padding: const EdgeInsets.all(10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    InkWell(
                      onTap: () => generateHint(),
                      child: Row(
                        children: [
                          SizedBox(
                            width: 16,
                            height: 16,
                            child: Image.asset("assets/images/hint.png"),
                          ),
                          const Padding(padding: EdgeInsets.only(left: 3)),
                          const GradientText(
                              "Hint", "Comfortaa", 16, 0.5661, 0.761, true)
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              const Padding(padding: EdgeInsets.only(top: 40)),
              Container(
                margin: const EdgeInsets.all(0),
                height: 130,
                padding: const EdgeInsets.only(left: 27, right: 27, top: 24),
                decoration: const BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(24),
                      topRight: Radius.circular(24),
                    ),
                    color: Colors.white),
                alignment: Alignment.center,
                child: GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    childAspectRatio: 1,
                    crossAxisCount: 7,
                  ),
                  itemCount: 14,
                  shrinkWrap: false,
                  itemBuilder: (context, index) {
                    bool statusBtn = currentQues.puzzles.indexWhere(
                            (puzzle) => puzzle.currentIndex == index) >=
                        0;
                    double click = 1;

                    return LayoutBuilder(builder: (context, constraints) {
                      double clicked = statusBtn ? 0.3 : 1;

                      return Container(
                          alignment: Alignment.center,
                          child: Opacity(
                            opacity: clicked,
                            child: TextButton(
                              style: TextButton.styleFrom(
                                padding: const EdgeInsets.all(0),
                              ),
                              child: SizedBox(
                                  width: 40,
                                  child: Opacity(
                                    opacity: click,
                                    child: GradientLetter(
                                        currentQues.arrayBtns[index]
                                            .toUpperCase(),
                                        40,
                                        40,
                                        24,
                                        10,
                                        6,
                                        40,
                                        const Color.fromRGBO(255, 144, 2, 0),
                                        const Color.fromRGBO(228, 128, 0, 1)),
                                  )),
                              onPressed: () {
                                if (!statusBtn) {
                                  setBtnClick(index);
                                }
                                click = 0.3;
                                handleScore();
                              },
                            ),
                          ));
                    });
                  },
                ),
              ),
            ],
          ),
        ));
  }

  void generatePuzzle({
    List<WordFindQues>? loop,
    bool next = false,
    bool left = false,
  }) {
    if (loop != null) {
      indexQues = 0;
      listQuestions = [];
      listQuestions.addAll(loop);
    } else {
      if (next && indexQues < listQuestions.length - 1) {
        indexQues++;
      } else if (left && indexQues > 0) {
        indexQues--;
      } else if (indexQues >= listQuestions.length - 1) {
        return;
      }

      setState(() {});

      if (listQuestions[indexQues].isDone) return;
    }

    WordFindQues currentQues = listQuestions[indexQues];

    setState(() {});

    final List<String> wl = [currentQues.answer];

    final WSSettings ws = WSSettings(
      width: 14, // total random word row we want use
      height: 1,
      orientations: List.from([
        WSOrientation.horizontal,
      ]),
    );

    final WordSearchSafety wordSearch = WordSearchSafety();

    final WSNewPuzzle newPuzzle = wordSearch.newPuzzle(wl, ws);

    if (newPuzzle.errors != null && newPuzzle.errors!.isEmpty) {
      if (newPuzzle.puzzle != null) {
        currentQues.arrayBtns =
            newPuzzle.puzzle!.expand((list) => list).toList();
        currentQues.arrayBtns.shuffle();

        bool isDone = currentQues.isDone;

        if (!isDone) {
          currentQues.puzzles = List.generate(wl[0].split("").length, (index) {
            return WordFindChar(
              correctValue: currentQues.answer.split("")[index],
            );
          });
        }
      }
    }

    hintCount = 0;
    setState(() {});
  }

  generateHint() async {
    WordFindQues currentQues = listQuestions[indexQues];

    if (currentQues.isDone) {
      if (totalScore < 3) {
        totalScore = totalScore + 1;
      }
    }

    List<WordFindChar> puzzleNoHints =
        currentQues.puzzles.where((puzzle) => !puzzle.hintShow).toList();

    if (puzzleNoHints.isNotEmpty) {
      hintCount++;
      int indexHint = Random().nextInt(puzzleNoHints.length);
      int countTemp = 0;
      // print("hint $indexHint");

      currentQues.puzzles = currentQues.puzzles.map((puzzle) {
        if (!puzzle.hintShow) countTemp++;

        if (indexHint == countTemp - 1) {
          puzzle.hintShow = true;
          puzzle.currentValue = puzzle.correctValue;
          puzzle.currentIndex = currentQues.arrayBtns
              .indexWhere((btn) => btn == puzzle.correctValue);
        }

        return puzzle;
      }).toList();

      if (currentQues.fieldCompleteCorrect()) {
        currentQues.isDone = true;

        setState(() {});

        await Future.delayed(const Duration(seconds: 1));
        generatePuzzle(next: true);
      }
      setState(() {});
    }
  }

  Future<void> setBtnClick(int index) async {
    WordFindQues currentQues = listQuestions[indexQues];

    int currentIndexEmpty =
        currentQues.puzzles.indexWhere((puzzle) => puzzle.currentValue == null);

    if (currentIndexEmpty >= 0) {
      currentQues.puzzles[currentIndexEmpty].currentIndex = index;
      currentQues.puzzles[currentIndexEmpty].currentValue =
          currentQues.arrayBtns[index];

      if (currentQues.fieldCompleteCorrect()) {
        currentQues.isDone = true;

        setState(() {});

        await Future.delayed(const Duration(seconds: 1));
        generatePuzzle(next: true);
      }
      setState(() {});
    }
  }
}
