import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_delivery/authentication/logic/authentication/authentication_bloc.dart';
import 'package:food_delivery/authentication/logic/login/login_bloc.dart';
import 'package:food_delivery/authentication/screen/authscreen.dart';
import 'package:food_delivery/bottom_bar_content/home/logic/food_management/foodmanagemet_bloc.dart';
import 'package:food_delivery/bottom_bar_content/home/logic/selected_food_category/selected_food_category_cubit.dart';
import 'package:food_delivery/bottom_bar_content/logic/go_to_home/go_to_home_cubit.dart';
import 'package:food_delivery/bottom_bar_content/screen/bottom_landing_screen.dart';
import 'package:food_delivery/config/routes/application_page_routes.dart';
import 'package:food_delivery/firebase_options.dart';
import 'package:food_delivery/utility/loading_screen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]);
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final _authenticationBloc = AuthenticationBloc();

  @override
  void initState() {
    _authenticationBloc.add(AppStarted());
    super.initState();
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider.value(value: _authenticationBloc),
        BlocProvider<LoginBloc>(
          create: (context) => LoginBloc(
            authenticationBloc: BlocProvider.of<AuthenticationBloc>(context),
          ),
        ),
        BlocProvider<GoToHomeCubit>(
          create: (context) => GoToHomeCubit(),
        ),
        BlocProvider<FoodmanagemetBloc>(
          create: (context) => FoodmanagemetBloc(),
        ),
        BlocProvider<SelectedFoodCategoryCubit>(
          create: (context) => SelectedFoodCategoryCubit(),
        ),
      ],
      child: ScreenUtilInit(
        designSize: Size(
          WidgetsBinding.instance.window.physicalSize.width /
              WidgetsBinding.instance.window.devicePixelRatio,
          WidgetsBinding.instance.window.physicalSize.height /
              WidgetsBinding.instance.window.devicePixelRatio,
        ),
        builder: (_, child) => MaterialApp(
          title: 'Flutter Demo',
          theme: ThemeData(
            primarySwatch: Colors.amber,
          ),
          home: BlocBuilder<AuthenticationBloc, AuthenticationState>(
            builder: (buildContext, state) {
              if (state is AuthenticationUninitialized) {
                return const LoadingScreen();
              } else if (state is AuthenticationAuthenticated) {
                return const BottomLandingScreen();
              } else if (state is AuthenticationUnauthenticated) {
                return const AuthScreen();
              } else {
                return const LoadingScreen();
              }
            },
          ),
          onGenerateRoute: ScreenRouter().onGeneratedRouter,
        ),
      ),
    );
  }
}
