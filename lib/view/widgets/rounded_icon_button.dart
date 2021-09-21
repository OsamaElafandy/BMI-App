import 'package:flutter/material.dart';

class RoundedIconButton extends StatelessWidget {
  final IconData iconData;
  final double w, h, size;
  final void Function()? onPressed;

  const RoundedIconButton(
      {required this.iconData,
      required this.onPressed,
      required this.w,
      required this.size,
      required this.h});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: h,
      width: w,
      child: RawMaterialButton(
        shape: CircleBorder(),
        onPressed: onPressed,
        child: Icon(
          iconData,
          size: size,
        ),
        elevation: 0,
        fillColor: Color(0xFF4C4F5E),
      ),
    );
  }
}
