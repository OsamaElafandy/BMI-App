class Ibm {
  int? height;
  int? weight;
  int? age;
  double? bmi;
  var selectGender;
  Ibm();

  Ibm.fromMap(Map<String, dynamic> data) {
    height = data['height'];
    weight = data['weight'];
    age = data['age'];
    bmi = data['bmi'];
    selectGender = data['selectGender'];
  }

  Map<String, dynamic> toMap() {
    return {
      'height': height,
      'weight': weight,
      'age': age,
      'bmi': bmi,
      'selectGender': selectGender
    };
  }
}
