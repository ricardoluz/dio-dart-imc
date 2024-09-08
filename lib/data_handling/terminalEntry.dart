import 'dart:convert';
import 'dart:io';

import '/data_handling/type_validators.dart';

dynamic dataInput({
  required String text,
  required String typeInput,
  bool isLimited = false,
  double limLower = 0,
  double limUpper = 300,
}) {
  do {
    stdout.write(text);
    dynamic input = stdin.readLineSync(encoding: utf8);
    switch (typeInput) {
      case "double":
        var (isValid, valueOrError) = validateDouble(
          value: input,
          isLimited: isLimited,
          limLower: limLower,
          limUpper: limUpper,
        );
        if (isValid) {
          return valueOrError;
        } else {
          print(valueOrError);
        }
      case "string":
      //TODO: Aplicar o conceito de comprimento mínimo e máximo.
        return input;
      default:
        throw Exception("Erro de typeInput..");
    }
  } while (true);
}