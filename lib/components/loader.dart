import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ListLoader extends StatelessWidget {
  final int length;
  const ListLoader({Key? key, this.length = 10}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return ListView.builder(
      shrinkWrap: true,
      itemCount: length,
      itemBuilder: (ctx, idx) => Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        child: SizedBox(
          height: 130,
          width: size.width,
          child: Shimmer.fromColors(
            baseColor: const Color(0xFFF4F4F4),
            highlightColor: Colors.grey[300]!,
            child: Container(
              width: double.infinity,
              height: 8.0,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
