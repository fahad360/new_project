// ignore: file_names
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

InputDecoration inputDecoration({
  String? hintText,
  String? labelText,
  BuildContext? context,
  Widget? suffix,
}) {
  var size = MediaQuery.of(context!).size;
  return InputDecoration(
    hintText: hintText,
    labelText: labelText,
    suffixIcon: suffix,
    suffixIconConstraints: const BoxConstraints(
      minHeight: 32,
      minWidth: 32,
    ),
    hintStyle: GoogleFonts.ubuntu(
        fontSize: size.height * 0.019,
        fontWeight: FontWeight.w600,
        color: Colors.grey[400]),
    prefixIconConstraints: const BoxConstraints(minHeight: 22, minWidth: 22),
    floatingLabelBehavior: FloatingLabelBehavior.always,
    contentPadding: const EdgeInsets.symmetric(horizontal: 35, vertical: 15),
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(12),
      borderSide: const BorderSide(color: Color(0xff516160)),
      gapPadding: 10,
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(12),
      borderSide: const BorderSide(color: Color(0xffA75FFF)),
    ),
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(12),
      borderSide: const BorderSide(color: Color(0xff516160)),
      gapPadding: 10,
    ),
  );
}
