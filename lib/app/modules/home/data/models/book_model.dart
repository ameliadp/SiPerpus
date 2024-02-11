// To parse this JSON data, do
//
//     final bookModel = bookModelFromJson(jsonString);

import 'dart:convert';

BookModel bookModelFromJson(String str) => BookModel.fromJson(json.decode(str));

String bookModelToJson(BookModel data) => json.encode(data.toJson());

class BookModel {
  final String? bookId;
  final String? categoryId;
  final String? title;
  final String? writer;
  final String? publisher;
  final String? yearPublication;
  final String? synopsis;
  final String? thumbnail;
  final int? rating;
  final List<Review>? reviews;

  BookModel({
    this.bookId,
    this.categoryId,
    this.title,
    this.writer,
    this.publisher,
    this.yearPublication,
    this.synopsis,
    this.thumbnail,
    this.rating,
    this.reviews,
  });

  factory BookModel.fromJson(Map<String, dynamic> json) => BookModel(
        bookId: json["book_id"],
        categoryId: json["category_id"],
        title: json["title"],
        writer: json["writer"],
        publisher: json["publisher"],
        yearPublication: json["year_publication"],
        synopsis: json["synopsis"],
        thumbnail: json["thumbnail"],
        rating: json["rating"],
        reviews: json["reviews"] == null
            ? []
            : List<Review>.from(
                json["reviews"]!.map((x) => Review.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "book_id": bookId,
        "category_id": categoryId,
        "title": title,
        "writer": writer,
        "publisher": publisher,
        "year_publication": yearPublication,
        "synopsis": synopsis,
        "thumbnail": thumbnail,
        "rating": rating,
        "reviews": reviews == null
            ? []
            : List<dynamic>.from(reviews!.map((x) => x.toJson())),
      };
}

class Review {
  final String? reviewId;
  final String? userName;
  final String? review;
  final int? rating;

  Review({
    this.reviewId,
    this.userName,
    this.review,
    this.rating,
  });

  factory Review.fromJson(Map<String, dynamic> json) => Review(
        reviewId: json["review_id"],
        userName: json["user_name"],
        review: json["review"],
        rating: json["rating"],
      );

  Map<String, dynamic> toJson() => {
        "review_id": reviewId,
        "user_name": userName,
        "review": review,
        "rating": rating,
      };
}