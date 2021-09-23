import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ibmapp/utils/color.dart';
import 'package:ibmapp/view/widgets/bottom_button.dart';
import 'package:ibmapp/view/widgets/reusable_Card.dart';

class ResultPageWeb extends StatelessWidget {
  static String id = 'resultpage';

  final String bmiresult, resultText, interpretation;
  ResultPageWeb(
      {required this.bmiresult,
      required this.interpretation,
      required this.resultText});
  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;
    return Scaffold(
        appBar: AppBar(
          backgroundColor: inActiveCardColor,
          title: Text('BMI CALCULATOR'),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Container(
              padding: EdgeInsets.all(15.0),
              alignment: Alignment.bottomLeft,
              child: Text('Your Result',
                  style: const TextStyle(
                    fontSize: 50,
                    fontWeight: FontWeight.bold,
                  )),
            ),
            Expanded(
                flex: 5,
                child: ReusableCard(
                  colour: Color(0xFF1D1E33),
                  cardChild: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Consumer(
                        builder: (BuildContext context,
                            T Function<T>(ProviderBase<Object?, T>) watch,
                            Widget? child) {
                          return Text(
                            resultText.toUpperCase(),
                            style: TextStyle(
                                color: Color(0xFF24D876),
                                fontSize: 22.0,
                                fontWeight: FontWeight.bold),
                            textAlign: TextAlign.center,
                          );
                        },
                      ),
                      Consumer(
                        builder: (BuildContext context,
                            T Function<T>(ProviderBase<Object?, T>) watch,
                            Widget? child) {
                          return Text(
                            bmiresult,
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: h * .1,
                            ),
                            textAlign: TextAlign.center,
                          );
                        },
                      ),
                      Consumer(
                        builder: (BuildContext context,
                            T Function<T>(ProviderBase<Object?, T>) watch,
                            Widget? child) {
                          return Text(
                            interpretation,
                            style: TextStyle(
                              fontSize: h * .035,
                            ),
                            textAlign: TextAlign.center,
                          );
                        },
                      ),
                    ],
                  ),
                  onPress: () {},
                )),
            BottomButton(
              buttonTitle: "RE-CALCULATE",
              onTab: () {
                Navigator.pop(context);
              },
            )
          ],
        ));
  }
}
