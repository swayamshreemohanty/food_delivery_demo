part of 'foodmanagemet_bloc.dart';

abstract class FoodmanagemetEvent extends Equatable {
  const FoodmanagemetEvent();

  @override
  List<Object> get props => [];
}

class FetchFoodsDetailsForHome extends FoodmanagemetEvent {}
