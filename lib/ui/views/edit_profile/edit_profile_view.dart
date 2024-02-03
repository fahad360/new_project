import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:new_project/theme/styles.dart';
import 'package:new_project/ui/custom_shapes/curve_shape.dart';
import 'package:new_project/widgets/input_decoration_widget.dart';
import 'package:new_project/widgets/textfield_tilewidget.dart';
import 'package:stacked/stacked.dart';

import 'edit_profile_viewmodel.dart';

class EditProfileView extends StackedView<EditProfileViewModel> {
  EditProfileView({Key? key}) : super(key: key);

  final _formKey = GlobalKey<FormState>();

  @override
  Widget builder(
    BuildContext context,
    EditProfileViewModel viewModel,
    Widget? child,
  ) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: SafeArea(
        top: true,
        child: Stack(
          children: [
            Positioned.fill(
              child: Padding(
                padding: const EdgeInsets.only(top: 0),
                child: Align(
                  alignment: Alignment.topCenter,
                  child: CustomPaint(
                    size: Size(size.width,
                        (size.width * 0.6238317757009346).toDouble()),
                    painter: CurveShapePainter(),
                  ),
                ),
              ),
            ),
            Positioned(
              top: size.height * 0.008,
              left: 0,
              child: IconButton(
                onPressed: () {
                  viewModel.goBack();
                },
                icon: Icon(
                  Icons.arrow_back_ios_new_rounded,
                  color: MyStyles.themeMode().textColor,
                  size: size.height * 0.030,
                ),
              ),
            ),
            Positioned(
              top: size.height * 0.020,
              left: 0,
              right: 0,
              child: Container(
                alignment: Alignment.center,
                child: Text(
                  'Update Your Profile',
                  textAlign: TextAlign.justify,
                  overflow: TextOverflow.ellipsis,
                  style: GoogleFonts.ubuntu(
                      fontSize: size.height * 0.026,
                      fontWeight: FontWeight.w500,
                      color: MyStyles.themeMode().textColor),
                ),
              ),
            ),
            Positioned.fill(
              top: size.height * 0.130,
              child: Align(
                alignment: Alignment.topCenter,
                child: Stack(
                  children: [
                    viewModel.selectedImage == null
                        ? CircleAvatar(
                            radius: size.height * 0.075,
                            backgroundColor: MyStyles.themeData()
                                .primaryColor
                                .withOpacity(0.6),
                            child: CircleAvatar(
                              radius: size.height * 0.070,
                              backgroundImage: const AssetImage(
                                  'assets/images/profile_placeholder.jpg'),
                            ),
                          )
                        : CircleAvatar(
                            radius: size.height * 0.075,
                            backgroundColor: MyStyles.themeData()
                                .primaryColor
                                .withOpacity(0.6),
                            child: CircleAvatar(
                              radius: size.height * 0.070,
                              backgroundColor:
                                  const Color.fromARGB(255, 255, 255, 255),
                              backgroundImage:
                                  FileImage(viewModel.selectedImage!),
                            ),
                          ),
                    Positioned.fill(
                      child: Align(
                        alignment: Alignment.bottomRight,
                        child: Container(
                          padding: const EdgeInsets.all(5),
                          height: size.height * 0.050,
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: MyStyles.themeMode().backgroundColor),
                          child: GestureDetector(
                            onTap: () {
                              viewModel.showPicker(context: context);
                            },
                            child: Icon(
                              Icons.camera_alt,
                              color: MyStyles.themeData().primaryColor,
                            ),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
            Positioned.fill(
              top: size.height * 0.270,
              child: Align(
                alignment: Alignment.topCenter,
                child: Form(
                  key: _formKey,
                  child: ListView(
                    padding: const EdgeInsets.symmetric(horizontal: 35),
                    children: [
                      SizedBox(
                        height: size.height * 0.050,
                      ),
                      textFormFieldTitle(
                        size: size,
                        title: 'First Name',
                        withAsterick: true,
                      ),
                      SizedBox(
                        height: size.height * 0.010,
                      ),
                      firstNameTextFormField(
                        size: size,
                        context: context,
                        controller: viewModel.firstNameController,
                        viewModel: viewModel,
                      ),
                      SizedBox(
                        height: size.height * 0.040,
                      ),
                      textFormFieldTitle(
                        size: size,
                        title: 'Last Name',
                        withAsterick: true,
                      ),
                      SizedBox(
                        height: size.height * 0.010,
                      ),
                      lastNameTextFormField(
                        size: size,
                        context: context,
                        controller: viewModel.lastNameController,
                        viewModel: viewModel,
                      ),
                      SizedBox(
                        height: size.height * 0.050,
                      ),
                      GestureDetector(
                        onTap: () {
                          if (_formKey.currentState!.validate()) {
                            _formKey.currentState!.save();

                            viewModel.saveUserProfileAndNavigate();
                          } else {
                            viewModel.validateField = false;
                          }
                        },
                        child: Container(
                          height: size.height * 0.080,
                          width: size.width,
                          // margin:
                          //     const EdgeInsets.only(left: 20, right: 20),
                          padding: const EdgeInsets.all(15.0),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            gradient: LinearGradient(
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                              colors: MyStyles.themeMode().buttonGradient!,
                            ),
                          ),
                          child: Center(
                            child: Text(
                              'Update Profile',
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: GoogleFonts.ubuntu(
                                fontSize: size.height * 0.028,
                                fontWeight: FontWeight.w700,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget firstNameTextFormField({
    BuildContext? context,
    TextEditingController? controller,
    Size? size,
    EditProfileViewModel? viewModel,
  }) {
    return TextFormField(
      autovalidateMode: AutovalidateMode.onUserInteraction,
      textInputAction: TextInputAction.next,
      textCapitalization: TextCapitalization.words,
      cursorHeight: size!.height * 0.027,
      keyboardType: TextInputType.text,
      style: GoogleFonts.ubuntu(
        fontSize: size.height * 0.024,
        color: MyStyles.themeMode().mainTextColor,
      ),
      inputFormatters: [
        FilteringTextInputFormatter.allow(RegExp(r'[a-zA-Z]+|\s')),
        LengthLimitingTextInputFormatter(50),
      ],
      validator: (value) {
        if (value!.isEmpty) {
          viewModel!.validateField = false;
          return 'Please enter your First Name';
        }
        if (value.length < 2) {
          viewModel!.validateField = false;
          return 'Please enter valid First Name';
        }
        return null;
      },
      onChanged: (value) {
        if (value.isNotEmpty) {
          viewModel!.validateField = true;
        }
      },
      controller: controller,
      cursorColor: MyStyles.themeData().primaryColor,
      decoration: inputDecoration(
          context: context, hintText: 'Update your first name'),
    );
  }

  Widget lastNameTextFormField({
    BuildContext? context,
    TextEditingController? controller,
    Size? size,
    EditProfileViewModel? viewModel,
  }) {
    return TextFormField(
      autovalidateMode: AutovalidateMode.onUserInteraction,
      textInputAction: TextInputAction.done,
      textCapitalization: TextCapitalization.words,
      cursorHeight: size!.height * 0.027,
      keyboardType: TextInputType.text,
      style: GoogleFonts.ubuntu(
        fontSize: size.height * 0.024,
        color: MyStyles.themeMode().mainTextColor,
      ),
      inputFormatters: [
        FilteringTextInputFormatter.allow(RegExp(r'[a-zA-Z]+|\s')),
        LengthLimitingTextInputFormatter(50),
      ],
      validator: (value) {
        // if (value!.isEmpty) {
        //   viewModel!.validateField = false;
        //   return 'Please enter your Last Name';
        // }
        if (value!.length < 2) {
          viewModel!.validateField = false;
          return 'Please enter valid Last Name';
        }
        return null;
      },
      // onChanged: (value) {
      //   if (value.isNotEmpty) {
      //     viewModel!.validateField = true;
      //   }
      // },
      controller: controller,
      cursorColor: MyStyles.themeData().primaryColor,
      decoration: inputDecoration(
          context: context, hintText: 'Update your last name'),
    );
  }

  @override
  EditProfileViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      EditProfileViewModel();
}
