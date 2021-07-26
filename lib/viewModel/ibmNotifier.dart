import 'dart:math';

import 'package:flutter/foundation.dart';
import 'package:ibmapp/utils/gender.dart';

class IbmNotifier with ChangeNotifier {
  late int _height;
  late int _weight;
  late int _age;
  late double _bmi;
  late dynamic _selectGender;

  int get height => _height;
  int get weight => _weight;
  double get bmi => _bmi;
  int get age => _age;
  dynamic get selectGender => _selectGender;

  set height(int newValue) {
    _height = newValue;
    notifyListeners();
  }

  set weight(int newValue) {
    _weight = newValue;
    notifyListeners();
  }

  set age(int age) {
    _age = age;
    notifyListeners();
  }

  increaseW() {
    _weight++;
    notifyListeners();
  }

  decreaseW() {
    _weight--;
    notifyListeners();
  }

  increaseH() {
    _height++;
    notifyListeners();
  }

  decreaseH() {
    _height--;
    notifyListeners();
  }

  decreaseA() {
    _age--;
    notifyListeners();
  }

  increaseA() {
    _age++;
    notifyListeners();
  }

  selectGenderM() {
    _selectGender = Gender.Male;
    notifyListeners();
  }

  selectGenderF() {
    _selectGender = Gender.Female;
    notifyListeners();
  }

  String calculatBMI() {
    _bmi = weight / pow(height / 100, 2);
    notifyListeners();
    return _bmi.toStringAsFixed(1);
  }

  String getResult() {
    if (_bmi >= 25) {
      return 'Overweight';
    } else if (_bmi > 18.5) {
      return 'Normal';
    } else {
      return 'Underweight';
    }
  }

  String getInterpeation() {
    if (_bmi >= 25) {
      return 'You have a higher than normal weight. Try exercise more';
    } else if (_bmi > 18.5) {
      return 'You have a normal body weight. Good job';
    } else {
      return 'You have a lower than normal body weight. You can a bit more.';
    }
  }
}
