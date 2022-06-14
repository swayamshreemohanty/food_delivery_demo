import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_delivery/constant/dummy_dart.dart';
import 'package:google_fonts/google_fonts.dart';

class FoodCatalog extends StatelessWidget {
  final Food food;
  const FoodCatalog({
    Key? key,
    required this.food,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      color: Colors.transparent,
      height: 350.h,
      width: 250.w,
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 10.h),
        child: Stack(
          children: [
            Column(
              children: [
                SizedBox(height: 60.h),
                Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                  color: Colors.white,
                  child: Padding(
                    padding: EdgeInsets.fromLTRB(
                      20.w,
                      10.h,
                      20.w,
                      20.h,
                    ),
                    child: SizedBox(
                      width: 240.w,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          SizedBox(height: 70.h),
                          Column(
                            children: [
                              Text(
                                food.title,
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: GoogleFonts.poppins(
                                  textStyle: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18.sp,
                                  ),
                                ),
                              ),
                              SizedBox(height: 6.h),
                              Text(
                                food.subtitle,
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: GoogleFonts.poppins(
                                  textStyle: TextStyle(
                                    fontWeight: FontWeight.w300,
                                    color: Colors.grey.withOpacity(0.8),
                                    fontSize: 14.sp,
                                  ),
                                ),
                              ),
                              SizedBox(height: 6.h),
                              Text(
                                "🔥 ${food.calories} Calories",
                                style: GoogleFonts.poppins(
                                  textStyle: TextStyle(
                                    fontWeight: FontWeight.w700,
                                    color: Colors.red,
                                    fontSize: 15.sp,
                                  ),
                                ),
                              ),
                              RichText(
                                  text: TextSpan(children: <TextSpan>[
                                TextSpan(
                                  text: "\$ ",
                                  style: GoogleFonts.poppins(
                                    textStyle: TextStyle(
                                      fontWeight: FontWeight.w700,
                                      color: Colors.amber,
                                      fontSize: 15.sp,
                                    ),
                                  ),
                                ),
                                TextSpan(
                                  text: food.price.toString(),
                                  style: GoogleFonts.poppins(
                                    textStyle: TextStyle(
                                      fontWeight: FontWeight.w700,
                                      color: Colors.black,
                                      fontSize: 28.sp,
                                    ),
                                  ),
                                ),
                              ]))
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Positioned(
              top: 10,
              left: 0,
              right: 0,
              child: CachedNetworkImage(
                width: 80.w,
                height: 120.h,
                imageUrl: food.imageUrl,
                fit: BoxFit.fitHeight,
                progressIndicatorBuilder: (context, url, downloadProgress) =>
                    Center(
                  child: CircularProgressIndicator(
                      valueColor: const AlwaysStoppedAnimation<Color>(
                        Colors.black,
                      ),
                      strokeWidth: 2.0,
                      value: downloadProgress.progress),
                ),
                errorWidget: (context, url, error) =>
                    const Center(child: Icon(Icons.error)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
