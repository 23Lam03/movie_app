import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';

class DetailLoading extends StatelessWidget {
  const DetailLoading({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    return Shimmer.fromColors(
      baseColor: Colors.grey.shade300,
      highlightColor: Colors.grey.shade100,
      enabled: true,
      child: SingleChildScrollView(
        // padding: const EdgeInsets.all(20),
        physics: const NeverScrollableScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: size.width,
              height: 320.h,
              decoration: BoxDecoration(
                color: Colors.grey.shade300,
                borderRadius: BorderRadius.circular(4),
              ),
            ),
            16.verticalSpace,
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.max,
              children: [
                Container(
                  width: size.width,
                  color: Colors.blueAccent,
                  child: const Text('alkjsdhasldjhla'),
                ),
                20.verticalSpace,
                Container(
                  width: size.width,
                  color: Colors.blueAccent,
                  child: const Text('alkjsdhasldjhla'),
                ),
                20.verticalSpace,
                Row(
                  children: [
                    Expanded(
                      child: Container(
                        width: size.width / 2,
                        color: Colors.blueAccent,
                        child: const Text('alkjsdhasldjhla'),
                      ),
                    ),
                    8.horizontalSpace,
                    Expanded(
                      child: Container(
                        width: size.width / 2,
                        color: Colors.blueAccent,
                        child: const Text('alkjsdhasldjhla'),
                      ),
                    ),
                  ],
                ),
                20.verticalSpace,
                Container(
                  width: size.width,
                  color: Colors.blueAccent,
                  child: const Text('alkjsdhasldjhla'),
                ),
                20.verticalSpace,
                ...List.generate(4, (_) => __news()),
                20.verticalSpace,
                Container(
                  width: size.width / 2,
                  color: Colors.blueAccent,
                  child: const Text('alkjsdhasldjhla'),
                ),
                20.verticalSpace,
                ...List.generate(4, (_) => __news()),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Container __news() {
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      width: double.infinity,
      height: 112,
      child: Row(
        children: [
          Expanded(
            child: Container(
              color: Colors.amber,
            ),
          ),
          20.horizontalSpace,
          Expanded(
            flex: 2,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: 200,
                  color: Colors.blueAccent,
                  child: const Text('alkjsdhasldjhla'),
                ),
                Container(
                  width: 200,
                  color: Colors.blueAccent,
                  child: const Text('alkjsdhasldjhla'),
                ),
                Container(
                  width: 54,
                  height: 24,
                  color: Colors.blueAccent,
                  child: const Text('alkjsdhasldjhla'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
