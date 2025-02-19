import 'dart:io';
import 'package:expressions/expressions.dart';

void main() {
  while (true) {
    stdout.write("Digite a operação (ou 'exit' para sair): ");
    String? input = stdin.readLineSync();

    if (input == null || input.toLowerCase() == 'exit') {
      print("Encerrando a calculadora...");
      break;
    }

    try {
      final expression = Expression.parse(input);
      final evaluator = const ExpressionEvaluator();
      final result = evaluator.eval(expression, {});

      if (result is double || result is int) {
        print("Resultado: $result\n");
      } else {
        print("Resultado inválido!\n");
      }
    } catch (e) {
      print("Expressão inválida! Tente novamente.\n");
    }
  }
}
