import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nb_utils/nb_utils.dart';

import '../../utils/utils.dart';
import '../data/models/models.dart';

class BookItem extends StatelessWidget {
  // final LibraryController controller = Get.put(LibraryController());
  // List<BookModel> books = [];
  final BookModel book;
  final VoidCallback onPress;
  final VoidCallback? onBookmarkPress;
  const BookItem({
    super.key,
    required this.book,
    required this.onPress,
    this.onBookmarkPress,
  });

  @override
  Widget build(BuildContext context) {
    // final word = book.toString();
    // final provider = Provider.of<SavedProvider>(context, listen: false);
    return GestureDetector(
      onTap: onPress,
      child: Stack(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(5.0),
            child: SizedBox(
              // decoration: BoxDecoration(color: colorPrimary),
              width: MediaQuery.of(context).size.width * 0.4,
              // height: 244,
              child: Column(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(5.0),
                    child: Image.network(
                      // 'assets/images/cover3.jpeg',
                      URL.imageUrl(book.thumbnail!),
                      // width: double.infinity,
                      height: 200,
                      errorBuilder: (context, error, stackTrace) =>
                          const SizedBox(
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
          Positioned(
            right: 24,
            top: 10,
            child: GestureDetector(
              onTap: onBookmarkPress,
              child: CircleAvatar(
                backgroundColor: colorwhite,
                radius: 14.0,
                child: Icon(
                  book.isSave ? Icons.bookmark : Icons.bookmark_border,
                  size: 18.0,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
