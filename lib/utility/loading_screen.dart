import 'package:flutter/material.dart';
import 'package:food_delivery/utility/loading_indicator.dart';

class LoadingScreen extends StatelessWidget {
  const LoadingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => const Scaffold(
        body: Center(child: LoadingIndicator()),
      );
}
