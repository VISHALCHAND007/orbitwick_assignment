class Reviews {
  final int rating;
  final String comment;
  final String date;
  final String reviewerName;
  final String reviewerEmail;

  const Reviews({
    required this.rating,
    required this.comment,
    required this.date,
    required this.reviewerName,
    required this.reviewerEmail,
  });

  factory Reviews.fromJson(Map<String, dynamic> json) => Reviews(
    rating: json['rating'],
    comment: json['comment'],
    date: json['date'],
    reviewerName: json['reviewerName'],
    reviewerEmail: json['reviewerEmail'],
  );
}
