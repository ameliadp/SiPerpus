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
  final String? review;
  final int? rating;

  ReqSubmitReview({
    this.bookId,
    this.review,
    this.rating,
  });

  factory ReqSubmitReview.fromJson(Map<String, dynamic> json) =>
      ReqSubmitReview(
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
