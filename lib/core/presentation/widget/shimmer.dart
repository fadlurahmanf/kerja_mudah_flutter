import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';


class AppShimmer extends StatelessWidget {
  final Color? baseColor;
  final Color? highlightColor;
  final BorderRadiusGeometry? borderRadius;
  const AppShimmer({this.baseColor, this.highlightColor, this.borderRadius, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
        child: Container(decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: borderRadius,
        ),),
        baseColor: baseColor??Colors.grey,
        highlightColor: highlightColor??Colors.white
    );
  }
}
