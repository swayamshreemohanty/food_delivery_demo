// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_delivery/authentication/logic/authentication/authentication_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

class AppDrawer extends StatelessWidget {
  final User userDetails;
  const AppDrawer({
    Key? key,
    required this.userDetails,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          UserAccountsDrawerHeader(
            decoration: const BoxDecoration(color: Colors.white),
            currentAccountPicture: userDetails.photoURL == null
                ? CircleAvatar(
                    backgroundColor: Colors.grey.shade100,
                    child: Text(
                      userDetails.email![0],
                      style: GoogleFonts.poppins(
                        textStyle: TextStyle(fontSize: 40.sp),
                      ),
                    ),
                  )
                : CircleAvatar(
                    backgroundColor: Colors.transparent,
                    backgroundImage: NetworkImage('${userDetails.photoURL}'),
                  ),
            accountName: Text(
              userDetails.displayName ?? '',
            ),
            accountEmail: Text(
              '${userDetails.email}',
            ),
          ),
          Card(
            elevation: 2,
            child: ListTile(
              leading: const Icon(Icons.exit_to_app_rounded),
              title: const Text('Log Out'),
              onTap: () {
                HapticFeedback.heavyImpact();
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
            ),
          ),
        ],
      ),
    );
  }
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
