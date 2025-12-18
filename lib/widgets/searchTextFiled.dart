import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../app_utils/app_colors.dart';

Widget SearchTextField(
    TextEditingController controller,
    Color filledColor,
    Color IconColor,
    String title,
    bool isIconUsed,
    Color borderColor,
    bool isMaxLines, {
      TextInputType? keyBoardInput, // optional
      List<TextInputFormatter>? inputFormatters, // optional
    }) {
  return TextField(
    controller: controller,
    maxLines: isMaxLines ? 4 : 1,
    keyboardType: keyBoardInput, // agar null hoga toh default TextInputType hoga
    inputFormatters: inputFormatters, // agar null hoga toh koi formatter nahi lagega
    decoration: InputDecoration(
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(11),
        borderSide: BorderSide(color: borderColor),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(11),
        borderSide: BorderSide(color: borderColor),
      ),
      fillColor: filledColor,
      filled: true,
      prefixIcon: isIconUsed ? Icon(Icons.search, color: IconColor) : null,
      hintText: title,
      hintStyle: TextStyle(color: darkGreyColor),
    ),
  );
}
