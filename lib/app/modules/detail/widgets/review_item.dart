import 'package:digitallibrary/app/modules/home/data/data.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nb_utils/nb_utils.dart';

import '../../utils/utils.dart';

class ReviewItem extends StatelessWidget {
  final Review? review;
  const ReviewItem({super.key, required this.review});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
      child: Container(
        width: 300.0,
        decoration: BoxDecoration(
            color: colorwhite, borderRadius: BorderRadius.circular(10.0)),
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                review?.userName ?? '',
                style: GoogleFonts.mulish(color: colorblack, fontSize: 20.0),
              ),
              5.height,
              Text(
                review?.review ?? "",
                style: GoogleFonts.mulish(color: colordarkgrey, fontSize: 15.0),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
