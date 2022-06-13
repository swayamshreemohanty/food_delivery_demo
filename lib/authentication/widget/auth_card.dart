// ignore_for_file: use_build_context_synchronously
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
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
  TextStyle defaultStyle = TextStyle(color: Colors.grey, fontSize: 12.sp);
  TextStyle linkStyle = const TextStyle(color: Colors.blue);
  final GlobalKey<FormState> _formKey = GlobalKey();
  final _userEmailController = TextEditingController();
  final _passwordController = TextEditingController();

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

  @override
  void dispose() {
    _userEmailController.dispose();
    _passwordController.dispose();

    super.dispose();
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
    if (_authMode == AuthMode.login) {
      setState(() {
        _authMode = AuthMode.signup;
      });
    } else {
      setState(() {
        _authMode = AuthMode.login;
      });
    }
  }

  userEmail() => TextFormField(
        key: const ValueKey('Email'),
        controller: _userEmailController,
        autofillHints: const [AutofillHints.email],
        textInputAction: TextInputAction.next,
        decoration: InputDecoration(
          hintText: 'Email',
          contentPadding: const EdgeInsets.fromLTRB(20.0, 20.0, 20.0, 20.0),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(32.0),
          ),
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
  password() => TextFormField(
        key: const ValueKey('Password'),
        autofillHints: const [AutofillHints.password],
        textInputAction: TextInputAction.done,
        controller: _passwordController,
        autofocus: false,
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.fromLTRB(20.0, 20.0, 20.0, 20.0),
          hintText: 'Password',
          suffixIcon: IconButton(
            onPressed: showPassword,
            icon: _showPassword
                ? const Icon(Icons.visibility_off)
                : const Icon(Icons.visibility),
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(32.0),
          ),
        ),
        cursorColor: Colors.black,
        //it is used to hide the character during password entry.
        obscureText: _showPassword ? false : true,
        validator: (value) {
          if (value!.isEmpty) {
            return "Field can't be empty";
          } else {
            return null;
          }
        },
        onSaved: (value) {
          _passwordController.text = value!.trim();
        },
      );
  confirmPassword() => TextFormField(
        key: const ValueKey('Confirm password'),
        enabled: _authMode == AuthMode.signup,
        textInputAction: TextInputAction.next,
        decoration: InputDecoration(
          hintText: 'Confirm password',
          contentPadding: const EdgeInsets.fromLTRB(20.0, 20.0, 20.0, 20.0),
          suffixIcon: IconButton(
            onPressed: showConfirmPassword,
            icon: _showConfirmPassword
                ? const Icon(Icons.visibility_off)
                : const Icon(Icons.visibility),
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(32.0),
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
              borderRadius: BorderRadius.circular(30.r),
            ),
          ),
          // backgroundColor:
          //     MaterialStateProperty.all(UiColors.logInButtonBackground),
          // foregroundColor:
          //     MaterialStateProperty.all(UiColors.logInButtonForeground),
          textStyle: MaterialStateProperty.all(TextStyle(
            fontWeight: FontWeight.w700,
            // fontSize: authTextresponsiveFontSize(currentFontSize: 16),
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
          textStyle: MaterialStateProperty.all(TextStyle(
            fontSize: 12.sp,
            fontWeight: FontWeight.w700,
            fontFamily: 'Lato',
          )),
        ),
        child: Text(
          _authMode == AuthMode.login
              ? 'New user? Sign up here'
              : 'I have already an account',
        ),
      );
  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          userEmail(),
          password(),
          if (_authMode == AuthMode.signup) confirmPassword(),
          BlocConsumer<LoginBloc, LoginState>(
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
                  submitButton(),
                  Padding(
                    padding: EdgeInsets.only(top: 10.h),
                    child: authSwtich(),
                  ),
                ]);
              }
            },
          ),
        ],
      ),
    );
  }
}
