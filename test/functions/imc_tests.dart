import 'package:dio_imc_v00/dio_imc_v00.dart';
import 'package:test/expect.dart';
import 'package:test/scaffolding.dart';

void main() {
  //
  testExecution(valueToTest) {
    valueToTest.forEach((eachValues, eachExpected) {
      test(eachValues['name'], () {
        List<String> typeOfTest = ['function', 'value'];
        //
        double height = eachValues['height'] as double;
        double weight = eachValues['weight'] as double;
        //
        var expected = eachExpected;
        // TODO: Improved error handling
        if (!typeOfTest.contains(eachValues['typeExpected'])) {
          throw Exception('Error in the choice of typeExpected');
        }
        switch (eachValues['typeExpected']) {
          case 'function':
            expect(() => calculateIMC(height, weight), expected);
          case 'value':
            expect(calculateIMC(height, weight), expected);
          default:
            return false;
        }
      });
    });
  }

  group('IMC Calculated', () {
    var valueToTest = {
      {
        'name': 'Magreza grave',
        'height': 1.69,
        'weight': 42.85,
        'typeExpected': 'value',
      }: ('Magreza grave', 15.0),
      {
        'name': 'Magreza moderada',
        'height': 1.69,
        'weight': 46.0,
        'typeExpected': 'value',
      }: ('Magreza moderada', 16.11),
      {
        'name': 'Magreza leve',
        'height': 1.69,
        'weight': 49.0,
        'typeExpected': 'value',
      }: ('Magreza leve', 17.16),
      {
        'name': 'Saudável',
        'height': 1.69,
        'weight': 57.0,
        'typeExpected': 'value',
      }: ('Saudável', 19.96),
      {
        'name': 'Sobrepeso',
        'height': 1.84,
        'weight': 84.64,
        'typeExpected': 'value',
      }: ('Sobrepeso', 25.0),
      {
        'name': 'Obesidade Grau I',
        'height': 1.84,
        'weight': 101.57,
        'typeExpected': 'value',
      }: ('Obesidade Grau I', 30.0),
      {
        'name': 'Obesidade Grau II (severa)',
        'height': 1.92,
        'weight': 132.67,
        'typeExpected': 'value',
      }: ('Obesidade Grau II (severa)', 35.99),
      {
        'name': 'Obesidade Grau III (mórbida)',
        'height': 1.92,
        'weight': 156.34,
        'typeExpected': 'value',
      }: ('Obesidade Grau III (mórbida)', 42.41),
    };
    testExecution(valueToTest);
  });

  group('Error in IMC Calculated', () {
    var valueToTest = {
      {
        'name': 'height=0, divisão por zero',
        'height': 0.0,
        'weight': 42.85,
        'typeExpected': 'function',
      }: throwsA(TypeMatcher<ArgumentError>()),
    };
    testExecution(valueToTest);
  });
}
