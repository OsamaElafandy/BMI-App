import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../../main.dart';
import '../../utils/color.dart';
import '../../utils/gender.dart';
import '../../view/resultPage/result_page.dart';
import '../../view/widgets/button.dart';
import '../../view/widgets/reusable_Card.dart';
import '../../view/widgets/round_icon_button.dart';
import '../widgets/icon_content.dart';

@immutable
class InputPage extends ConsumerWidget {
  static String id = '/';
  Gender? selectGender;

  int height = 180;

  int weight = 60;

  int age = 20;

  @override
  Widget build(BuildContext context, watch) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;
    final ibmNofi = watch(ibm);

    ibmNofi.height = height;
    ibmNofi.weight = weight;
    ibmNofi.age = age;
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
                  child: ReusableCard(
                    colour: selectGender == Gender.Male
                        ? activeColor
                        : inActiveCardColor,
                    cardChild: IconContent(
                      iconData: FontAwesomeIcons.mars,
                      label: 'MALE',
                    ),
                    onPress: () {
                      //TODO   context.read(ibm).selectGenderM();
                    },
                  ),
                ),
                Expanded(
                  child: ReusableCard(
                    colour: selectGender == Gender.Female
                        ? activeColor
                        : inActiveCardColor,
                    cardChild: IconContent(
                        iconData: FontAwesomeIcons.venus, label: 'FEMALE'),
                    onPress: () {
                      //TODO context.read(ibm).selectGenderF();
                    },
                  ),
                )
              ],
            )),
            Expanded(
                child: ReusableCard(
              colour: activeColor,
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'HEIGHT',
                    style: TextStyle(fontSize: 18.0, color: Color(0xFF8D8E98)),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    children: [
                      Consumer(
                        builder: (BuildContext context,
                            T Function<T>(ProviderBase<Object?, T>) watch,
                            Widget? child) {
                          return Text(
                            ibmNofi.height.toString(),
                            style: TextStyle(
                                fontSize: w * .1, fontWeight: FontWeight.w900),
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
                  SliderTheme(
                    data: SliderTheme.of(context).copyWith(
                        thumbShape: RoundSliderThumbShape(
                          enabledThumbRadius: 10.0,
                        ),
                        activeTrackColor: Colors.white,
                        thumbColor: Color(0xFFEB1555),
                        overlayShape:
                            RoundSliderOverlayShape(overlayRadius: 20.0)),
                    child: Slider(
                        //TODO
                        value: height.toDouble(),
                        min: 120.0,
                        max: 220.0,
                        inactiveColor: Color(0xFF8D8E98),
                        onChanged: (double newValue) {
                          //TODO  // height = newValue.toInt();
                        }),
                  )
                ],
              ),
              onPress: () {},
            )),
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
                        style:
                            TextStyle(fontSize: 18.0, color: Color(0xFF8D8E98)),
                      ),
                      Consumer(
                        builder: (BuildContext context,
                            T Function<T>(ProviderBase<Object?, T>) watch,
                            Widget? child) {
                          return Text(
                            ibmNofi.weight.toString(),
                            style: TextStyle(
                                fontSize: w * .1, fontWeight: FontWeight.w900),
                          );
                        },
                      ),
                      Expanded(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            RoundIconButton(
                              iconData: FontAwesomeIcons.minus,
                              onPressed: () {
                                //TODO     context.read(ibm).decreaseW();
                              },
                            ),
                            SizedBox(
                              width: w * .03,
                            ),
                            RoundIconButton(
                              iconData: FontAwesomeIcons.plus,
                              onPressed: () {
                                //TODO   context.read(ibm).increaseW();
                              },
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: h * .01,
                      ),
                    ],
                  ),
                  onPress: () {},
                )),
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
                          builder: (BuildContext context,
                              T Function<T>(ProviderBase<Object?, T>) watch,
                              Widget? child) {
                            return Text(
                              ibmNofi.age.toString(),
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
                              RoundIconButton(
                                iconData: FontAwesomeIcons.minus,
                                onPressed: () {
                                  //TODO   context.read(ibm).decreaseA();
                                },
                              ),
                              SizedBox(
                                width: w * .03,
                              ),
                              RoundIconButton(
                                iconData: FontAwesomeIcons.plus,
                                onPressed: () {
                                  //TODO  context.read(ibm).increaseA();
                                },
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: h * .01,
                        ),
                      ],
                    ),
                    onPress: () {},
                  ),
                ),
              ],
            )),
            ButtomButton(
                buttonTitle: "CALCULATE",
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => ResultPage(
                            bmiresult: context.read(ibm).calculatBMI(),
                            interpretation: context.read(ibm).getInterpeation(),
                            resultText: context.read(ibm).getResult(),
                          )));
                  // CalculatorBrain calc =CalculatorBrain(height: height,weight: weight);
                })
          ],
        ));
  }
}
