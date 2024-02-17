import '../data/models/borrowed_book.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../utils/utils.dart';

class BorrowedBookItem extends StatelessWidget {
  final VoidCallback onReturnPress;
  final BorrowedBook? borrowedBook;

  const BorrowedBookItem(
      {super.key, required this.onReturnPress, required this.borrowedBook});

  @override
  Widget build(BuildContext context) {
    final isBorrowed = borrowedBook?.status == null
        ? true
        : borrowedBook!.status!.contains("borrowed");
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 2.0),
      child: Container(
        margin: const EdgeInsets.all(5.0),
        height: 75.0,
        width: double.infinity,
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(
            Radius.circular(10.0),
          ),
          color: colorThird,
        ),
        child: ListTile(
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 8.0, vertical: 5.0),
          leading: ClipRRect(
            borderRadius: BorderRadius.circular(5.0),
            child: Image.network(
              URL.imageUrl(borrowedBook?.thumbnail ?? ""),
              // width: 70,
              height: 90,
              fit: BoxFit.contain,
            ),
          ),
          title: Text(
            '${borrowedBook?.title}',
            style: GoogleFonts.quicksand(
              fontWeight: FontWeight.bold,
              color: colorFourd,
              fontSize: 16.0,
            ),
            overflow: TextOverflow.ellipsis,
            maxLines: 1,
          ),
          subtitle: RichText(
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            text: TextSpan(
              style: GoogleFonts.quicksand(
                color: colorblack,
                fontSize: 10.0,
              ),
              children: [
                TextSpan(
                  text: 'Due Date :${borrowedBook?.dueDate}\n',
                  style: GoogleFonts.quicksand(color: colorblack),
                ),
                const WidgetSpan(
                  child: SizedBox(height: 15.0),
                ),
                TextSpan(
                  text: 'Status : ',
                  style: GoogleFonts.quicksand(color: colorblack),
                ),
                TextSpan(
                  text: borrowedBook?.status,
                  style: GoogleFonts.quicksand(
                    color: Colors.blue,
                  ),
                ),
              ],
            ),
          ),
          trailing: SizedBox(
            height: 28.0,
            child: !isBorrowed
                ? null
                : ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: colorPrimary,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      fixedSize: const Size(90.0, 10.0),
                    ),
                    onPressed: onReturnPress,
                    child: Text(
                      'Return',
                      style: GoogleFonts.quicksand(
                          color: colorwhite, fontSize: 13.0),
                    ),
                  ),
          ),
        ),
      ),
    );
  }
}
