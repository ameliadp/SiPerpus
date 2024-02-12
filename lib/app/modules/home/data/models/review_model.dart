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
