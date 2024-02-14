import '../../home/data/data.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../utils/utils.dart';

class CategoryItem extends StatelessWidget {
  final CategoryModel category;
  final VoidCallback onPress;
  final bool isActive;
  const CategoryItem({
    super.key,
    required this.category,
    required this.onPress,
    this.isActive = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 5.0),
      child: TextButton(
        onPressed: onPress,
        style: BtnCategory().btnCategoryStyle(isActive),
        child: Text(
          '${category.categoryName}',
          style: GoogleFonts.quicksand(
            fontWeight: FontWeight.bold,
          ),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
