import 'package:flutter/material.dart';
import 'package:icode_test/pages/game.dart';

class StartButton extends StatelessWidget{
  const StartButton({super.key});

  @override
  Widget build(BuildContext context) => Container(
      width: 310,
      height: 60,
      decoration: BoxDecoration(
        gradient: const LinearGradient(
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
            colors: [
              Color(0xFFE86B02),
              Color(0xFFFA9541),
            ]),
        borderRadius: BorderRadius.circular(25),
      ),
      child: ElevatedButton(
        onPressed: () {
          Navigator.of(context).push(
            MaterialPageRoute(builder: (context) => const WordFind()),
          );
        },
        style: ElevatedButton.styleFrom(
            backgroundColor: Colors.transparent,
            elevation: 0,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20))),
        child: const Text(
          'START',
          style: TextStyle(
              fontFamily: 'Nunito',
              fontSize: 24,
              fontWeight: FontWeight.w700),
        ),
      ),
  );
}