// To parse this JSON data, do
//
//     final reqSubmitReview = reqSubmitReviewFromJson(jsonString);

import 'dart:convert';

ReqSubmitReview reqSubmitReviewFromJson(String str) =>
    ReqSubmitReview.fromJson(json.decode(str));

String reqSubmitReviewToJson(ReqSubmitReview data) =>
    json.encode(data.toJson());

class ReqSubmitReview {
  final int? bookId;
  final int? borrowId;
  final String? review;
  final int? rating;

  ReqSubmitReview({
    this.bookId,
    this.borrowId,
    this.review,
    this.rating,
  });

  factory ReqSubmitReview.fromJson(Map<String, dynamic> json) =>
      ReqSubmitReview(
        borrowId: json["borrow_id"],
        bookId: json["book_id"],
        review: json["review"],
        rating: json["rating"],
      );

  Map<String, dynamic> toJson() => {
        "book_id": bookId,
        "review": review,
        "rating": rating,
      };
}
