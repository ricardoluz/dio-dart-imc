
import 'package:dio_imc_v00/data_handling/terminalEntry.dart';
import 'package:dio_imc_v00/dio_imc_v00.dart';

void main(List<String> arguments) {
  print("\n* Entre os dados para o cálculo de IMC.\n");

  var nome = dataInput(
    text: "\tDigite seu nome : ",
    typeInput: 'string',
    isLimited: false,
  );
  var altura = dataInput(
    text: "\tDigite sua altura (m): ",
    typeInput: "double",
    isLimited: true,
    limLower: 0.3,
    limUpper: 3,
  );
  var peso = dataInput(
    text: "\tDigite seu peso (Kg) : ",
    typeInput: "double",
    isLimited: true,
    limLower: 0.4,
    limUpper: 300,
  );

  Pessoa p1 = Pessoa(nome!, altura!, peso);
  print(p1.name);
  print(p1.height);
  print(p1.weight);
  print(calculateIMC(p1.height, p1.weight));
}




