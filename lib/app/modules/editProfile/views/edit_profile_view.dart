import 'package:digitallibrary/app/modules/utils/color.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nb_utils/nb_utils.dart';

import '../controllers/edit_profile_controller.dart';

class EditProfileView extends GetView<EditProfileController> {
  const EditProfileView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          toolbarHeight: 50.0,
          title: Padding(
            padding: const EdgeInsets.only(bottom: 8.0),
            child: Text(
              'Edit Profile',
              style: GoogleFonts.quicksand(
                  color: colorPrimary,
                  fontSize: 25.0,
                  fontWeight: FontWeight.w700),
            ),
          ),
          leading: Padding(
            padding: const EdgeInsets.only(left: 12.0, bottom: 8.0),
            child: IconButton(
              onPressed: () {
                Get.back();
              },
              icon: const Icon(
                Icons.arrow_back_ios_new_rounded,
                color: colorPrimary,
                size: 20.0,
              ),
            ),
          ),
          elevation: 3,
          shadowColor: colorgrey,
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                margin: const EdgeInsets.only(left: 20, right: 20),
                width: double.infinity,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(15)),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey,
                      blurRadius: 2,
                      spreadRadius: 1,
                      offset: Offset(0, 3),
                    ),
                  ],
                ),
                child: Container(
                  margin: const EdgeInsets.all(20),
                  child: Column(
                    children: [
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          'Profile Information',
                          style: GoogleFonts.quicksand(
                            fontSize: 15,
                          ),
                        ),
                      ),
                      15.height,
                      TextFormField(
                        controller: controller.EmailC,
                        validator: ((value) => value == null || value == ''
                            ? 'This field is required'
                            : null),
                        autocorrect: false,
                        maxLines: null,
                        keyboardType: TextInputType.multiline,
                        textInputAction: TextInputAction.newline,
                        decoration: InputDecoration(
                          isCollapsed: true,
                          contentPadding: const EdgeInsets.symmetric(
                              horizontal: 15, vertical: 17),
                          labelText: 'Email',
                          labelStyle: GoogleFonts.quicksand(
                            fontSize: 15,
                            color: controller.labelColor.value,
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: const BorderSide(color: colorPrimary),
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        onTap: () {
                          controller.labelColor.value =
                              const MaterialColor(0xfff557153, <int, Color>{
                            50: colorPrimary,
                          });
                        },
                      ),
                      20.height,
                      TextFormField(
                        controller: controller.UsernameC,
                        validator: ((value) => value == null || value == ''
                            ? 'This field is required'
                            : null),
                        autocorrect: false,
                        maxLines: null,
                        keyboardType: TextInputType.multiline,
                        textInputAction: TextInputAction.newline,
                        decoration: InputDecoration(
                          isCollapsed: true,
                          contentPadding: const EdgeInsets.symmetric(
                              horizontal: 15, vertical: 17),
                          labelText: 'Username',
                          labelStyle: GoogleFonts.quicksand(
                            fontSize: 15,
                            color: controller.labelColor.value,
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: const BorderSide(color: colorPrimary),
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        onTap: () {
                          controller.labelColor.value =
                              const MaterialColor(0xfff557153, <int, Color>{
                            50: colorPrimary,
                          });
                        },
                      ),
                      20.height,
                      TextFormField(
                        controller: controller.AlamatC,
                        autocorrect: false,
                        maxLines: null,
                        keyboardType: TextInputType.multiline,
                        textInputAction: TextInputAction.newline,
                        decoration: InputDecoration(
                          isCollapsed: true,
                          contentPadding: const EdgeInsets.symmetric(
                              horizontal: 15, vertical: 17),
                          labelText: 'Alamat',
                          labelStyle: GoogleFonts.quicksand(
                            fontSize: 15,
                            color: controller.labelColor.value,
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: const BorderSide(color: colorPrimary),
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        onTap: () {
                          controller.labelColor.value =
                              const MaterialColor(0xfff557153, <int, Color>{
                            50: colorPrimary,
                          });
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}
