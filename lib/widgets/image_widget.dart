import 'package:flutter/material.dart';

class StyledImage extends StatelessWidget {
  final String image;

  const StyledImage(this.image, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 264,
      height: 248,
      decoration: BoxDecoration(
        border: Border.all(
          color: const Color(0xFFE48000)
        ),
        borderRadius: BorderRadius.circular(23.0)
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(23.0),
        child: Image.asset(image),
      )
    );
  }
}