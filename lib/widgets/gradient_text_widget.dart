import 'package:flutter/material.dart';

class GradientText extends StatelessWidget {
  final dynamic text;
  final double size;
  final double stop1;
  final double stop2;
  final String font;
  final bool underline;

  const GradientText(
      this.text, this.font, this.size, this.stop1, this.stop2, this.underline,
      {super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: TextAlign.center,
      style: TextStyle(
        decoration:
            underline == true ? TextDecoration.underline : TextDecoration.none,
        decorationColor: const Color(0xFFE86B02),
        fontFamily: font,
        fontSize: size,
        foreground: Paint()
          ..shader = LinearGradient(
            colors: const [
              Color(0xFFFA9541),
              Color(0xFFE86B02),
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            stops: [stop1, stop2],
            transform: const GradientRotation(8.82),
          ).createShader(const Rect.fromLTWH(0.0, 0.0, 200.0, 70.0)),
      ),
    );
  }
}
