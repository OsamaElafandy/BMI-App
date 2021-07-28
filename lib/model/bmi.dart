class Bmi {
  const Bmi({
    required this.height,
    required this.weight,
    required this.age,
    required this.bmi,
    required this.isMale,
  });

  final int height;
  final int weight;
  final int age;
  final double bmi;
  final bool isMale;

  factory Bmi.fromMap(Map<String, Object?> data) {
    return Bmi(
      height: data['height'] as int? ?? 0,
      weight: data['weight'] as int? ?? 0,
      age: data['age'] as int? ?? 0,
      bmi: data['bmi'] as double? ?? 0.0,
      isMale: data['bmi'] as bool? ?? true,
    );
  }

  Map<String, Object> toMap() {
    return {
      'height': height,
      'weight': weight,
      'age': age,
      'bmi': bmi,
      'isMale': isMale,
    };
  }

  Bmi copyWith({
    int? height,
    int? weight,
    int? age,
    double? bmi,
    bool? isMale,
  }) {
    return Bmi(
      height: height ?? this.height,
      weight: weight ?? this.weight,
      age: age ?? this.age,
      bmi: bmi ?? this.bmi,
      isMale: isMale ?? this.isMale,
    );
  }
}
