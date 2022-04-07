import 'package:flutter/material.dart';

class MovesCard extends StatelessWidget {
  final Color? textColor, backgroundColor;
  final String? title;
  const MovesCard({
    Key? key,
    this.backgroundColor,
    this.textColor,
    this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: backgroundColor ?? Theme.of(context).cardColor,
      ),
      // alignment: Alignment.center,
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 6),
      margin: const EdgeInsets.only(right: 16),
      child: Text(
        title ?? "",
        style: TextStyle(
          color: textColor ?? Theme.of(context).primaryColor,
          fontSize: 16,
        ),
        maxLines: 1,
        overflow: TextOverflow.clip,
      ),
    );
  }
}
