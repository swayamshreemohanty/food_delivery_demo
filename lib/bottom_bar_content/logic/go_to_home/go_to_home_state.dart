part of 'go_to_home_cubit.dart';

abstract class GoToHomeState extends Equatable {
  const GoToHomeState();

  @override
  List<Object> get props => [];
}

class GoToHomeInitial extends GoToHomeState {}

class GoToHomeTriggered extends GoToHomeState {
  @override
  List<Object> get props => [];
}

class GoToIndex extends GoToHomeState {
  final int index;
  const GoToIndex({required this.index});
  @override
  List<Object> get props => [index];
}
