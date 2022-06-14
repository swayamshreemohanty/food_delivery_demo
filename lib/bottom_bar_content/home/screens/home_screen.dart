import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_delivery/bottom_bar_content/home/widget/food_catalog_carousel.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:food_delivery/bottom_bar_content/home/logic/food_management/foodmanagemet_bloc.dart';
import 'package:food_delivery/bottom_bar_content/home/widget/app_drawer.dart';
import 'package:food_delivery/bottom_bar_content/home/widget/food_category.dart';
import 'package:food_delivery/bottom_bar_content/home/widget/search_bar.dart';
import 'package:food_delivery/bottom_bar_content/home/widget/shadow_container.dart';
import 'package:food_delivery/utility/firebase_current_user_data.dart';
import 'package:food_delivery/utility/loading_indicator.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final GlobalKey<ScaffoldState> _scaffoldkey = GlobalKey<ScaffoldState>();
  @override
  void initState() {
    context.read<FoodmanagemetBloc>().add(FetchFoodsDetailsForHome());
    super.initState();
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        key: _scaffoldkey,
        drawer: AppDrawer(
          userDetails: FirebaseCurrentUserData().userDetails!,
        ),
        body: ListView(
          padding: EdgeInsets.zero,
          // crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 40.h),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 15.w),
              child: Row(children: [
                ShadowContainer(
                  opacity: 0.2,
                  offset: const Offset(0.8, 8),
                  backgroundColor: Colors.white,
                  child: IconButton(
                      iconSize: 25.sp,
                      onPressed: () {
                        _scaffoldkey.currentState!.openDrawer();
                      },
                      icon: const Icon(
                        Icons.menu,
                      )),
                ),
              ]),
            ),
            SizedBox(height: 20.h),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 15.w),
              child: const PageHeadingWidget(
                text1: "Let's eat",
                text2: "Quality food 😋",
              ),
            ),
            SizedBox(height: 20.h),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              child: const SearchBarWithFilter(),
            ),
            SizedBox(height: 40.h),
            BlocBuilder<FoodmanagemetBloc, FoodmanagemetState>(
              builder: (context, state) {
                if (state is FoodDataLoading) {
                  return const LoadingIndicator();
                } else if (state is FoodDataFetched) {
                  return Padding(
                    padding: EdgeInsets.only(left: 15.w),
                    child: Column(
                      children: [
                        FoodCategory(foodCategory: state.foodCategory),
                        SizedBox(height: 20.h),
                        FoodCatelogCarousel(foodlist: state.foodList),
                      ],
                    ),
                  );
                } else {
                  return const Center(
                    child: Text('No Data found'),
                  );
                }
              },
            ),
          ],
        ),
      );
}

class PageHeadingWidget extends StatelessWidget {
  final String text1;
  final String text2;
  final Color? textColor;
  const PageHeadingWidget({
    Key? key,
    required this.text1,
    required this.text2,
    this.textColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // final deviceSize = MediaQuery.of(context).size;
    final textStyle = GoogleFonts.poppins(
      textStyle: TextStyle(
        color: textColor ?? Colors.black,
        fontWeight: FontWeight.bold,
        fontSize: 31.sp,
      ),
    );
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: 10.w,
      ),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Text(text1, style: textStyle),
        Text(text2, style: textStyle),
      ]),
    );
  }
}
