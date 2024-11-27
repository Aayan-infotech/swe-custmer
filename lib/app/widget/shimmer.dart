import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shimmer/shimmer.dart';

Widget historyShimmerLayout(BuildContext context) {
  return ListView.builder(
      shrinkWrap: true,
      itemCount: 10,
      itemBuilder: (context, index) {
        return Shimmer.fromColors(
          baseColor: Colors.grey[300]!,
          highlightColor: Colors.grey[100]!,
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 4.0),
            child: Container(
              padding: const EdgeInsets.all(16),
              height: 65,
              margin: const EdgeInsets.symmetric(horizontal: 8),
              decoration: BoxDecoration(
                color: Colors.grey[300],
                borderRadius: BorderRadius.circular(20),
              ),

              // child: Row(
              //  // mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //   children: [
              //     Container(
              //       width: context.width * 0.2,
              //       height: context.height * 0.02,
              //       color: Colors.grey[400],
              //     ),
              //     const SizedBox(height: 8),
              //     Container(
              //       width: context.size!.width * 0.4,
              //       height: context.size!.height * 0.02,
              //       color: Colors.grey[400],
              //     ),
              //   ],
              // ),
            ),
          ),
        );
      });
}

Widget reservationShimmerView(BuildContext context) {
  return Shimmer.fromColors(
    baseColor: Colors.grey[300]!,
    highlightColor: Colors.grey[100]!,
    child: Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 24),
          _shimmerBox(
              width: context.width * 0.56, height: context.height * 0.03),
          const SizedBox(height: 16),
          Container(
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.7),
              borderRadius: BorderRadius.circular(16),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Top Content
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          _shimmerBox(
                              width: context.width * 0.3,
                              height: context.height * 0.02),
                          const SizedBox(height: 8),
                          _shimmerBox(
                              width: context.width * 0.2,
                              height: context.height * 0.02),
                        ],
                      ),
                          _shimmerBox(
                          width: context.width * 0.2,
                          height: context.height * 0.04),
                    ],
                  ),
                ),

                Center(
                  child: _shimmerBox(
                    width: context.width * 0.76,
                    height: context.width * 0.8,
                    borderRadius: 16,
                  ),
                ),
                const SizedBox(height: 16),
                // Delivery & Pickup Time
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Center(
                          child: _shimmerBox(
                              width: context.width * 0.6,
                              height: context.height * 0.01)),
                      const SizedBox(height: 8),
                      Center(
                          child: _shimmerBox(
                              width: context.width * 0.6,
                              height: context.height * 0.01)),
                    ],
                  ),
                ),
                const SizedBox(height: 16),
                // Buttons
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Center(
                          child: _shimmerBox(
                              width: context.width * 0.4,
                              height: context.height * 0.03)),
                      const SizedBox(
                        height: 12,
                      ),
                      Center(
                          child: _shimmerBox(
                              width: context.width * 0.4,
                              height: context.height * 0.03)),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    ),
  );
}

Widget _shimmerBox({
  required double width,
  required double height,
  Color clr = Colors.grey,
  double borderRadius = 8.0,
}) {
  return Container(
    width: width,
    height: height,
    decoration: BoxDecoration(
      color: clr,
      borderRadius: BorderRadius.circular(borderRadius),
    ),
  );
}
