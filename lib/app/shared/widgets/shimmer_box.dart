import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class PlaceholderBox extends StatelessWidget {
  final BoxShape shape;
  final double width;
  final double height;
  const PlaceholderBox({
    super.key,
    this.shape = BoxShape.rectangle,
    this.width = 25,
    this.height = 25,
  });
  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey.shade300,
      highlightColor: Colors.grey.shade100,
      enabled: true,
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          shape: shape,
          color: Colors.white,
        ),
      ),
    );
  }
}
