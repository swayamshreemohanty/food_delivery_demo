part of 'foodaddcounter_cubit.dart';

class FoodaddcounterState extends Equatable {
  final int number;
  const FoodaddcounterState({
    required this.number,
  });

  @override
  List<Object> get props => [number];
  
  FoodaddcounterState copyWith({int? selectedNumber}) => FoodaddcounterState(
        number: selectedNumber ?? number,
      );
}
