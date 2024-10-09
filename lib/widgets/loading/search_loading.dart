import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';

class SearchLoading extends StatelessWidget {
  const SearchLoading({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    return Shimmer.fromColors(
      baseColor: Colors.grey.shade300,
      highlightColor: Colors.grey.shade100,
      enabled: true,
      child: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        physics: const NeverScrollableScrollPhysics(),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          mainAxisSize: MainAxisSize.max,
          children: [
            ...List.generate(6, (_) => _searchResultPlaceholder()),
          ],
        ),
      ),
    );
  }

  Widget _searchResultPlaceholder() {
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      height: 80,
      child: Row(
        children: [
          Container(
            width: 80,
            height: 80,
            decoration: BoxDecoration(
              color: Colors.grey.shade300,
              borderRadius: BorderRadius.circular(8),
            ),
          ),
          16.horizontalSpace,
          Expanded(
            child: Container(
              height: 20,
              color: Colors.grey.shade300,
            ),
          ),
        ],
      ),
    );
  }
}
