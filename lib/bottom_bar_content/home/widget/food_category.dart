import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_delivery/bottom_bar_content/home/logic/selected_food_category/selected_food_category_cubit.dart';
import 'package:google_fonts/google_fonts.dart';

class FoodCategory extends StatelessWidget {
  final List<String> foodCategory;
  const FoodCategory({
    Key? key,
    required this.foodCategory,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => SizedBox(
        height: 50.h,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: foodCategory.length,
          itemBuilder: (_, index) =>
              BlocBuilder<SelectedFoodCategoryCubit, SelectedFoodCategoryState>(
            builder: (context, state) {
              return Padding(
                padding: EdgeInsets.symmetric(horizontal: 8.h),
                child: GestureDetector(
                  onTap: () {
                    context
                        .read<SelectedFoodCategoryCubit>()
                        .selectCategory(index: index);
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: state.selectedIndex == index
                            ? Colors.transparent
                            : Colors.orange,
                      ),
                      borderRadius: BorderRadius.circular(10.r),
                      color: state.selectedIndex == index
                          ? Colors.amber
                          : Colors.transparent,
                    ),
                    alignment: Alignment.center,
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 15.w),
                      child: Text(
                        foodCategory[index],
                        style: GoogleFonts.poppins(
                            textStyle: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 13.sp,
                        )),
                      ),
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      );
}
