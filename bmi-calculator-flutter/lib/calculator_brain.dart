

import 'dart:math';

class CalculatorBrain {

  CalculatorBrain({required this.height,required this.weight});

  final int height;
  final int weight;

  late double _bmi;

  String calcularBMI() {
    _bmi = weight / pow(height/100, 2);
    return _bmi.toStringAsFixed(1);
  }

  String getResult() {
    if (_bmi >= 25) {
      return 'Acima do peso';
    } else if (_bmi > 18.5) {
      return 'Normal';
    } else {
      return 'Abaixo do peso';
    }
  }

  String getInterpretation() {
    if (_bmi >= 25) {
      return 'Você tem um peso corporal acima do normal. Tente se exercitar mais.';
    } else if (_bmi > 18.5) {
      return 'Você tem um peso corporal normal. Parabéns!';
    } else {
      return 'Você tem um peso corporal abaixo do normal. Você pode comer um pouco mais.';
    }
  }
}