import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_delivery/bottom_bar_content/logic/go_to_home/go_to_home_cubit.dart';

class CartScreen extends StatelessWidget {
  static const String routeName = '/cart_screen';

  const CartScreen({Key? key}) : super(key: key);

  Future<bool> willPopScope(BuildContext context) async {
    BlocProvider.of<GoToHomeCubit>(context).goToHomeHome();
    //Return false to not to close the app when the back button will triggered.
    return false;
  }

  @override
  Widget build(BuildContext context) => WillPopScope(
        onWillPop: () => willPopScope(context),
        child: const Center(
          child: Text("This is Cart Screen"),
        ),
      );
}
