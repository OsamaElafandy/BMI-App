import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:ibmapp/model/bmi.dart';

import 'package:ibmapp/view/resultPage/result_page.dart';
import 'package:ibmapp/viewModel/bmi.dart';
import '../../utils/color.dart';
import '../widgets/bottom_button.dart';
import '../../view/widgets/reusable_Card.dart';
import '../widgets/rounded_icon_button.dart';
import '../widgets/icon_content.dart';

final ibm = StateNotifierProvider<BmiNotifier, Bmi>((ref) => BmiNotifier());

class InputPage extends StatelessWidget {
  static const String id = '/';

  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;

    return Scaffold(
        appBar: AppBar(
          title: Text('BMI CALCULATOR'),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              child: Row(
                children: [
                  Expanded(
                    child: Consumer(
                      builder: (context, watch, child) {
                        final state = watch(ibm);
                        return ReusableCard(
                          colour:
                              state.isMale ? activeColor : inActiveCardColor,
                          cardChild: IconContent(
                            iconData: FontAwesomeIcons.mars,
                            label: 'MALE',
                          ),
                          onPress: context.read(ibm.notifier).selectGenderMale,
                        );
                      },
                    ),
                  ),
                  Expanded(
                    child: Consumer(
                      builder: (context, watch, child) {
                        final state = watch(ibm);
                        return ReusableCard(
                          colour:
                              !state.isMale ? activeColor : inActiveCardColor,
                          cardChild: IconContent(
                            iconData: FontAwesomeIcons.venus,
                            label: 'FEMALE',
                          ),
                          onPress:
                              context.read(ibm.notifier).selectGenderFemale,
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: ReusableCard(
                colour: activeColor,
                cardChild: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'HEIGHT',
                      style:
                          TextStyle(fontSize: 18.0, color: Color(0xFF8D8E98)),
                    ),
                    Expanded(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.baseline,
                        textBaseline: TextBaseline.alphabetic,
                        children: [
                          Consumer(
                            builder: (context, watch, child) {
                              final state = watch(ibm);
                              return Text(
                                state.height.round().toString(),
                                style: TextStyle(
                                    fontSize: w * .1,
                                    fontWeight: FontWeight.w900),
                              );
                            },
                          ),
                          Text(
                            'cm',
                            style: TextStyle(
                              fontSize: w * .04,
                              color: Color(0xFF8D8E98),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SliderTheme(
                      data: SliderTheme.of(context).copyWith(
                        thumbShape: RoundSliderThumbShape(
                          enabledThumbRadius: 10.0,
                        ),
                        activeTrackColor: Colors.white,
                        thumbColor: Color(0xFFEB1555),
                        overlayShape:
                            RoundSliderOverlayShape(overlayRadius: 20.0),
                      ),
                      child: Consumer(
                        builder: (context, watch, child) {
                          final state = watch(ibm);
                          return Slider(
                            value: state.height.toDouble(),
                            min: 120.0,
                            max: 220.0,
                            inactiveColor: Color(0xFF8D8E98),
                            onChanged: (newValue) {
                              final controller = context.read(ibm.notifier);
                              controller.setHeight(newValue.round());
                            },
                          );
                        },
                      ),
                    )
                  ],
                ),
                onPress: () {},
              ),
            ),
            Expanded(
              child: Row(
                children: [
                  Expanded(
                    child: ReusableCard(
                      colour: activeColor,
                      cardChild: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(
                            height: h * .01,
                          ),
                          Text(
                            "WEIGHT",
                            style: TextStyle(
                                fontSize: 18.0, color: Color(0xFF8D8E98)),
                          ),
                          Consumer(
                            builder: (context, watch, child) {
                              final state = watch(ibm);
                              return Text(
                                state.weight.toString(),
                                style: TextStyle(
                                  fontSize: w * .1,
                                  fontWeight: FontWeight.w900,
                                ),
                              );
                            },
                          ),
                          Expanded(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                RoundedIconButton(
                                  iconData: FontAwesomeIcons.minus,
                                  onPressed:
                                      context.read(ibm.notifier).decreaseWeight,
                                ),
                                SizedBox(
                                  width: w * .03,
                                ),
                                RoundedIconButton(
                                  iconData: FontAwesomeIcons.plus,
                                  onPressed:
                                      context.read(ibm.notifier).increaseWeight,
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: h * .01,
                          ),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    child: ReusableCard(
                      colour: activeColor,
                      cardChild: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(
                            height: h * .01,
                          ),
                          Text(
                            "AGE",
                            style: TextStyle(
                                fontSize: 18.0, color: Color(0xFF8D8E98)),
                          ),
                          Consumer(
                            builder: (context, watch, child) {
                              final state = watch(ibm);
                              return Text(
                                state.age.toString(),
                                style: TextStyle(
                                    fontSize: w * .1,
                                    fontWeight: FontWeight.w900),
                              );
                            },
                          ),
                          Expanded(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                RoundedIconButton(
                                  iconData: FontAwesomeIcons.minus,
                                  onPressed:
                                      context.read(ibm.notifier).decreaseAge,
                                ),
                                SizedBox(
                                  width: w * .03,
                                ),
                                RoundedIconButton(
                                  iconData: FontAwesomeIcons.plus,
                                  onPressed:
                                      context.read(ibm.notifier).increaseAge,
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: h * .01,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            BottomButton(
              buttonTitle: "CALCULATE",
              onTab: () {
                context.read(ibm.notifier).calculateBMI();
                var bmi = context.read(ibm.notifier).bmiGet();
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => ResultPage(
                          bmiresult: bmi,
                          interpretation:
                              context.read(ibm.notifier).getInterpretation(),
                          resultText: context.read(ibm.notifier).getResult(),
                        )));
              },
            ),
          ],
        ));
  }
}
