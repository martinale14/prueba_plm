import 'package:flutter/material.dart';
import 'package:plm_prueba/utils/colors.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerText extends StatelessWidget {
  const ShimmerText({Key? key, required this.text}) : super(key: key);

  final String text;

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      period: const Duration(milliseconds: 3000),
      highlightColor: PlmColors.pink,
      baseColor: PlmColors.deepPurple,
      child: Text(
        text,
        style: TextStyle(
          fontSize: 32,
          fontWeight: FontWeight.w700,
          shadows: [
            Shadow(
              offset: const Offset(0, 5),
              color: Colors.black.withOpacity(.5),
              blurRadius: 15,
            ),
          ],
        ),
      ),
    );
  }
}
