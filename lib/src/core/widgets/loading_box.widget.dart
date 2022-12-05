import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class LoadingBox extends StatelessWidget {
  final double width, height;

  LoadingBox(this.width, this.height);

  @override
  Widget build(BuildContext context) {
    return Opacity(
      opacity: 0.25,
      child: Shimmer.fromColors(
        baseColor: Colors.white,
        highlightColor: Colors.transparent,
        child: Container(
          color: Colors.white,
          width: width,
          height: height,
        ),
      ),
    );
  }
}
