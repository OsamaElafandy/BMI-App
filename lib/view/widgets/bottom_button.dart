import 'package:flutter/material.dart';

class BottomButton extends StatelessWidget {
  final String buttonTitle;
  final Function onTab;
  BottomButton({required this.buttonTitle, required this.onTab});

  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;

    return GestureDetector(
      onTap: () => onTab(),
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
