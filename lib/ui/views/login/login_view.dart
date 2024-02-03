import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:new_project/theme/styles.dart';
import 'package:new_project/widgets/input_decoration_widget.dart';
import 'package:new_project/widgets/textfield_tilewidget.dart';
import 'package:stacked/stacked.dart';

import 'login_viewmodel.dart';

class LoginView extends StackedView<LoginViewModel> {
  LoginView({Key? key}) : super(key: key);

  final _formKey = GlobalKey<FormState>();

  @override
  Widget builder(
    BuildContext context,
    LoginViewModel viewModel,
    Widget? child,
  ) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: SafeArea(
        child: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Stack(
                  children: [
                    SvgPicture.asset(
                      'assets/shapes/sideshape.svg',
                      height: size.height * 0.25,
                    ),
                    Container(
                        margin: const EdgeInsets.only(top: 20, bottom: 10),
                        // transform: Matrix4.translationValues(
                        //     0, animation1.value * size.width, 0),
                        alignment: Alignment.centerRight,
                        child: Image.asset(
                          'assets/images/login.png',
                          height: size.height * 0.27,
                        ))
                  ],
                ),
                Form(
                  key: _formKey,
                  child: ListView(
                    shrinkWrap: true,
                    padding: const EdgeInsets.symmetric(
                        horizontal: 25, vertical: 10),
                    children: [
                      SizedBox(
                        height: size.height * 0.050,
                      ),
                      textFormFieldTitle(
                        size: size,
                        title: 'Email Id',
                        withAsterick: true,
                      ),
                      SizedBox(
                        height: size.height * 0.010,
                      ),
                      emailTextFormField(
                        size: size,
                        context: context,
                        controller: viewModel.emailController,
                        viewModel: viewModel,
                      ),
                      SizedBox(
                        height: size.height * 0.040,
                      ),
                      textFormFieldTitle(
                        size: size,
                        title: 'Password',
                        withAsterick: true,
                      ),
                      SizedBox(
                        height: size.height * 0.010,
                      ),
                      passwordTextFormField(
                        size: size,
                        context: context,
                        controller: viewModel.passwordController,
                        viewModel: viewModel,
                      ),
                      SizedBox(
                        height: size.height * 0.010,
                      ),
                      GestureDetector(
                        onTap: () {
                          viewModel.navigateToSignupView();
                        },
                        child: Align(
                          alignment: Alignment.centerRight,
                          child: Text(
                            "Not registered? Sign Up",
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: GoogleFonts.ubuntu(
                              fontSize: size.height * 0.022,
                              fontWeight: FontWeight.w700,
                              color: Colors.lightBlueAccent,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: size.height * 0.040,
                      ),

                      registerButtons(
                        colors: MyStyles.themeMode().buttonGradient!,
                        title: 'Login',
                        model: viewModel,
                        onTapAction: () {
                          if (_formKey.currentState!.validate()) {
                            _formKey.currentState!.save();
                            viewModel.loginUserAndNavigate();
                          } else {
                            viewModel.validateField = false;
                          }
                        },
                        size: size,
                      ),
                      // SizedBox(
                      //   height: size.height * 0.1,
                      //   child:
                      // ),
                      SizedBox(
                        height: size.height * 0.030,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget registerTitleButtons({Size? size, LoginViewModel? viewmodel}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        GestureDetector(
          onTap: () {
            viewmodel!.navigateToSignupView();
          },
          child: Container(
            height: size!.height * 0.065,
            width: size.width * 0.34,
            padding: const EdgeInsets.all(10.0),
            margin: const EdgeInsets.only(top: 27.0, left: 25),
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  blurRadius: 15,
                  color: Colors.black.withOpacity(0.30),
                  offset: const Offset(4, 4),
                )
              ],
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(20),
                bottomRight: Radius.circular(20),
              ),
              color: MyStyles.themeMode().backgroundColor,
            ),
            child: Center(
              child: Text(
                'Signup',
                maxLines: 3,
                overflow: TextOverflow.ellipsis,
                style: GoogleFonts.ubuntu(
                  fontSize: size.height * 0.028,
                  fontWeight: FontWeight.w700,
                  color: MyStyles.themeMode().mainTextColor,
                ),
              ),
            ),
          ),
        ),
        GestureDetector(
          onTap: null,
          child: Container(
            height: size.height * 0.065,
            width: size.width * 0.34,
            padding: const EdgeInsets.all(10.0),
            margin: const EdgeInsets.only(top: 27.0, right: 25),
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  blurRadius: 15,
                  color: Colors.black.withOpacity(0.45),
                  offset: const Offset(4, 4),
                )
              ],
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(20),
                bottomRight: Radius.circular(20),
              ),
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: MyStyles.themeMode().buttonGradient!,
              ),
            ),
            child: Center(
              child: Text(
                'Login',
                maxLines: 3,
                overflow: TextOverflow.ellipsis,
                style: GoogleFonts.ubuntu(
                  fontSize: size.height * 0.028,
                  fontWeight: FontWeight.w700,
                  color: MyStyles.themeMode().textColor,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget registerButtons({
    Size? size,
    LoginViewModel? model,
    String? title,
    GestureDoubleTapCallback? onTapAction,
    List<Color>? colors,
  }) {
    return GestureDetector(
      onTap: onTapAction,
      child: Container(
        height: size!.height * 0.080,
        width: size.width,
        padding: const EdgeInsets.all(15.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: colors!,
          ),
        ),
        child: Center(
          child: Text(
            title!,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: GoogleFonts.ubuntu(
                fontSize: size.height * 0.028,
                fontWeight: FontWeight.w700,
                color: Colors.white),
          ),
        ),
      ),
    );
  }

  Widget emailTextFormField({
    BuildContext? context,
    TextEditingController? controller,
    Size? size,
    LoginViewModel? viewModel,
  }) {
    return TextFormField(
      autovalidateMode: AutovalidateMode.onUserInteraction,
      textInputAction: TextInputAction.next,
      textCapitalization: TextCapitalization.none,
      cursorHeight: size!.height * 0.027,
      keyboardType: TextInputType.emailAddress,
      validator: (value) {
        var emailValid = RegExp(
                r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
            .hasMatch(value!);
        if (value.isEmpty) {
          viewModel!.validateField = false;
          return 'Please enter your Email id';
        } else if (!emailValid) {
          viewModel!.validateField = false;
          return 'Invalid Email id';
        }
        return null;
      },
      onChanged: (value) {
        if (value.isNotEmpty) {
          viewModel!.validateField = true;
        }
        if (!RegExp(
                r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
            .hasMatch(value)) {
          viewModel!.validateField = true;
        }
      },
      controller: controller,
      cursorColor: MyStyles.themeData().primaryColor,
      decoration: inputDecoration(
          context: context, hintText: 'Please Enter your Email'),
    );
  }

  Widget passwordTextFormField({
    BuildContext? context,
    TextEditingController? controller,
    Size? size,
    LoginViewModel? viewModel,
  }) {
    return TextFormField(
      autovalidateMode: AutovalidateMode.onUserInteraction,
      textInputAction: TextInputAction.done,
      textCapitalization: TextCapitalization.none,
      cursorHeight: size!.height * 0.027,
      keyboardType: TextInputType.text,
      inputFormatters: [
        // FilteringTextInputFormatter.allow(RegExp( r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$')),
        LengthLimitingTextInputFormatter(50),
      ],
      validator: (value) {
        if (value!.isEmpty) {
          viewModel.validateField = false;
          return 'Please enter your Password';
        }
        if (value.length < 8) {
          viewModel.validateField = false;
          return 'Please enter minimum 8 characters Password';
        }
        return null;
      },
      onChanged: (value) {
        if (value.isNotEmpty) {
          viewModel.validateField = true;
        }
      },
      controller: controller,
      obscureText: !viewModel!.isPasswordVisible,
      obscuringCharacter: '•',
      cursorColor: MyStyles.themeData().primaryColor,
      decoration: inputDecoration(
          suffix: IconButton(
              onPressed: () {
                viewModel.changeBool();
              },
              icon: Icon(viewModel.isPasswordVisible
                  ? Icons.visibility
                  : Icons.visibility_off)),
          context: context,
          hintText: 'Please Enter your Password'),
    );
  }

  @override
  LoginViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      LoginViewModel();
}
