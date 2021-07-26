import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '/view/inputPage/input_page.dart';

class ButtomButton extends StatelessWidget {
  final Function onTap;
  final String buttonTitle;

  ButtomButton({required this.buttonTitle, required this.onTap});

  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;

    return GestureDetector(
      onTap: () => {context.read(ibm).calculatBMI()},
      child: Container(
        child: Center(
          child: Text(
            buttonTitle,
            style: TextStyle(fontSize: 25.0, fontWeight: FontWeight.bold),
          ),
        ),
        color: Colors.pink,
        margin: EdgeInsets.only(top: 10.0),
        padding: EdgeInsets.only(bottom: 8.0),
        width: double.infinity,
        height: h * .1,
      ),
    );
  }
}
