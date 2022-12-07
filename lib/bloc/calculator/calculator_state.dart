part of 'calculator_bloc.dart';

@immutable
abstract class CalculatorState {
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
}

class CalculatorInitial extends CalculatorState {}
