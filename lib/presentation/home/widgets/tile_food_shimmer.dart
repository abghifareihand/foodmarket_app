import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class TileFoodShimmer extends StatelessWidget {
  const TileFoodShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: 3,
      itemBuilder: (context, index) {
        return Shimmer.fromColors(
          baseColor: Colors.grey[300]!,
          highlightColor: Colors.grey[100]!,
          child: Container(
            padding: const EdgeInsets.symmetric(
              vertical: 12,
              horizontal: 20,
            ),
            child: Row(
              children: [
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    color: Colors.white,
                  ),
                  height: 80,
                  width: 80,
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        height: 16,
                        width: 120,
                        color: Colors.white,
                      ),
                      const SizedBox(height: 4),
                      Container(
                        height: 12,
                        width: 100,
                        color: Colors.white,
                      ),
                      const SizedBox(height: 4),
                      Container(
                        height: 14,
                        width: 80,
                        color: Colors.white,
                      ),
                    ],
                  ),
                ),
                Container(
                  width: 80,
                  height: 16,
                  color: Colors.white,
                ),
                const SizedBox(width: 8),
                Container(
                  width: 18,
                  height: 14,
                  color: Colors.white,
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
