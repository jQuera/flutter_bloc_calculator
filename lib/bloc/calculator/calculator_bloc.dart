import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'calculator_event.dart';
part 'calculator_state.dart';

class CalculatorBloc extends Bloc<CalculatorEvent, CalculatorState> {
  CalculatorBloc() : super(const CalculatorState()) {
    on<CalculatorEvent>(
      ((event, emit) {
        if (event is ResetAC) {
          _onResetAC(event, emit);
        } else if (event is AddNumber) {
          _onAddNumber(event, emit);
        } else if (event is ChangeNegativePositive) {
          _changeNegativePositive(event, emit);
        } else if (event is DeleteLastEntry) {
          _deleteLastEntry(event, emit);
        } else if (event is OperationEntry) {
          _operationEntry(event, emit);
        } else if (event is CalculateResult) {
          _calculateResult(event, emit);
        }
      }),
    );
  }
  void _onResetAC(ResetAC event, Emitter<CalculatorState> emit) async {
    emit(
      const CalculatorState(
        firstNumber: '0',
        secondNumber: '0',
        operation: 'none',
        mathResult: '0',
      ),
    );
  }

  void _onAddNumber(AddNumber event, Emitter<CalculatorState> emit) {
    emit(
      state.copyWith(
        mathResult: (state.mathResult == '0')
            ? event.number
            : state.mathResult + event.number,
      ),
    );
  }

  void _changeNegativePositive(
      ChangeNegativePositive event, Emitter<CalculatorState> emit) {
    emit(state.copyWith(
        mathResult: state.mathResult.contains('-')
            ? state.mathResult.replaceFirst('-', '')
            : '-${state.mathResult}'));
  }

  void _deleteLastEntry(DeleteLastEntry event, Emitter<CalculatorState> emit) {
    emit(
      state.copyWith(
        mathResult: state.mathResult.length > 1
            ? state.mathResult.substring(0, state.mathResult.length - 1)
            : '0',
      ),
    );
  }

  void _operationEntry(OperationEntry event, Emitter<CalculatorState> emit) {
    emit(
      state.copyWith(
        firstNumber: state.mathResult,
        mathResult: '0',
        operation: event.operation,
        secondNumber: '0',
      ),
    );
  }

  void _calculateResult(CalculateResult event, Emitter<CalculatorState> emit) {
    final double num1 = double.parse(state.firstNumber);
    final double num2 = double.parse(state.mathResult);

    switch (state.operation) {
      case '+':
        emit(
          state.copyWith(
            secondNumber: state.mathResult,
            mathResult: '${num1 + num2}',
          ),
        );
        break;
      case '-':
        emit(
          state.copyWith(
            secondNumber: state.mathResult,
            mathResult: '${num1 - num2}',
          ),
        );
        break;
      case '/':
        emit(
          state.copyWith(
            secondNumber: state.mathResult,
            mathResult: '${num1 / num2}',
          ),
        );
        break;
      case 'X':
        emit(
          state.copyWith(
            secondNumber: state.mathResult,
            mathResult: '${num1 * num2}',
          ),
        );
        break;
      default:
        emit(state);
    }
  }
}
