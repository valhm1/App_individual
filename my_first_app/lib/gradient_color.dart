import "package:flutter/material.dart";

class GradientContainer extends StatelessWidget{
  const GradientContainer({super.key});

  @override
  Widget build(context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Colors.black,
            Colors.white,
          ],
        ),
      ),
    );
  }
}