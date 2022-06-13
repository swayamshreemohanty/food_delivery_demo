import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_delivery/authentication/widget/auth_card.dart';

class AuthScreen extends StatelessWidget {
  static const routeName = '/auth_screen';
  const AuthScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // final _deviceSize = MediaQuery.of(context).size;

    final logo = SizedBox(
      height: 200.h,
      width: 250.w,
      child: Image.asset(
        'assets/splash_screen_logo.png',
      ),
    );

    return Scaffold(
      body: Container(
        color: Colors.white,
        child: Center(
          child: Container(
            width: 400.w,
            color: Colors.white,
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Column(
                children: <Widget>[
                  SizedBox(height: 40.h),
                  logo,
                  const Padding(
                    padding: EdgeInsets.all(10),
                    child: AuthCard(),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
