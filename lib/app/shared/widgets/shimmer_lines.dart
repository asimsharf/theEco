import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class PlaceholderLines extends StatelessWidget {
  final int lines;
  const PlaceholderLines({super.key, required this.lines});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey.shade300,
      highlightColor: Colors.grey.shade100,
      enabled: true,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: List.generate(
          lines,
          (index) {
            final width = index == lines - 1
                ? 0.50
                : index == lines - 2
                    ? 0.60
                    : 0.98;
            return Container(
              margin: const EdgeInsets.only(bottom: 8),
              width: lines > 1
                  ? MediaQuery.of(context).size.width * width
                  : double.infinity,
              height: 10,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(5),
              ),
            );
          },
        ),
      ),
    );
  }
}
