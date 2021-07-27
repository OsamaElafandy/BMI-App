import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:ibmapp/model/ibm.dart';
import 'package:ibmapp/viewModel/ibmNotifier.dart';
import '../../utils/color.dart';
import '../../utils/gender.dart';
import '../../view/widgets/button.dart';
import '../../view/widgets/reusable_Card.dart';
import '../../view/widgets/round_icon_button.dart';
import '../widgets/icon_content.dart';

final ibm = ChangeNotifierProvider<IbmNotifier>((ref) => IbmNotifier());

class InputPage extends ConsumerWidget {
  Gender? selectGender;
  static String id = '/';

  @override
  Widget build(BuildContext context, watch) {
    final go = watch(ibm).ibm;
    go.age = 10;
    go.height = 12;
    go.bmi = 110;
    go.weight = 13;

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
                  Expanded(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.baseline,
                      textBaseline: TextBaseline.alphabetic,
                      children: [
                        Consumer(
                          builder: (BuildContext context,
                              T Function<T>(ProviderBase<Object?, T>) watch,
                              Widget? child) {
                            var h = go.height;
                            return Text(
                              h.toString(),
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
                            RoundSliderOverlayShape(overlayRadius: 20.0)),
                    child: Slider(
                        //TODO hh
                        value: go.height!.toDouble(),
                        min: 120.0,
                        max: 220.0,
                        inactiveColor: Color(0xFF8D8E98),
                        onChanged: (newValue) {
                          go.height = newValue.round();
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
                            "Weight 156",
                            //TODO    ibmNofi.weight.toString(),
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
                              //TODO    ibmNofi.age.toString(),
                              "Age 351",
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
                  /* Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => ResultPage(
                            bmiresult: context.read(ibm).calculatBMI(),
                            interpretation: context.read(ibm).getInterpeation(),
                            resultText: context.read(ibm).getResult(),
                          )));*/
                  // CalculatorBrain calc =CalculatorBrain(height: height,weight: weight);
                })
          ],
        ));
  }
}
