import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:new_project/theme/styles.dart';

Widget textFormFieldTitle({
  Size? size,
  String? title,
  bool? withAsterick,
}) {
  return RichText(
    text: TextSpan(
        text: title,
        style: GoogleFonts.ubuntu(
            fontSize: size!.height * 0.020,
            color: MyStyles.themeMode().mainTextColor,
            fontWeight: FontWeight.w600),
        children: [
          TextSpan(
            text: withAsterick! ? ' *' : ' ',
            style: GoogleFonts.ubuntu(
                fontSize: size.height * 0.024,
                color: Colors.red,
                fontWeight: FontWeight.w600),
          ),
        ]),
  );
}
