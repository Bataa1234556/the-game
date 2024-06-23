import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:icode_test/widgets/gradient_letter_widget.dart';
import 'package:icode_test/widgets/gradient_text_widget.dart';
import 'package:icode_test/widgets/buttons/start_button.dart';

class StartPage extends StatefulWidget {
  const StartPage({super.key});

  @override
  State<StartPage> createState() => _StartPageState();
}

class _StartPageState extends State<StartPage> {
  final nameBox = Hive.box("nameBox");

  final _textController = TextEditingController();
  String name = '';
  bool isReady = false;

  void start(){
    setState(() {
      isReady = true;
    });
  }

  void writeName(){
    nameBox.put("name", name);
  }

  @override
  Widget build(BuildContext context) => Container(
      color: const Color(0xFFFBF5F2),
      child: Container(
        height: 800,
        decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage("assets/images/back2.png"),
              fit: BoxFit.cover),
        ),
        child: Scaffold(
            backgroundColor: Colors.transparent,
            body: SafeArea(
              child: SingleChildScrollView(
                  child: Center(
                    child: Column(
                      children: [
                        const Padding(padding: EdgeInsets.only(top: 8.0)),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            TextButton(
                                onPressed: () {
                                  Navigator.of(context).pop(
                                    MaterialPageRoute(builder: (context) => const StartPage()),
                                  );
                                },
                                child: SizedBox(
                                  width: 32,
                                  child: Image.asset('assets/images/previous 1.png'),
                                )
                            ),

                            const Padding(padding: EdgeInsets.only(left: 8.0)),
                            const Column(
                                children: [
                                  Row(
                                    children: [
                                      Padding(padding: EdgeInsets.only(left: 75.0)),
                                      GradientLetter('W', 23, 23, 14.5, 7, 3, 45, Color.fromRGBO(255, 144, 2, 0),
                                          Color(0xFFE48000)),
                                      Padding(padding: EdgeInsets.only(left: 3.81)),
                                      GradientLetter('O', 23, 23, 14.5, 7, 3, 45, Color.fromRGBO(255, 144, 2, 0),
                                          Color(0xFFE48000)),
                                      Padding(padding: EdgeInsets.only(left: 3.81)),
                                      GradientLetter('R', 23, 23, 14.5, 7, 3, 45, Color.fromRGBO(255, 144, 2, 0),
                                          Color(0xFFE48000)),
                                      Padding(padding: EdgeInsets.only(left: 3.81)),
                                      GradientLetter('D', 23, 23, 14.5, 7, 3, 45, Color.fromRGBO(255, 144, 2, 0),
                                          Color(0xFFE48000)),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      Padding(padding: EdgeInsets.only(left: 75.0)),
                                      GradientText('GAME', "Ribeye", 12.06, 0.8661, 0.761, false),
                                    ],
                                  )
                                ]
                            ),
                          ],
                        ),
                        const Padding(padding: EdgeInsets.only(top: 67.0)),
                        Image.asset(
                          'assets/images/icodeGuyHead.png',
                          width: 184,
                          // height: 200,
                        ),
                        const Padding(padding: EdgeInsets.only(top: 30.0)),
                        const GradientText('Player name', "Ribeye", 20.0, 0.0661, 0.761, false),

                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 40.0, vertical: 10.0),
                          child: Center(
                            child: TextField(
                              controller: _textController,
                              onChanged: (text){
                                setState(() {
                                  name = text;
                                  writeName();
                                });
                              },
                              cursorColor: const Color(0xFFE86B02),
                              onSubmitted: (_) => start(),
                              style: TextStyle(
                                fontFamily: "Nunito",
                                fontSize: 18,
                                fontWeight: FontWeight.w600,
                                foreground: Paint()
                                  ..shader = const LinearGradient(
                                    colors: [
                                      Color(0xFFFA9541),
                                      Color(0xFFE86B02),
                                    ],
                                    begin: Alignment.topLeft,
                                    end: Alignment.bottomRight,
                                    stops: [0.2661, 0.961],
                                    transform: GradientRotation(8.82),
                                  ).createShader(const Rect.fromLTWH(0.0, 0.0, 200.0, 70.0)),
                              ),
                              decoration: InputDecoration(
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(25),
                                      borderSide: BorderSide.none
                                  ),
                                  hintText: 'Type here',
                                  filled: true,
                                  fillColor: Colors.white,
                                  suffixIcon: IconButton(
                                    onPressed: () {
                                      _textController.clear();
                                    },
                                    color: const Color(0xFFE86B02),
                                    icon: const Icon(Icons.clear),
                                  )
                              ),
                            ),
                          ),
                        ),

                        const Padding(padding: EdgeInsets.only(top: 18.0)),
                        if(isReady)
                          const StartButton()
                      ],
                    ),
                  )
              ),
            )
        ),
      )
  );
}