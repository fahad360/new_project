import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:new_project/theme/styles.dart';

class LogoutDialogBox extends StatelessWidget {
  final GestureTapCallback? onConfirmTap;
  final GestureTapCallback? onCancelTap;
  final String? confirmationText;
  const LogoutDialogBox(
      {Key? key, this.onConfirmTap, this.onCancelTap, this.confirmationText})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(30),
      ),
      elevation: 0,
      backgroundColor: Colors.white,
      child: SizedBox(
        height: size.height * 0.230,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
              alignment: Alignment.centerLeft,
              child: Text(
                confirmationText!,
                overflow: TextOverflow.ellipsis,
                style: GoogleFonts.nunito(
                    fontSize: size.height * 0.026,
                    color: const Color(0xff383E56),
                    fontWeight: FontWeight.w700),
              ),
            ),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 20),
              alignment: Alignment.centerLeft,
              child: Text(
                'Are you sure?',
                overflow: TextOverflow.ellipsis,
                style: GoogleFonts.nunito(
                    fontSize: size.height * 0.024,
                    color: const Color(0xff383E56),
                    fontWeight: FontWeight.w600),
              ),
            ),
            SizedBox(
              height: size.height * 0.030,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                TextButton(
                  style: TextButton.styleFrom(
                    padding: const EdgeInsets.only(right: 30),
                    foregroundColor: Colors.transparent,
                  ),
                  onPressed: onConfirmTap,
                  child: Center(
                    child: Text(
                      'Confirm',
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.center,
                      style: GoogleFonts.nunito(
                          fontSize: size.height * 0.028,
                          color: MyStyles.themeMode().textColor,
                          fontWeight: FontWeight.w700),
                    ),
                  ),
                ),
                TextButton(
                  style: TextButton.styleFrom(
                    padding: const EdgeInsets.only(right: 30),
                    foregroundColor: Colors.transparent,
                  ),
                  onPressed: onCancelTap,
                  child: Center(
                    child: Text(
                      'Cancel',
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.center,
                      style: GoogleFonts.nunito(
                          fontSize: size.height * 0.028,
                          color: MyStyles.themeData().primaryColor,
                          fontWeight: FontWeight.w700),
                    ),
                  ),
                ),
                SizedBox(
                  height: size.height * 0.050,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
