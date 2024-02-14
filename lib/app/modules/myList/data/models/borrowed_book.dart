// To parse this JSON data, do
//
//     final borrowedBook = borrowedBookFromJson(jsonString);

import 'dart:convert';

BorrowedBook borrowedBookFromJson(String str) =>
    BorrowedBook.fromJson(json.decode(str));

String borrowedBookToJson(BorrowedBook data) => json.encode(data.toJson());

class BorrowedBook {
  final String? borrowId;
  final String? userId;
  final String? bookId;
  final DateTime? loanDate;
  final DateTime? dueDate;
  final String? status;
  final DateTime? updatedAt;
  final String? categoryId;
  final String? title;
  final String? writer;
  final String? publisher;
  final String? yearPublication;
  final String? synopsis;
  final String? thumbnail;

  BorrowedBook({
    this.borrowId,
    this.userId,
    this.bookId,
    this.loanDate,
    this.dueDate,
    this.status,
    this.updatedAt,
    this.categoryId,
    this.title,
    this.writer,
    this.publisher,
    this.yearPublication,
    this.synopsis,
    this.thumbnail,
  });

  factory BorrowedBook.fromJson(Map<String, dynamic> json) => BorrowedBook(
        borrowId: json["borrow_id"],
        userId: json["user_id"],
        bookId: json["book_id"],
        loanDate: json["loan_date"] == null
            ? null
            : DateTime.parse(json["loan_date"]),
        dueDate:
            json["due_date"] == null ? null : DateTime.parse(json["due_date"]),
        status: json["status"],
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.parse(json["updated_at"]),
        categoryId: json["category_id"],
        title: json["title"],
        writer: json["writer"],
        publisher: json["publisher"],
        yearPublication: json["year_publication"],
        synopsis: json["synopsis"],
        thumbnail: json["thumbnail"],
      );

  Map<String, dynamic> toJson() => {
        "borrow_id": borrowId,
        "user_id": userId,
        "book_id": bookId,
        "loan_date": loanDate?.toIso8601String(),
        "due_date": dueDate?.toIso8601String(),
        "status": status,
        "updated_at": updatedAt?.toIso8601String(),
        "category_id": categoryId,
        "title": title,
        "writer": writer,
        "publisher": publisher,
        "year_publication": yearPublication,
        "synopsis": synopsis,
        "thumbnail": thumbnail,
      };
}
