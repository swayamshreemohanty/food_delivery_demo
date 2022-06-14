import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
part 'foodaddcounter_state.dart';

class FoodaddcounterCubit extends Cubit<FoodaddcounterState> {
  FoodaddcounterCubit() : super(const FoodaddcounterState(number: 1));

  void increaseCounter() {
    emit(state.copyWith(selectedNumber: state.number + 1));
    return;
  }

  void decreaseCounter() {
    if (state.number > 1) {
      emit(state.copyWith(selectedNumber: state.number - 1));
    }
    return;
  }

  void resetCounter() {
    emit(state.copyWith(selectedNumber: 1));
    return;
  }
}