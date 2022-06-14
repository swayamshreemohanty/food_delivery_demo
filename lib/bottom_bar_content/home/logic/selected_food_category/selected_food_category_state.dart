part of 'selected_food_category_cubit.dart';

class SelectedFoodCategoryState extends Equatable {
  final int selectedIndex;
  const SelectedFoodCategoryState({
    required this.selectedIndex,
  });

  @override
  List<Object> get props => [selectedIndex];

  SelectedFoodCategoryState copyWith({int? selectedIndex}) =>
      SelectedFoodCategoryState(
        selectedIndex: selectedIndex ?? this.selectedIndex,
      );
}