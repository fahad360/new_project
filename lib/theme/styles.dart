import 'package:flutter/material.dart';
import 'package:new_project/theme/colors.dart';

class MyStyles {
  MyStyles();

  static const kSpacingUnit = 10;
  static const double padding = 20;
  static const double avatarRadius = 80;

  static const _colorScheme = ColorScheme.light(
    primary: kMainColor,
    secondary: kSecondaryColor,
    onPrimary: kTextColor,
    onSecondary: kSecondaryColor,
    secondaryContainer: kRegBackgroundColor,
    onBackground: kWhiteColor,
  );

  static ThemeData themeData() {
    return ThemeData(
        visualDensity: VisualDensity.adaptivePlatformDensity,
        canvasColor: Colors.transparent,
        primaryColor: _colorScheme.primary,
        secondaryHeaderColor: _colorScheme.secondary,
        brightness: Brightness.dark,
        scaffoldBackgroundColor: _colorScheme.onBackground);
  }

  static ThemeColor themeMode() {
    return ThemeColor(
      gradient: [
        themeData().primaryColor,
        themeData().secondaryHeaderColor,
      ],
      gradientTwo: [
        buttonColorTwo,
        buttonColor,
      ],
      buttonGradient: [
        buttonColor,
        buttonColorTwo,
      ],
      textColor: kTextColor,
      mainTextColor: kMainTextColor,
      bottomNav: _colorScheme.secondaryContainer,
      backgroundColor: kRegBackgroundColor,
      cardColor: cardColor,
      lightTextColor: kLightTextColor,
      dialogColor: kDialogColor,
      itemTileColor: itemContainerColor,
      rewardColor: rewardColor,
      punishColor: punishmentColor,
    );
  }
}

class ThemeColor {
  ThemeColor({
    this.gradient,
    this.gradientTwo,
    this.buttonGradient,
    this.backgroundColor,
    this.textColor,
    this.dialogColor,
    this.mainTextColor,
    this.lightTextColor,
    this.bottomNav,
    this.cardColor,
    this.itemTileColor,
    this.rewardColor,
    this.punishColor,
  });

  List<Color>? gradient;
  List<Color>? gradientTwo;
  List<Color>? buttonGradient;
  Color? backgroundColor;
  Color? bottomNav;
  Color? dialogColor;
  Color? textColor;
  Color? mainTextColor;
  Color? lightTextColor;
  Color? cardColor;
  Color? itemTileColor;
  Color? rewardColor;
  Color? punishColor;
}
