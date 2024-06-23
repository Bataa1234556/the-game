import 'package:flutter/material.dart';

class GradientLetter extends StatelessWidget {
  final String letter;
  final double width;
  final double height;
  final double size;
  final double radius;
  final double innerRadius;
  final int top;
  final Color color1;
  final Color color2;

  const GradientLetter(this.letter, this.width, this.height, this.size,
      this.radius, this.innerRadius, this.top, this.color1, this.color2,
      {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(radius),
        color: const Color(0xFFFF9002),
      ),
      child: Align(
        alignment: Alignment.center,
        child: FractionallySizedBox(
          widthFactor: 2 / 3,
          heightFactor: 2 / 3,
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(innerRadius),
              gradient: LinearGradient(
                colors: [color1, color2],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                stops: const [-0.025, 1.6875],
                transform: const GradientRotation(180),
              ),
            ),
            child: Center(
              child: Text(
                letter,
                style: TextStyle(
                  fontSize: size,
                  height: 52 / top,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
