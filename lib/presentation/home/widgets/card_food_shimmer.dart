import 'package:flutter/material.dart';
import 'package:foodmarket_app/core/components/spaces.dart';
import 'package:shimmer/shimmer.dart';

class CardFoodShimmer extends StatelessWidget {
  const CardFoodShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      scrollDirection: Axis.horizontal,
      physics: const BouncingScrollPhysics(),
      itemCount: 3,
      padding: const EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 8,
      ),
      separatorBuilder: (context, index) => const SpaceWidth(16),
      itemBuilder: (context, index) {
        return Shimmer.fromColors(
          baseColor: Colors.grey[300]!,
          highlightColor: Colors.grey[100]!,
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              color: Colors.white,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                /// Image
                ClipRRect(
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(16),
                    topRight: Radius.circular(16),
                  ),
                  child: Container(
                    height: 140,
                    width: 200,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 12),
                Container(
                  padding: const EdgeInsets.only(left: 12),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        height: 16,
                        width: 150, // Adjust the width as needed
                        color: Colors.white,
                      ),
                      const SizedBox(height: 4),
                      Container(
                        height: 16,
                        width: 100, // Adjust the width as needed
                        color: Colors.white,
                      ),
                      const SizedBox(height: 4),
                      Row(
                        children: [
                          Container(
                            height: 16,
                            width: 80, // Adjust the width as needed
                            color: Colors.white,
                          ),
                          const SizedBox(width: 8),
                          Container(
                            height: 16,
                            width: 40, // Adjust the width as needed
                            color: Colors.white,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
