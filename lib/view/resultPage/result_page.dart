import 'package:flutter/material.dart';
import 'package:ibmapp/view/widgets/bottom_button.dart';
import 'package:ibmapp/view/widgets/reusable_Card.dart';

class ResultPage extends StatelessWidget {
  static String id = 'resultpage';

  final String bmiresult, resultText, interpretation;
  ResultPage(
      {required this.bmiresult,
      required this.interpretation,
      required this.resultText});
  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;
    return Scaffold(
        appBar: AppBar(
          title: Text('BMI CALCULATOR'),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Expanded(
                child: Container(
              padding: EdgeInsets.all(15.0),
              alignment: Alignment.bottomLeft,
              child: Text('Your Result',
                  style: TextStyle(
                    fontSize: w * .08,
                    fontWeight: FontWeight.bold,
                  )),
            )),
            Expanded(
                flex: 5,
                child: ReusableCard(
                  colour: Color(0xFF1D1E33),
                  cardChild: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Text(
                        resultText.toUpperCase(),
                        style: TextStyle(
                            color: Color(0xFF24D876),
                            fontSize: 22.0,
                            fontWeight: FontWeight.bold),
                        textAlign: TextAlign.center,
                      ),
                      Text(
                        bmiresult,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: h * .1,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      Text(
                        interpretation,
                        style: TextStyle(
                          fontSize: h * .035,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                  onPress: () {},
                )),
            BottomButton(
                buttonTitle: "RE-CALCULATE",
                onTap: () {
                  Navigator.pop(context);
                })
          ],
        ));
  }
}
