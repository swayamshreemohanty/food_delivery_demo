import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery/bottom_bar_content/home/widget/food_catalog.dart';
import 'package:food_delivery/constant/dummy_dart.dart';

class FoodCatelogCarousel extends StatefulWidget {
  final List<Food> foodlist;
  const FoodCatelogCarousel({
    Key? key,
    required this.foodlist,
  }) : super(key: key);

  @override
  State<FoodCatelogCarousel> createState() => _FoodCatelogCarouselState();
}

class _FoodCatelogCarouselState extends State<FoodCatelogCarousel> {
  final CarouselController _controller = CarouselController();

  @override
  Widget build(BuildContext context) => CarouselSlider.builder(
        itemCount: widget.foodlist.length,
        carouselController: _controller,
        itemBuilder: (_, index, realIndex) =>
            FoodCatalog(food: widget.foodlist[index]),
        options: CarouselOptions(
          disableCenter: false,
          viewportFraction: 0.6,
          enlargeCenterPage: true,
          aspectRatio: 9 / 16,
          enableInfiniteScroll: false,
          initialPage: widget.foodlist.length > 1 ? 1 : 0,
          enlargeStrategy: CenterPageEnlargeStrategy.height,
        ),
      );
}
