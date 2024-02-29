import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nb_utils/nb_utils.dart';
import '../controllers/profile_controller.dart';
import '../../utils/color.dart';
import '../data/data.dart';

class ProfileView extends GetView<ProfileController> {
  GlobalKey<FormState> formKey = GlobalKey();
  ProfileView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          toolbarHeight: 50.0,
          title: Padding(
            padding: const EdgeInsets.only(bottom: 8.0),
            child: Text(
              'Profile',
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
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 20.0, left: 20.0),
              child: Text(
                'Borrower Data',
                style: GoogleFonts.quicksand(
                    color: colorFourd,
                    fontWeight: FontWeight.bold,
                    fontSize: 30.0),
              ),
            ),
            GetBuilder<ProfileController>(
              builder: (controller) => Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(
                        top: 5.0, left: 20.0, right: 20.0),
                    child: Center(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Padding(
                            padding:
                                const EdgeInsets.only(top: 15.0, left: 5.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Email',
                                  style: GoogleFonts.quicksand(
                                      color: colorgrey, fontSize: 15.0),
                                ),
                                2.height,
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Flexible(
                                      child: Text(
                                        '${controller.user?.email}',
                                        style: GoogleFonts.quicksand(
                                          color: colorblack,
                                          fontSize: 16.0,
                                        ),
                                      ),
                                    ),
                                    10.width,
                                    IconButton(
                                      onPressed: () {
                                        showDialog(
                                            context: context,
                                            builder: (context) {
                                              return AlertDialog(
                                                shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          20.0),
                                                ),
                                                title: Center(
                                                  child: Text(
                                                    'Edit Form',
                                                    style:
                                                        GoogleFonts.quicksand(
                                                            color: colorPrimary,
                                                            fontWeight:
                                                                FontWeight
                                                                    .bold),
                                                  ),
                                                ),
                                                content: Form(
                                                  key: formKey,
                                                  autovalidateMode:
                                                      AutovalidateMode.always,
                                                  child: SizedBox(
                                                    width: 1100,
                                                    child: Column(
                                                      mainAxisSize:
                                                          MainAxisSize.min,
                                                      children: <Widget>[
                                                        _buildTextField('Email',
                                                            controller),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                                actions: <Widget>[
                                                  Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    children: [
                                                      Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                .only(
                                                                bottom: 10),
                                                        child: ElevatedButton(
                                                          style: ElevatedButton
                                                              .styleFrom(
                                                            elevation: 5,
                                                            shadowColor:
                                                                colorPrimary,
                                                            backgroundColor:
                                                                colorPrimary,
                                                            shape:
                                                                RoundedRectangleBorder(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          20.0),
                                                            ),
                                                            minimumSize:
                                                                const Size(
                                                                    140, 30),
                                                          ),
                                                          onPressed: () {},
                                                          child: Text(
                                                            'Submit',
                                                            style: GoogleFonts
                                                                .quicksand(
                                                                    color: Colors
                                                                        .white),
                                                          ),
                                                        ),
                                                      ),
                                                      Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                .only(
                                                                bottom: 10),
                                                        child: ElevatedButton(
                                                          style: ElevatedButton
                                                              .styleFrom(
                                                            elevation: 3,
                                                            shadowColor:
                                                                colorPrimary,
                                                            backgroundColor:
                                                                Colors.white,
                                                            shape:
                                                                RoundedRectangleBorder(
                                                              side: const BorderSide(
                                                                  color:
                                                                      colorPrimary),
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          20.0),
                                                            ),
                                                            minimumSize:
                                                                const Size(
                                                                    80, 30),
                                                          ),
                                                          onPressed: () {
                                                            Navigator.of(
                                                                    context)
                                                                .pop();
                                                          },
                                                          child: Text(
                                                            'Cancel',
                                                            style: GoogleFonts
                                                                .quicksand(
                                                                    color:
                                                                        colorPrimary),
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ],
                                              );
                                            });
                                      },
                                      icon: const Icon(
                                        Icons.edit_outlined,
                                        color: colorPrimary,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          4.height,
                          const Divider(
                            color: colorPrimary,
                            height: 1,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                                top: 20.0, left: 5.0, right: 5.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Username',
                                  style: GoogleFonts.quicksand(
                                      color: colorgrey, fontSize: 15.0),
                                ),
                                2.height,
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Text(
                                      '${controller.user?.userName}',
                                      style: GoogleFonts.quicksand(
                                        color: colorblack,
                                        fontSize: 16.0,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          4.height,
                          const Divider(
                            color: colorPrimary,
                            height: 1,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                                top: 20.0, left: 5.0, right: 5.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Alamat',
                                  style: GoogleFonts.quicksand(
                                      color: colorgrey, fontSize: 15.0),
                                ),
                                2.height,
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Text(
                                      '${controller.user?.address}',
                                      style: GoogleFonts.quicksand(
                                        color: colorblack,
                                        fontSize: 16.0,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          4.height,
                          const Divider(
                            color: colorPrimary,
                            height: 1,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ));
  }
}

Widget _buildTextField(String label, ProfileController controller) {
  return Padding(
    padding: const EdgeInsets.only(left: 2, right: 2, top: 9),
    child: SizedBox(
      height: 65,
      width: 350,
      child: TextFormField(
        controller: controller.EmailC,
        autocorrect: false,
        keyboardType: TextInputType.multiline,
        textInputAction: TextInputAction.newline,
        maxLines: null,
        decoration: InputDecoration(
          isCollapsed: true,
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 15, vertical: 17),
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
        validator: (value) {
          if (value!.isEmpty) {
            return 'Form ini wajib diisi !';
          }
          return null;
        },
      ),
    ),
  );
}
