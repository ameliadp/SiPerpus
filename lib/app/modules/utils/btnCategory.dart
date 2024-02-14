import 'package:digitallibrary/app/modules/utils/color.dart';
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';

class BtnCategory {
  ButtonStyle btnCategoryStyle(bool changeColor) {
    return ButtonStyle(
      // padding: MaterialStateProperty.all<EdgeInsets>(const EdgeInsets.all(10)),
      foregroundColor: changeColor
          ? MaterialStateProperty.all<Color>(colorwhite)
          : MaterialStateProperty.all<Color>(colorPrimary),
      backgroundColor: changeColor
          ? MaterialStateProperty.all<Color>(colorPrimary)
          : MaterialStateProperty.all<Color>(colorwhite),
      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
        RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
          side: changeColor
              ? const BorderSide(color: transparentColor)
              : const BorderSide(color: colordarkgrey),
        ),
      ),
    );
  }
}
