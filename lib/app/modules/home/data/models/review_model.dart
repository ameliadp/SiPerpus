class Review {
  final int? reviewId;
  final String? userName;
  final String? review;
  final double? rating;

  Review({
    this.reviewId,
    this.userName,
    this.review,
    this.rating,
  });

  factory Review.fromJson(Map<String, dynamic> json) => Review(
        reviewId: int.parse(json["review_id"] ?? 0),
        userName: json["user_name"],
        review: json["review"],
        rating: double.parse((json["rating"] ?? "0").toString()),
      );

  Map<String, dynamic> toJson() => {
        "review_id": reviewId,
        "user_name": userName,
        "review": review,
        "rating": rating,
      };
}
