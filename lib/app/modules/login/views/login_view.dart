import '../../utils/color.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nb_utils/nb_utils.dart';

import '../controllers/login_controller.dart';
import '../data/data.dart';

class LoginView extends GetView<LoginController> {
  // @override
  // final LoginController controller = Get.put(LoginController(
  //     authRepository: Get.put<AuthRepository>(AuthRepository())));

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(left: 20.0, right: 20.0),
        child: SingleChildScrollView(
          child: Obx(
            () => Form(
              key: formKey,
              autovalidateMode: AutovalidateMode.always,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Center(
                    child: Padding(
                      padding: EdgeInsets.only(
                          top: controller.isRegis ? 70.0 : 115.0),
                      child: Image.asset(
                        'assets/images/logoH.png',
                        width: 250.0,
                        height: 150.0,
                      ),
                    ),
                  ),
                  20.height,
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      controller.isRegis
                          ? Text(
                              'Login To Your Account',
                              style: GoogleFonts.quicksand(
                                  color: colorFourd,
                                  fontSize: 20.0,
                                  fontWeight: FontWeight.bold),
                            )
                          : Text(
                              'Create New Account',
                              style: GoogleFonts.quicksand(
                                  color: colorFourd,
                                  fontSize: 20.0,
                                  fontWeight: FontWeight.bold),
                            ),
                      controller.isRegis ? 10.height : 2.height,
                      if (controller.isRegis)
                        TextFormField(
                          showCursor: true,
                          cursorColor: colorPrimary,
                          autocorrect: false,
                          keyboardType: TextInputType.name,
                          controller: controller.usernameC,
                          validator: ((value) => value == null || value == ''
                              ? 'This field is required'
                              : null),
                          decoration: InputDecoration(
                            isCollapsed: true,
                            contentPadding: const EdgeInsets.symmetric(
                                horizontal: 15, vertical: 17),
                            labelText: 'Username',
                            labelStyle: GoogleFonts.quicksand(
                              fontSize: 15,
                              color: colorgrey,
                            ),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide:
                                    const BorderSide(color: colorPrimary)),
                            focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide:
                                    const BorderSide(color: colorPrimary)),
                          ),
                        ),
                      10.height,
                      TextFormField(
                        showCursor: true,
                        cursorColor: colorPrimary,
                        autocorrect: false,
                        keyboardType: TextInputType.emailAddress,
                        controller: controller.emailC,
                        validator: ((value) => value == null || value == ''
                            ? 'This field is required'
                            : null),
                        decoration: InputDecoration(
                          isCollapsed: true,
                          contentPadding: const EdgeInsets.symmetric(
                              horizontal: 15, vertical: 17),
                          labelText: 'Email',
                          labelStyle: GoogleFonts.quicksand(
                            fontSize: 15,
                            color: colorgrey,
                          ),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide:
                                  const BorderSide(color: colorPrimary)),
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide:
                                  const BorderSide(color: colorPrimary)),
                        ),
                      ),
                      10.height,
                      TextFormField(
                        showCursor: true,
                        cursorColor: colorPrimary,
                        autocorrect: false,
                        keyboardType: TextInputType.visiblePassword,
                        obscureText: controller.isPasswordHidden.value,
                        controller: controller.passC,
                        decoration: InputDecoration(
                          isCollapsed: true,
                          contentPadding: const EdgeInsets.symmetric(
                              horizontal: 15, vertical: 17),
                          labelText: 'Passsword',
                          labelStyle: GoogleFonts.quicksand(
                            fontSize: 15,
                            color: colorgrey,
                          ),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide:
                                  const BorderSide(color: colorPrimary)),
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide:
                                  const BorderSide(color: colorPrimary)),
                          suffixIcon: IconButton(
                            onPressed: () {
                              controller.togglePasswordVisibility();
                            },
                            icon: controller.isPasswordHidden.value
                                ? const Icon(Icons.visibility_off)
                                : const Icon(Icons.visibility),
                          ),
                        ),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Please fill in your password';
                          }
                          return null;
                        },
                      ),
                      10.height,
                      if (controller.isRegis)
                        TextFormField(
                          showCursor: true,
                          cursorColor: colorPrimary,
                          autocorrect: false,
                          keyboardType: TextInputType.name,
                          controller: controller.nameC,
                          validator: ((value) => value == null || value == ''
                              ? 'This field is required'
                              : null),
                          decoration: InputDecoration(
                            isCollapsed: true,
                            contentPadding: const EdgeInsets.symmetric(
                                horizontal: 15, vertical: 17),
                            labelText: 'Nama Lengkap',
                            labelStyle: GoogleFonts.quicksand(
                              fontSize: 15,
                              color: colorgrey,
                            ),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide:
                                    const BorderSide(color: colorPrimary)),
                            focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide:
                                    const BorderSide(color: colorPrimary)),
                          ),
                        ),
                      10.height,
                      if (controller.isRegis)
                        TextFormField(
                          showCursor: true,
                          cursorColor: colorPrimary,
                          autocorrect: false,
                          keyboardType: TextInputType.streetAddress,
                          controller: controller.alamatC,
                          validator: ((value) => value == null || value == ''
                              ? 'This field is required'
                              : null),
                          decoration: InputDecoration(
                            isCollapsed: true,
                            contentPadding: const EdgeInsets.symmetric(
                                horizontal: 15, vertical: 17),
                            labelText: 'Alamat',
                            labelStyle: GoogleFonts.quicksand(
                              fontSize: 15,
                              color: colorgrey,
                            ),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide:
                                    const BorderSide(color: colorPrimary)),
                            focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide:
                                    const BorderSide(color: colorPrimary)),
                          ),
                        ),
                      controller.isRegis ? 40.height : 20.height,
                      ElevatedButton(
                        onPressed: controller.isRegis
                            ? controller.register
                            : controller.login,
                        style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.0)),
                          backgroundColor: colorPrimary,
                          minimumSize: const Size(double.infinity, 45),
                        ),
                        child: Text(
                          controller.isRegis ? 'Sign Up' : 'Sign In',
                          style: GoogleFonts.quicksand(
                              color: Colors.white, fontSize: 15),
                        ),
                      ),
                      20.height,
                      Center(
                        child: InkWell(
                          onTap: () {
                            controller.isRegis = !controller.isRegis;
                          },
                          child: Padding(
                            padding: const EdgeInsets.only(top: 15),
                            child: RichText(
                              text: TextSpan(
                                text: controller.isRegis
                                    ? 'You have Account? '
                                    : 'You don’t have Account? ',
                                style: GoogleFonts.quicksand(
                                  fontSize: 12.0,
                                  color: colorgrey,
                                  fontStyle: FontStyle.italic,
                                ),
                                children: [
                                  TextSpan(
                                    text: controller.isRegis
                                        ? 'Sign In here!'
                                        : 'Sign Up here!',
                                    style: GoogleFonts.quicksand(
                                      fontSize: 12.0,
                                      color: Colors.blue,
                                      fontStyle: FontStyle.italic,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                      20.height,
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
