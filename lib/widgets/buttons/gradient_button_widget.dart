import 'package:flutter/material.dart';
import 'package:icode_test/pages/game.dart';

class MutableGradientButton extends GradientButton {
  const MutableGradientButton(
      String text,
      double width,
      double height,
      double size,
      Color color1,
      Color color2, {
        Key? key,
      }) : super(
    text,
    width,
    height,
    size,
    color1,
    color2,
    key: key,
  );
}

class GradientButton extends StatelessWidget {
  final String text;
  final double width;
  final double height;
  final double size;
  final Color color1;
  final Color color2;

  const GradientButton(
      this.text,
      this.width,
      this.height,
      this.size,
      this.color1,
      this.color2, {
        Key? key,
      }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
              colors: [
                color1,
                color2,
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
            /*shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(40))*/),
          child: Text(
            text,
            style: TextStyle(
                fontFamily: 'Nunito',
                fontSize: size,
                fontWeight: FontWeight.w700),
          ),
        ),
      )
    );
  }
}