import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nb_utils/nb_utils.dart';

import '../../utils/utils.dart';
import '../data/models/models.dart';

class TopBookItem extends StatelessWidget {
  final BookModel book;
  final VoidCallback onPress;
  const TopBookItem({super.key, required this.book, required this.onPress});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(5.0),
        child: SizedBox(
          // decoration: BoxDecoration(color: colorPrimary),
          width: MediaQuery.of(context).size.width * 0.4,
          // height: 200,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(5.0),
                child: Image.network(
                  // 'assets/images/cover3.jpeg',
                  URL.imageUrl(book.thumbnail!),
                  // width: double.infinity,
                  height: 200,
                  errorBuilder: (context, error, stackTrace) => const SizedBox(
                    height: 200,
                    child: Icon(Icons.error),
                  ),
                  fit: BoxFit.contain,
                ),
              ),
              10.height,
              Padding(
                padding: const EdgeInsets.only(left: 6.0, right: 6.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      book.title ?? '',
                      style: GoogleFonts.quicksand(
                          color: colorblack,
                          fontWeight: FontWeight.bold,
                          fontSize: 12.0),
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Icon(
                          Icons.star,
                          color: Color(0xffFFD233),
                          size: 20.0,
                        ),
                        Text(
                          '${book.rating ?? 0}/5',
                          style: GoogleFonts.quicksand(
                              color: colordarkgrey, fontSize: 13),
                        )
                      ],
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
