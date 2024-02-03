import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:new_project/theme/styles.dart';

Widget appbarWidget(
    {BuildContext? context,
    Size? size,
    String? title,
    required Color color,
    final GestureTapCallback? onTap}) {
  return AppBar(
    elevation: 0.0,
    backgroundColor: Colors.white,
    leading: Padding(
      padding: const EdgeInsets.fromLTRB(15, 12, 0, 0),
      child: IconButton(
        icon: Icon(Icons.arrow_back_ios_new_rounded,
            color: MyStyles.themeData().primaryColor),
        onPressed: onTap,
      ),
    ),
    title: Padding(
      padding: const EdgeInsets.only(top: 10.0),
      child: Text(
        title!,
        overflow: TextOverflow.ellipsis,
        style: GoogleFonts.ubuntu(
            fontSize: size!.height * 0.032,
            color: color,
            fontWeight: FontWeight.w800),
      ),
    ),
  );
}
