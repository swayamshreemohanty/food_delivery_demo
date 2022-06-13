import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class ActivityScreen extends StatelessWidget {
  const ActivityScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) => const Center(
        child: Text("This is Activity Screen"),
      );
}
