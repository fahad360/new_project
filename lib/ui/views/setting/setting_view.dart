import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:new_project/theme/colors.dart';
import 'package:new_project/theme/styles.dart';
import 'package:new_project/widgets/logout_dialog_widget.dart';
import 'package:new_project/widgets/main_appbar.dart';
import 'package:stacked/stacked.dart';

import 'setting_viewmodel.dart';

class SettingView extends StackedView<SettingViewModel> {
  const SettingView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    SettingViewModel viewModel,
    Widget? child,
  ) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(100),
        child: Padding(
          padding: const EdgeInsets.only(top: 8.0),
          child: appbarWidget(
            onTap: () {
              viewModel.goBack();
            },
            size: size,
            context: context,
            title: 'Profile Setting',
            color: MyStyles.themeData().primaryColor,
          ),
        ),
      ),
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
          children: [
            Text(
              'Account:',
              overflow: TextOverflow.ellipsis,
              style: GoogleFonts.ubuntu(
                  fontSize: size.height * 0.032,
                  color: MyStyles.themeMode().lightTextColor,
                  fontWeight: FontWeight.w300),
            ),
            usersInfo(
              imageUrl: "model.user!.imageUrl",
              title: 'viewModel',
              emailId: "model.user!.email",
              context: context,
              size: size,
              viewModel: viewModel,
              onTapAction: () {
                viewModel.navigateToEditProfileSection();
              },
            ),
            SizedBox(height: size.height * 0.040),
            Text(
              'Preferences:',
              overflow: TextOverflow.ellipsis,
              style: GoogleFonts.ubuntu(
                  fontSize: size.height * 0.032,
                  color: MyStyles.themeMode().lightTextColor,
                  fontWeight: FontWeight.w300),
            ),
            preferencesRowWidget(
              icon: Icon(
                Icons.pin_outlined,
                color: kDisabledColor,
                size: size.height * 0.035,
              ),
              title: 'Change PIN',
              containerColor: const Color(0xffA7FA93).withOpacity(0.7),
              context: context,
              size: size,
              viewModel: viewModel,
              onTapAction: () {
                viewModel.navigateToOldPINSection();
              },
            ),
            preferencesRowWidget(
              icon: Icon(
                Icons.history,
                color: kDisabledColor,
                size: size.height * 0.030,
              ),
              title: 'History',
              containerColor: const Color(0xffC9E5F1),
              context: context,
              size: size,
              viewModel: viewModel,
              onTapAction: () {
                viewModel.navigateToHistoryView();
              },
            ),
            preferencesRowWidget(
              icon: Icon(
                Icons.change_circle_outlined,
                color: kDisabledColor,
                size: size.height * 0.035,
              ),
              title: 'Change Profile',
              containerColor: Colors.pinkAccent[200]!.withOpacity(0.5),
              context: context,
              size: size,
              viewModel: viewModel,
              onTapAction: () {
                viewModel.navigateToRoleSection();
              },
            ),
            preferencesRowWidget(
              icon: Icon(
                Icons.contact_support_outlined,
                color: kDisabledColor,
                size: size.height * 0.035,
              ),
              title: 'Help & Support',
              containerColor: const Color.fromARGB(255, 239, 255, 168),
              context: context,
              size: size,
              viewModel: viewModel,
              onTapAction: () {
                viewModel.navigateToFaqsSection();
              },
            ),
            preferencesRowWidget(
              icon: Icon(
                Icons.privacy_tip_outlined,
                color: kDisabledColor,
                size: size.height * 0.035,
              ),
              title: 'Privacy Policy',
              containerColor: const Color.fromARGB(255, 255, 196, 168),
              context: context,
              size: size,
              viewModel: viewModel,
              onTapAction: () {
                viewModel.navigateToPrivacyPolicy();
              },
            ),
            preferencesRowWidget(
              icon: Icon(
                Icons.info_outline,
                color: kDisabledColor,
                size: size.height * 0.035,
              ),
              title: 'Terms & Conditions',
              containerColor: const Color.fromARGB(255, 168, 255, 227),
              context: context,
              size: size,
              viewModel: viewModel,
              onTapAction: () {
                viewModel.navigateToTermsAndConditions();
              },
            ),
            Padding(
              padding: const EdgeInsets.only(top: 35.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    height: size.height * 0.060,
                    width: size.height * 0.065,
                    alignment: Alignment.center,
                    margin: const EdgeInsets.only(right: 0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: const Color(0xff97EEFA).withOpacity(0.7),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(top: 0.0),
                      child: Icon(
                        Icons.logout_rounded,
                        color: kDisabledColor,
                        size: size.height * 0.030,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 24.0),
                    child: Text(
                      'Sign out',
                      textAlign: TextAlign.justify,
                      overflow: TextOverflow.ellipsis,
                      style: GoogleFonts.ubuntu(
                        fontSize: size.height * 0.027,
                        fontWeight: FontWeight.w700,
                        color: MyStyles.themeData().primaryColor,
                      ),
                    ),
                  ),
                  const Spacer(),
                  GestureDetector(
                    onTap: () {
                      showDialog(
                          context: context,
                          builder: (context) => LogoutDialogBox(
                                confirmationText: 'Logging out',
                                onCancelTap: () {
                                  viewModel.goBack();
                                },
                                onConfirmTap: () {
                                  viewModel.logout();
                                  viewModel.goBack();
                                },
                              ));
                    },
                    child: Container(
                      height: size.height * 0.060,
                      width: size.height * 0.065,
                      alignment: Alignment.center,
                      margin: const EdgeInsets.only(right: 0),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: MyStyles.themeMode().textColor,
                      ),
                      child: const Padding(
                          padding: EdgeInsets.only(top: 3.0),
                          child: Icon(Icons.arrow_forward)),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 35.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    height: size.height * 0.060,
                    width: size.height * 0.065,
                    alignment: Alignment.center,
                    margin: const EdgeInsets.only(right: 0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: const Color.fromARGB(255, 228, 23, 23)
                          .withOpacity(0.7),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(top: 0.0),
                      child: Icon(
                        Icons.delete,
                        color: Colors.white,
                        size: size.height * 0.030,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 24.0),
                    child: Text(
                      'Delete account',
                      textAlign: TextAlign.justify,
                      overflow: TextOverflow.ellipsis,
                      style: GoogleFonts.ubuntu(
                        fontSize: size.height * 0.027,
                        fontWeight: FontWeight.w700,
                        color: const Color.fromARGB(255, 228, 23, 23)
                            .withOpacity(0.7),
                      ),
                    ),
                  ),
                  const Spacer(),
                  GestureDetector(
                    onTap: () {
                      showDialog(
                          context: context,
                          builder: (context) => LogoutDialogBox(
                                confirmationText: 'Delete account',
                                onCancelTap: () {
                                  viewModel.goBack();
                                },
                                onConfirmTap: () {
                                  viewModel.deleteAccount();
                                  viewModel.goBack();
                                },
                              ));
                    },
                    child: Container(
                      height: size.height * 0.060,
                      width: size.height * 0.065,
                      alignment: Alignment.center,
                      margin: const EdgeInsets.only(right: 0),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: MyStyles.themeMode().textColor,
                      ),
                      child: const Padding(
                          padding: EdgeInsets.only(top: 3.0),
                          child: Icon(Icons.arrow_forward)),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: size.height * 0.060),
          ],
        ),
      ),
    );
  }

  Widget usersInfo({
    String? title,
    String? emailId,
    String? imageUrl,
    BuildContext? context,
    SettingViewModel? viewModel,
    Size? size,
    GestureTapCallback? onTapAction,
  }) {
    return Padding(
      padding: const EdgeInsets.only(top: 22.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          CircleAvatar(
            radius: size!.height * 0.045,
            backgroundColor: MyStyles.themeMode().textColor,
            child: CircleAvatar(
              radius: size.height * 0.040,
              backgroundColor: const Color.fromARGB(255, 255, 255, 255),
              backgroundImage: NetworkImage(imageUrl!),
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 13.0),
                child: Text(
                  title!,
                  textAlign: TextAlign.justify,
                  overflow: TextOverflow.ellipsis,
                  style: GoogleFonts.ubuntu(
                    fontSize: size.height * 0.024,
                    fontWeight: FontWeight.w500,
                    color: MyStyles.themeData().primaryColor,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 13.0),
                child: Text(
                  emailId!,
                  textAlign: TextAlign.justify,
                  overflow: TextOverflow.ellipsis,
                  style: GoogleFonts.ubuntu(
                    fontSize: size.height * 0.016,
                    fontWeight: FontWeight.w400,
                    color: MyStyles.themeMode().lightTextColor,
                  ),
                ),
              ),
            ],
          ),
          const Spacer(),
          GestureDetector(
            onTap: onTapAction,
            child: Container(
              height: size.height * 0.060,
              width: size.height * 0.065,
              alignment: Alignment.center,
              margin: const EdgeInsets.only(right: 0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: MyStyles.themeMode().textColor,
              ),
              child: Padding(
                padding: const EdgeInsets.only(top: 3.0),
                child:
                    Icon(Icons.edit, color: MyStyles.themeMode().mainTextColor),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget preferencesRowWidget({
    String? title,
    Widget? icon,
    Color? containerColor,
    BuildContext? context,
    SettingViewModel? viewModel,
    Size? size,
    GestureTapCallback? onTapAction,
  }) {
    return Padding(
      padding: const EdgeInsets.only(top: 35.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            height: size!.height * 0.060,
            width: size.height * 0.065,
            alignment: Alignment.center,
            margin: const EdgeInsets.only(right: 0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: containerColor,
            ),
            child: Padding(
              padding: const EdgeInsets.only(top: 0.0),
              child: icon!,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 24.0),
            child: Text(
              title!,
              textAlign: TextAlign.justify,
              overflow: TextOverflow.ellipsis,
              style: GoogleFonts.ubuntu(
                fontSize: size.height * 0.025,
                fontWeight: FontWeight.w500,
                color: MyStyles.themeMode().mainTextColor,
              ),
            ),
          ),
          const Spacer(),
          GestureDetector(
            onTap: onTapAction,
            child: Container(
              height: size.height * 0.060,
              width: size.height * 0.065,
              alignment: Alignment.center,
              margin: const EdgeInsets.only(right: 0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: MyStyles.themeMode().textColor,
              ),
              child: const Padding(
                  padding: EdgeInsets.only(top: 3.0),
                  child: Icon(Icons.arrow_forward)),
            ),
          ),
        ],
      ),
    );
  }

  @override
  SettingViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      SettingViewModel();
}
