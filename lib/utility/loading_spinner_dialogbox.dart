import 'package:flutter/material.dart';
import 'package:food_delivery/utility/loading_indicator.dart';

class ShowDialogSpinner {
  static void showDialogSpinner({required BuildContext context}) async {
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (_) => const LoadingIndicator(
        color: Colors.white,
      ),
    );
  }
}
