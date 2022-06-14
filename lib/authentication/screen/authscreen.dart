import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_delivery/authentication/widget/auth_card.dart';

class AuthScreen extends StatelessWidget {
  static const routeName = '/auth_screen';
  const AuthScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // final _deviceSize = MediaQuery.of(context).size;

    final logo = Container(
      color: Colors.white,
      height: 360.h,
      width: 400.w,
      child: Image.asset(
        'assets/auth_screen_logo.png',
        fit: BoxFit.fitHeight,
      ),
    );

    return Scaffold(
      body: Container(
        color: Colors.white10,
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            children: <Widget>[
              SizedBox(height: 40.h),
              logo,
              const AuthCard(),
            ],
          ),
        ),
      ),
    );
  }
}
