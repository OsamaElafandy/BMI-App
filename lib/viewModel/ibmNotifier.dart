import 'dart:math';
import 'package:flutter/foundation.dart';
import 'package:ibmapp/model/ibm.dart';
import 'package:ibmapp/model/ibm.dart';
import 'package:ibmapp/utils/gender.dart';

class IbmNotifier with ChangeNotifier {
  IbmNotifier() {
    _ibm = Ibm();
    _ibm.age = 18;
    _ibm.height = 170;
    _ibm.weight = 70;
    _ibm.selectGender = Gender.Male;
  }

  late Ibm _ibm;

  Ibm get ibm => _ibm;

  set ibm(Ibm ibm) {
    _ibm = ibm;
    notifyListeners();
  }

  void refresh() {
    notifyListeners();
  }

  int increaseW() {
    var w = ibm.weight!;
    notifyListeners();
    return w++;
  }

  int decreaseW() {
    var w = ibm.weight!;
    notifyListeners();
    return w--;
  }

  int increaseH() {
    var h = ibm.height!;
    notifyListeners();
    return h++;
  }

  int decreaseH() {
    var h = ibm.height!;
    notifyListeners();
    return h--;
  }

  int decreaseA() {
    var s = ibm.age!;
    notifyListeners();
    return s--;
  }

  int increaseA() {
    var s = ibm.age!;
    notifyListeners();
    return s++;
  }

  selectGenderM() {
    ibm.selectGender = Gender.Male;
    notifyListeners();
  }

  selectGenderF() {
    ibm.selectGender = Gender.Female;
    notifyListeners();
  }

  String calculatBMI() {
    var result = ibm.bmi;
    result = ibm.weight! / pow((ibm.height! / 100), 2);
    notifyListeners();
    return result.toStringAsFixed(1);
  }

  String getResult() {
    if (ibm.bmi! >= 25) {
      return 'Overweight';
    } else if (ibm.bmi! > 18.5) {
      return 'Normal';
    } else {
      return 'Underweight';
    }
  }

  String getInterpeation() {
    if (ibm.bmi! >= 25) {
      return 'You have a higher than normal weight. Try exercise more';
    } else if (ibm.bmi! > 18.5) {
      return 'You have a normal body weight. Good job';
    } else {
      return 'You have a lower than normal body weight. You can a bit more.';
    }
  }
}
