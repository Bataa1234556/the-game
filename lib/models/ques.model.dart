import 'char.model.dart';

class WordFindQues {
  String pathImage;
  String answer;
  int idx;
  bool isDone = false;
  bool isFull = false;
  List<WordFindChar> puzzles = []; // Using a literal list
  List<String> arrayBtns = []; // Using a literal list


  WordFindQues({
    this.pathImage = '',
    this.answer = '',
    this.idx = 1,
    List<WordFindChar> puzzles = const [], // Add default value
    List<String> arrayBtns = const [], // Add default value
  });


  void setWordFindChar(List<WordFindChar> puzzles) => this.puzzles = puzzles;

  void setIsDone() => isDone = true;

  bool fieldCompleteCorrect() {
    // lets declare class WordFindChar 1st
    // check all field already got value
    // fix color red when value not full but show red color
    bool complete =
        puzzles.where((puzzle) => puzzle.currentValue == null).isEmpty;

    if (!complete) {
      // no complete yet
      isFull = false;
      return complete;
    }

    isFull = true;
    // if already complete, check correct or not

    String answeredString =
    puzzles.map((puzzle) => puzzle.currentValue).join("");

    // if same string, answer is correct..yeay
    return answeredString == answer;
  }

  // more prefer name.. haha
  WordFindQues clone() {
    return WordFindQues(
      answer: answer,
      pathImage: pathImage,
    );
  }

// lets generate sample question
}