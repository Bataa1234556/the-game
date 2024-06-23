import 'package:flutter/material.dart';
import 'package:icode_test/pages/start.dart';
import 'package:icode_test/widgets/gradient_letter_widget.dart';
import 'package:icode_test/widgets/gradient_text_widget.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) => Scaffold(
        backgroundColor: const Color(0xFFFBF5F2),
        body: SafeArea(
          child: Center(
              child: Container(
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage("assets/images/back1.png"),
                        fit: BoxFit.cover),
                  ),
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        const Padding(padding: EdgeInsets.only(top: 50.0)),
                        const Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            GradientLetter(
                                'W',
                                60,
                                60,
                                32,
                                16,
                                8,
                                38,
                                Color.fromRGBO(255, 144, 2, 0),
                                Color(0xFFE48000)),
                            Padding(padding: EdgeInsets.only(left: 10.0)),
                            GradientLetter(
                                'O',
                                60,
                                60,
                                32,
                                16,
                                8,
                                38,
                                Color.fromRGBO(255, 144, 2, 0),
                                Color(0xFFE48000)),
                            Padding(padding: EdgeInsets.only(left: 10.0)),
                            GradientLetter(
                                'R',
                                60,
                                60,
                                32,
                                16,
                                8,
                                38,
                                Color.fromRGBO(255, 144, 2, 0),
                                Color(0xFFE48000)),
                            Padding(padding: EdgeInsets.only(left: 10.0)),
                            GradientLetter(
                                'D',
                                60,
                                60,
                                32,
                                16,
                                8,
                                38,
                                Color.fromRGBO(255, 144, 2, 0),
                                Color(0xFFE48000)),
                          ],
                        ),
                        const GradientText(
                            'GAME', "Ribeye", 31.6, 0.0661, 0.761, false),
                        const Padding(padding: EdgeInsets.only(top: 30.0)),
                        Image.asset(
                          'assets/images/icodeGuy.png',
                          width: 212,
                          // height: 200,
                        ),
                        const Padding(padding: EdgeInsets.only(top: 50.0)),
                        const GradientText(
                            'READY?', "Ribeye", 25.0, 0.661, 0.961, false),
                        const Padding(padding: EdgeInsets.only(top: 25.0)),
                        Container(
                          width: 310,
                          height: 60,
                          decoration: BoxDecoration(
                            gradient: const LinearGradient(
                                begin: Alignment.centerLeft,
                                end: Alignment.centerRight,
                                transform: GradientRotation(0),
                                colors: [
                                  Color(0xFFE86B02),
                                  Color(0xFFFA9541),
                                ]),
                            borderRadius: BorderRadius.circular(25),
                          ),
                          child: ElevatedButton(
                            onPressed: () {
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                    builder: (context) => const StartPage()),
                              );
                            },
                            style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.transparent,
                                elevation: 0,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(25))),
                            child: const Text(
                              'PLAY',
                              style: TextStyle(
                                  fontFamily: 'Nunito',
                                  fontSize: 24,
                                  fontWeight: FontWeight.w700),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ))),
        ),
      );
}
