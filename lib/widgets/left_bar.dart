import 'package:flutter/material.dart';

class LeftBar extends StatelessWidget {
  final double barWidth;

  LeftBar(this.barWidth);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      // align everything to the right side.
      children: [
        Container(
            height: 25,
            width: barWidth,
            decoration:  const BoxDecoration(
                color: Colors.yellow,
                borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20),
                bottomLeft: Radius.circular(20),
              ),
            ),
        ),
      ],
    );
  }
}
