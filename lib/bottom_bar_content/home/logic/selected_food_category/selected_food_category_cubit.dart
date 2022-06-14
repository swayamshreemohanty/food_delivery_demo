import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
part 'selected_food_category_state.dart';

class SelectedFoodCategoryCubit extends Cubit<SelectedFoodCategoryState> {
  SelectedFoodCategoryCubit()
      : super(const SelectedFoodCategoryState(selectedIndex: 0));

  void selectCategory({required int index}) {
    emit(state.copyWith(selectedIndex: index));
  }
}