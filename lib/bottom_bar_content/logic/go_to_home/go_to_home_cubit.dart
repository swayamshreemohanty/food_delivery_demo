import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
part 'go_to_home_state.dart';

class GoToHomeCubit extends Cubit<GoToHomeState> {
  GoToHomeCubit() : super(GoToHomeInitial());
  Future<void> goToHomeHome() async {
    emit(GoToHomeInitial());
    emit(GoToHomeTriggered());
    return;
  }

  Future<void> goToIndex({required int index}) async {
    emit(GoToHomeInitial());
    emit(GoToIndex(index: index));
    return;
  }
}
