import 'package:flutter/material.dart';

class ButtonDefault extends StatelessWidget {
  final String? title;
  final Color? textColor, backgroundColor;
  final BoxBorder? border;
  final void Function()? onTap;
  const ButtonDefault({
    Key? key,
    this.title,
    this.textColor,
    this.backgroundColor,
    this.border,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 49,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: backgroundColor ?? const Color(0XFF0F62FE),
          border: border,
        ),
        alignment: Alignment.center,
        padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 6),
        margin: const EdgeInsets.only(top: 32),
        child: Text(
          title ?? "Submit",
          style: TextStyle(
            color: textColor ?? Colors.white,
            fontSize: 16,
          ),
          maxLines: 1,
          overflow: TextOverflow.clip,
        ),
      ),
    );
  }
}
