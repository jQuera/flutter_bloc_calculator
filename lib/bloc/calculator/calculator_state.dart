part of 'calculator_bloc.dart';

// @immutable
class CalculatorState {
  final String mathResult;
  final String firstNumber;
  final String secondNumber;
  final String operation;
  const CalculatorState({
    this.mathResult = "30",
    this.firstNumber = "10",
    this.secondNumber = "20",
    this.operation = "+",
  });

  CalculatorState copyWith({
    String? mathResult,
    String? firstNumber,
    String? secondNumber,
    String? operation,
  }) =>
      CalculatorState(
        mathResult: mathResult ?? this.mathResult,
        firstNumber: firstNumber ?? this.firstNumber,
        secondNumber: secondNumber ?? this.secondNumber,
        operation: operation ?? this.operation,
      );
}

// class CalculatorInitial extends CalculatorState {}

// class CalculatorState {
//   final String mathResult;
//   final String firstNumber;
//   final String secondNumber;
//   final String operation;
//   const CalculatorState({
//     this.mathResult = "30",
//     this.firstNumber = "10",
//     this.secondNumber = "20",
//     this.operation = "+",
//   });
// }
