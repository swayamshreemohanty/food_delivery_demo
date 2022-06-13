import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_delivery/bottom_bar_content/home/screens/home_screen.dart';
import 'package:food_delivery/bottom_bar_content/logic/go_to_home/go_to_home_cubit.dart';
import 'package:food_delivery/demo_screens/activity_screen.dart';
import 'package:food_delivery/demo_screens/articles_screen.dart';
import 'package:food_delivery/demo_screens/bookmark_screen.dart';
import 'package:food_delivery/demo_screens/cart_screen.dart';
import 'package:food_delivery/utility/tools/responsive_handler.dart';

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
        return const CartScreen();
      case 3:
        return const BookMarkScreen();
      case 4:
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
            : BottomNavigationBar(
                iconSize: 35,
                onTap: selectPageIndex,
                unselectedItemColor: Colors.grey.shade400,
                selectedItemColor: Colors.red,
                currentIndex: _selectedPageIndex,
                type: BottomNavigationBarType.shifting,
                items: const [
                  BottomNavigationBarItem(
                    tooltip: "Home Page",
                    backgroundColor: Colors.white,
                    icon: Icon(Icons.music_note),
                    label: '',
                  ),
                  BottomNavigationBarItem(
                    tooltip: "Artticles",
                    backgroundColor: Colors.white,
                    icon: Icon(Icons.book),
                    label: '',
                  ),
                  BottomNavigationBarItem(
                    tooltip: "Cart",
                    backgroundColor: Colors.white,
                    icon: Icon(Icons.shopping_bag_outlined),
                    label: '',
                  ),
                  BottomNavigationBarItem(
                    tooltip: "Bookmark",
                    backgroundColor: Colors.white,
                    icon: Icon(Icons.bookmark),
                    label: '',
                  ),
                  BottomNavigationBarItem(
                    tooltip: "Notification",
                    backgroundColor: Colors.white,
                    icon: Icon(Icons.notifications),
                    label: '',
                  ),
                ],
              ),
      ),
    );
  }
}
