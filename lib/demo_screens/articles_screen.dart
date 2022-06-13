import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_delivery/authentication/logic/authentication/authentication_bloc.dart';
import 'package:food_delivery/bottom_bar_content/logic/go_to_home/go_to_home_cubit.dart';

class ArticlesScreen extends StatelessWidget {
  const ArticlesScreen({Key? key}) : super(key: key);

  Future<bool> willPopScope(BuildContext context) async {
    BlocProvider.of<GoToHomeCubit>(context).goToHomeHome();
    //Return false to not to close the app when the back button will triggered.
    return false;
  }

  @override
  Widget build(BuildContext context) => WillPopScope(
        onWillPop: () => willPopScope(context),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text("This is Article Screen"),
              IconButton(
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (ctx) => AlertDialog(
                      title: const Text("Are you sure!"),
                      content: const Text("You are about to logout!"),
                      actions: [
                        DialogActionButton(
                          buttonName: 'No',
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                        ),
                        DialogActionButton(
                          buttonName: 'Yes',
                          onPressed: () {
                            Navigator.of(context).pop();
                            context.read<AuthenticationBloc>().add(LoggedOut());
                          },
                        ),
                      ],
                    ),
                  );
                },
                icon: const Icon(Icons.exit_to_app_rounded),
              )
            ],
          ),
        ),
      );
}

class DialogActionButton extends StatelessWidget {
  final String buttonName;
  final void Function()? onPressed;
  const DialogActionButton({
    Key? key,
    required this.buttonName,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(Colors.white),
        foregroundColor: MaterialStateProperty.all(Colors.black),
      ),
      onPressed: onPressed,
      child: Text(buttonName),
    );
  }
}
