import 'package:flutter/material.dart';

class RoundIconButton extends StatelessWidget {
  final IconData iconData;
  final Function onPressed;
  RoundIconButton({required this.iconData, required this.onPressed});
  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;
    return RawMaterialButton(
      shape: CircleBorder(),
      onPressed: onPressed(),
      child: Icon(iconData),
      constraints: BoxConstraints.tightFor(
        width: w * .12,
        height: h * .12,
      ),
      elevation: 0,
      fillColor: Color(0xFF4C4F5E),
    );
  }
}
