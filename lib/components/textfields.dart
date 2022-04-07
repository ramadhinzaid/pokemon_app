import 'package:flutter/material.dart';

class TextFields extends StatelessWidget {
  final String? label;
  final TextEditingController? controller;
  final int? maxLines, minLines;
  final TextInputType? type;
  final void Function(String)? onChanged;
  final InputBorder? border;
  final EdgeInsetsGeometry? contentPadding;
  final String? Function(String?)? validator;
  const TextFields({
    Key? key,
    this.controller,
    this.label,
    this.maxLines,
    this.minLines,
    this.onChanged,
    this.type,
    this.border,
    this.contentPadding,
    this.validator,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          label ?? "Label",
          style: const TextStyle(
            fontSize: 16,
          ),
        ),
        const SizedBox(height: 6),
        TextFormField(
          controller: controller,
          maxLines: maxLines ?? 1,
          minLines: minLines ?? 1,
          keyboardType: type,
          onChanged: onChanged,
          validator: validator,
          decoration: InputDecoration(
            contentPadding: contentPadding,
            border: border ??
                OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide.none,
                ),
            focusedBorder: border,
          ),
        )
      ],
    );
  }
}
