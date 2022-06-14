// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_delivery/bottom_bar_content/home/widget/shadow_container.dart';

class SearchBarWithFilter extends StatelessWidget {
  const SearchBarWithFilter({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Row(
        children: [
          Expanded(
            child: TextField(
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.grey.withOpacity(0.08),
                prefixIcon: const Icon(Icons.search),
                hintText: "Search food...",
                enabledBorder: OutlineInputBorder(
                  borderSide: const BorderSide(
                    color: Colors.transparent,
                    width: 0,
                  ),
                  borderRadius: BorderRadius.all(Radius.circular(15.sp)),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: const BorderSide(
                    color: Colors.transparent,
                    width: 0,
                  ),
                  borderRadius: BorderRadius.all(Radius.circular(15.sp)),
                ),
              ),
              onChanged: (value) {},
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
              left: 20.w,
              right: 10.w,
            ),
            child: ShadowContainer(
              child: Padding(
                padding: EdgeInsets.symmetric(
                  vertical: 4.5.h,
                  horizontal: 4.5.w,
                ),
                child: IconButton(
                  iconSize: 25.sp,
                  onPressed: () {},
                  icon: const Icon(Icons.filter_alt),
                ),
              ),
            ),
          )
        ],
      );
}
