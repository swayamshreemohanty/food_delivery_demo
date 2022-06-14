// ignore_for_file: public_member_api_docs, sort_constructors_first
// ignore_for_file: use_build_context_synchronously
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:food_delivery/authentication/logic/login/login_bloc.dart';
import 'package:food_delivery/utility/enums.dart';
import 'package:food_delivery/utility/loading_indicator.dart';

class AuthCard extends StatefulWidget {
  const AuthCard({
    Key? key,
  }) : super(key: key);

  @override
  _AuthCardState createState() => _AuthCardState();
}

class _AuthCardState extends State<AuthCard>
    with SingleTickerProviderStateMixin {
  final GlobalKey<FormState> _formKey = GlobalKey();
  final _userEmailController = TextEditingController();
  final _passwordController = TextEditingController();
  late TabController _tabController;
  AuthMode _authMode = AuthMode.login;
  var _showPassword = false;
  var _showConfirmPassword = false;

  bool showPassword() {
    setState(() {
      _showPassword = !_showPassword;
    });
    return _showPassword;
  }

  bool showConfirmPassword() {
    setState(() {
      _showConfirmPassword = !_showConfirmPassword;
    });
    return _showConfirmPassword;
  }

  Future<void> _submit() async {
    //to vibrate the phone
    await HapticFeedback.lightImpact();
    //close the softkeyboard when _sumbit() is called
    FocusScope.of(context).unfocus();
    if (!_formKey.currentState!.validate()) {
      // Invalid!
      return;
    } else {
      _formKey.currentState!.save();
      context.read<LoginBloc>().add(
            LoginButtonPressed(
              userEmail: _userEmailController.text,
              password: _passwordController.text,
              isLogin: _authMode == AuthMode.login,
            ),
          );
    }
  }

  void _switchAuthMode() {
    _tabController.animateTo(_authMode == AuthMode.login ? 1 : 0);
  }

  TextStyle textFieldTextStyle = GoogleFonts.poppins(
    textStyle: TextStyle(
      fontWeight: FontWeight.w400,
      fontSize: 14.sp,
      color: Colors.black,
    ),
  );

  TextFormField userEmail() => TextFormField(
        key: const ValueKey('Email'),
        controller: _userEmailController,
        autofillHints: const [AutofillHints.email],
        textInputAction: TextInputAction.next,
        decoration: InputDecoration(
          labelText: 'Email Address',
          labelStyle: textFieldTextStyle,
        ),
        cursorColor: Colors.black,
        keyboardType: TextInputType.emailAddress,
        validator: (value) {
          if (value!.isEmpty) {
            return "Field can't be empty";
          } else if (!value.contains('@')) {
            return 'Invalid email!';
          }
          return null;
        },
        onSaved: (value) {
          _userEmailController.text = value!.trim();
        },
      );
  TextFormField password() => TextFormField(
        key: const ValueKey('Password'),
        autofillHints: const [AutofillHints.password],
        textInputAction: TextInputAction.done,
        controller: _passwordController,
        autofocus: false,
        decoration: InputDecoration(
          labelText: 'Password',
          labelStyle: textFieldTextStyle,
          suffixIcon: IconButton(
            onPressed: showPassword,
            icon: _showPassword
                ? const Icon(Icons.visibility_off)
                : const Icon(Icons.visibility),
          ),
        ),
        cursorColor: Colors.black,
        //it is used to hide the character during password entry.
        obscureText: _showPassword ? false : true,
        validator: (value) {
          RegExp regex = RegExp(
              r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$');
          if (value!.isEmpty) {
            return "Field can't be empty";
          } else {
            if (!regex.hasMatch(value)) {
              return 'Your Password should:\ncontain at least one upper case.\ncontain at least one lower case.\ncontain at least one digit.\ncontain at least one Special character.\nat least 8 characters in length.';
            } else {
              return null;
            }
          }
        },
        onSaved: (value) {
          _passwordController.text = value!.trim();
        },
      );
  TextFormField confirmPassword() => TextFormField(
        key: const ValueKey('Confirm password'),
        enabled: _authMode == AuthMode.signup,
        textInputAction: TextInputAction.next,
        decoration: InputDecoration(
          labelText: 'Confirm password',
          labelStyle: textFieldTextStyle,
          suffixIcon: IconButton(
            onPressed: showConfirmPassword,
            icon: _showConfirmPassword
                ? const Icon(Icons.visibility_off)
                : const Icon(Icons.visibility),
          ),
        ),
        cursorColor: Colors.black,
        obscureText: _showConfirmPassword ? false : true,
        validator: _authMode == AuthMode.signup
            ? (value) {
                if (value!.isEmpty) {
                  return 'Re-enter your password';
                } else if (value != _passwordController.text) {
                  return 'Passwords do not match!';
                } else {
                  return null;
                }
              }
            : null,
      );
  submitButton() => ElevatedButton(
        style: ButtonStyle(
          foregroundColor: MaterialStateProperty.all(Colors.black),
          padding: MaterialStateProperty.all(EdgeInsets.symmetric(
            horizontal: 150.w,
            vertical: 18.h,
          )),
          shape: MaterialStateProperty.all(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12.r),
            ),
          ),
          textStyle: MaterialStateProperty.all(TextStyle(
            fontWeight: FontWeight.w700,
            fontSize: 15.sp,
            fontFamily: 'Lato',
          )),
        ),
        onPressed: _submit,
        child: Text(_authMode == AuthMode.login ? 'Log in' : 'Sign up'),
      );
  authSwtich() => TextButton(
        onPressed: _switchAuthMode,
        style: ButtonStyle(
          overlayColor: MaterialStateProperty.all(Colors.transparent),
          backgroundColor: MaterialStateProperty.all(Colors.transparent),
          foregroundColor: MaterialStateProperty.all(Colors.black),
          padding: MaterialStateProperty.all(
            EdgeInsets.symmetric(horizontal: 30.w, vertical: 6.h),
          ),
        ),
        child:
            // _authMode == AuthMode.login

            RichText(
          text: TextSpan(
            children: <TextSpan>[
              TextSpan(
                text: _authMode == AuthMode.login
                    ? "Don't have an account? "
                    : "I have already an account",
                style: GoogleFonts.poppins(
                    textStyle: TextStyle(
                  fontSize: 13.sp,
                  fontWeight: FontWeight.w400,
                  color: Colors.black,
                )),
              ),
              TextSpan(
                text: _authMode == AuthMode.login ? 'Signup' : '',
                style: GoogleFonts.poppins(
                    textStyle: TextStyle(
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w600,
                  color: Theme.of(context).primaryColor,
                )),
              ),
            ],
          ),
        ),
      );

  void _setActiveTabIndex() {
    setState(() {
      _authMode = _tabController.index == 0 ? AuthMode.login : AuthMode.signup;
    });
  }

  @override
  void initState() {
    _tabController = TabController(length: 2, vsync: this);
    _tabController.addListener(_setActiveTabIndex);

    super.initState();
  }

  @override
  void dispose() {
    _userEmailController.dispose();
    _passwordController.dispose();
    _tabController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: SizedBox(
        height: 450.h,
        child: Scaffold(
          backgroundColor: Colors.transparent,
          appBar: PreferredSize(
            preferredSize: Size.fromHeight(40.h),
            child: AppBar(
              elevation: 0.2,
              automaticallyImplyLeading: false,
              backgroundColor: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.vertical(
                  bottom: Radius.circular(25.r),
                ),
              ),
              flexibleSpace: TabBar(
                controller: _tabController,
                indicatorSize: TabBarIndicatorSize.label,
                indicatorWeight: 1.5,
                tabs: [
                  Padding(
                    padding: EdgeInsets.only(bottom: 15.h),
                    child: Text(
                      'Login',
                      style: GoogleFonts.poppins(
                        letterSpacing: 1.0,
                        fontSize: 15.sp,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(bottom: 15.h),
                    child: Text(
                      'Signup',
                      style: GoogleFonts.poppins(
                        letterSpacing: 1.0,
                        fontSize: 15.sp,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          body: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            child: TabBarView(
              controller: _tabController,
              children: [
                LoginWidgets(
                  userEmailTextField: userEmail(),
                  userPasswordTextField: password(),
                  submitButton: submitButton(),
                  authSwitch: authSwtich(),
                ),
                SignInWidgets(
                  userEmailTextField: userEmail(),
                  userPasswordTextField: password(),
                  userConfirmPasswordTextField: confirmPassword(),
                  submitButton: submitButton(),
                  authSwitch: authSwtich(),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class LoginWidgets extends StatelessWidget {
  final TextFormField userEmailTextField;
  final TextFormField userPasswordTextField;
  final Widget submitButton;
  final Widget authSwitch;

  const LoginWidgets({
    Key? key,
    required this.userEmailTextField,
    required this.userPasswordTextField,
    required this.submitButton,
    required this.authSwitch,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => ListView(
        children: [
          SizedBox(height: 25.h),
          userEmailTextField,
          SizedBox(height: 10.h),
          userPasswordTextField,
          SizedBox(height: 40.h),
          SubmitButtonBuilder(
            submitButton: submitButton,
            authSwitch: authSwitch,
          ),
        ],
      );
}

class SignInWidgets extends StatelessWidget {
  final TextFormField userEmailTextField;
  final TextFormField userPasswordTextField;
  final TextFormField userConfirmPasswordTextField;
  final Widget submitButton;
  final Widget authSwitch;
  const SignInWidgets({
    Key? key,
    required this.userEmailTextField,
    required this.userPasswordTextField,
    required this.userConfirmPasswordTextField,
    required this.submitButton,
    required this.authSwitch,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => ListView(
        children: [
          SizedBox(height: 25.h),
          userEmailTextField,
          SizedBox(height: 10.h),
          userPasswordTextField,
          SizedBox(height: 10.h),
          userConfirmPasswordTextField,
          SizedBox(height: 40.h),
          SubmitButtonBuilder(
            submitButton: submitButton,
            authSwitch: authSwitch,
          ),
        ],
      );
}

class SubmitButtonBuilder extends StatelessWidget {
  final Widget submitButton;
  final Widget authSwitch;
  const SubmitButtonBuilder({
    Key? key,
    required this.submitButton,
    required this.authSwitch,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LoginBloc, LoginState>(
      listener: (context, state) {
        if (state is LoginFailure) {
          showDialog(
            context: context,
            builder: (ctx) => AlertDialog(
              title: Text(
                "Error while authenticate",
                style: TextStyle(fontSize: 18.h),
              ),
              content: Text(
                state.rawError,
                style: TextStyle(fontSize: 16.h),
              ),
              actions: [
                TextButton(
                  style: TextButton.styleFrom(
                    primary: Colors.black,
                  ),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: Text(
                    'OK',
                    style: TextStyle(fontSize: 14.h),
                  ),
                ),
              ],
            ),
          );
        }
      },
      builder: (context, state) {
        if (state is LoginLoading) {
          return Column(children: const [LoadingIndicator()]);
        } else {
          return Column(children: [
            submitButton,
            authSwitch,
          ]);
        }
      },
    );
  }
}
