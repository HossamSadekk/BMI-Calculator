import 'package:flutter/material.dart';

class RightBar extends StatelessWidget {
  late final double barWidth;

  RightBar(this.barWidth);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      // align everything to the right side.
      children: [
        Container(
            height: 25,
            width: barWidth,
            decoration: const BoxDecoration(
              color: Colors.yellow,
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(20),
                bottomRight: Radius.circular(20),
              ),
            ),
        ),
      ],
    );
  }
}
