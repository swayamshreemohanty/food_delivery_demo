import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_delivery/constant/dummy_dart.dart';
part 'foodmanagemet_event.dart';
part 'foodmanagemet_state.dart';

class FoodmanagemetBloc extends Bloc<FoodmanagemetEvent, FoodmanagemetState> {
  FoodmanagemetBloc() : super(FoodmanagemetInitial()) {
    on<FoodmanagemetEvent>((event, emit) {
      if (event is FetchFoodsDetailsForHome) {
        try {
          emit(FoodDataLoading());
          emit(FoodDataFetched(
            foodList: DummyFood.dummyFoods,
            foodCategory: FoodCategoryList.foodCategoryList,
          ));
        } catch (e) {
          emit(FoodDataFetchFailed());
        }
      }
    });
  }
}
