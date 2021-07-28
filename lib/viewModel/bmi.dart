import 'dart:math';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ibmapp/model/bmi.dart';

class BmiNotifier extends StateNotifier<Bmi> {
  BmiNotifier()
      : super(
          Bmi(
            height: 170,
            weight: 70,
            age: 20,
            bmi: 0,
            isMale: true,
          ),
        );

  void increaseWeight() {
    state = state.copyWith(weight: state.weight + 1);
  }

  void decreaseWeight() {
    state = state.copyWith(weight: state.weight - 1);
  }

  void setHeight(int height) {
    if (height != state.height) state = state.copyWith(height: height);
  }

  void increaseAge() {
    state = state.copyWith(age: state.age + 1);
  }

  void decreaseAge() {
    state = state.copyWith(age: state.age - 1);
  }

  void setIsMale(bool isMale) {
    if (isMale != state.isMale) state = state.copyWith(isMale: isMale);
  }

  void selectGenderMale() {
    setIsMale(true);
  }

  void selectGenderFemale() {
    setIsMale(false);
  }

  calculateBMI() {
    final double bmi = state.weight / pow((state.height / 100), 2);
    state = state.copyWith(bmi: bmi);
    return state.bmi.toStringAsFixed(2);
  }

  bmiGet() {
    return state.bmi.toStringAsFixed(2);
  }

  String getResult() {
    if (state.bmi >= 25) {
      return 'Overweight';
    } else if (state.bmi > 18.5) {
      return 'Normal';
    } else {
      return 'Underweight';
    }
  }

  String getInterpretation() {
    if (state.bmi >= 25) {
      return 'You have a higher than normal weight. Try exercise more';
    } else if (state.bmi > 18.5) {
      return 'You have a normal body weight. Good job';
    } else {
      return 'You have a lower than normal body weight. You can a bit more.';
    }
  }
}
