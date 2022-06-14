part of 'foodmanagemet_bloc.dart';

abstract class FoodmanagemetState extends Equatable {
  const FoodmanagemetState();

  @override
  List<Object> get props => [];
}

class FoodmanagemetInitial extends FoodmanagemetState {}

class FoodDataLoading extends FoodmanagemetState {}

class FoodDataFetched extends FoodmanagemetState {
  final List<Food> foodList;
  final List<String> foodCategory;

  const FoodDataFetched({
    required this.foodList,
    required this.foodCategory,
  });
  @override
  List<Object> get props => [foodList, foodCategory];
}

class FoodDataFetchFailed extends FoodmanagemetState {}
