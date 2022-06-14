import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_delivery/bottom_bar_content/home/screens/home_screen.dart';
import 'package:food_delivery/bottom_bar_content/logic/go_to_home/go_to_home_cubit.dart';
import 'package:food_delivery/demo_screens/activity_screen.dart';
import 'package:food_delivery/demo_screens/articles_screen.dart';
import 'package:food_delivery/demo_screens/bookmark_screen.dart';
import 'package:food_delivery/demo_screens/cart_screen.dart';
import 'package:food_delivery/utility/tools/responsive_handler.dart';
import 'package:stylish_bottom_bar/stylish_bottom_bar.dart';

class BottomLandingScreen extends StatefulWidget {
  static const routeName = '/';

  const BottomLandingScreen({
    Key? key,
  }) : super(key: key);

  @override
  _BottomLandingScreenState createState() => _BottomLandingScreenState();
}

class _BottomLandingScreenState extends State<BottomLandingScreen> {
  int _selectedPageIndex = 0;

  Future<void> selectPageIndex(int index) async {
    setState(() {
      _selectedPageIndex = index;
    });
  }

  Widget _gotoPage() {
    switch (_selectedPageIndex) {
      case 0:
        return const HomeScreen();
      case 1:
        return const ArticlesScreen();
      case 2:
        return const BookMarkScreen();
      case 3:
        return const ActivityScreen();
      default:
        return const HomeScreen();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _gotoPage(),
      bottomNavigationBar: BlocListener<GoToHomeCubit, GoToHomeState>(
        listener: (_, state) {
          if (state is GoToHomeTriggered) {
            selectPageIndex(0);
          } else if (state is GoToIndex) {
            selectPageIndex(state.index);
          }
        },
        child: ResponsiveWidget.isDesktop(context)
            ? const SizedBox.shrink()
            : StylishBottomBar(
                onTap: (index) {
                  selectPageIndex(index ?? 0);
                },
                iconSize: 30.sp,
                opacity: 0.3,
                currentIndex: _selectedPageIndex,
                barAnimation: BarAnimation.fade,
                iconStyle: IconStyle.Default,
                hasNotch: true,
                fabLocation: StylishBarFabLocation.center,
                items: [
                  AnimatedBarItems(
                    icon: const Icon(
                      Icons.house_outlined,
                    ),
                    selectedColor: Theme.of(context).primaryColor,
                    title: const Text(''),
                  ),
                  AnimatedBarItems(
                    backgroundColor: Colors.white,
                    icon: const Icon(Icons.book),
                    title: const Text(''),
                    selectedColor: Theme.of(context).primaryColor,
                  ),
                  AnimatedBarItems(
                    backgroundColor: Colors.white,
                    icon: const Icon(Icons.bookmark),
                    title: const Text(''),
                    selectedColor: Theme.of(context).primaryColor,
                  ),
                  AnimatedBarItems(
                    backgroundColor: Colors.white,
                    icon: const Icon(Icons.notifications),
                    title: const Text(''),
                    selectedColor: Theme.of(context).primaryColor,
                  ),
                ],
              ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, CartScreen.routeName);
        },
        backgroundColor: Colors.white,
        child: const Icon(Icons.shopping_bag_outlined),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}
