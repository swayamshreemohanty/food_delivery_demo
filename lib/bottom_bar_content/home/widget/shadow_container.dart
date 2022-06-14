import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ShadowContainer extends StatelessWidget {
  final Color? backgroundColor;
  final Widget child;
  final Offset? offset;
  final double? opacity;
  const ShadowContainer({
    Key? key,
    this.backgroundColor,
    this.offset,
    this.opacity,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(opacity ?? 0.5),
            spreadRadius: 0.1.r,
            blurRadius: 2.r,
            offset: offset ?? const Offset(0, 0), // changes position of shadow
          ),
        ],
        color: backgroundColor ?? Theme.of(context).primaryColor,
        borderRadius: BorderRadius.circular(12.r),
      ),
      child: child,
    );
  }
}
