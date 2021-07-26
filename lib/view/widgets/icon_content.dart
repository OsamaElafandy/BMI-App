import 'package:flutter/material.dart';

class IconContent extends StatelessWidget {
  final IconData iconData;
  final String label;
  IconContent({required this.iconData, required this.label});

  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          iconData,
          size: h * .1,
        ),
        SizedBox(
          height: h * .02,
        ),
        Text(
          label,
          style: TextStyle(fontSize: 18.0, color: Color(0xFF8D8E98)),
        )
      ],
    );
  }
}
