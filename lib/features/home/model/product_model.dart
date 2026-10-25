import 'package:orbitwick_assignment/features/home/model/reviews.dart';

class ProductModel {
  final int id;
  final String title;
  final String description;
  final String category;
  final double price;
  final double discountPercentage;
  final double rating;
  final int stockLeft;
  final List<String> tags;
  final String brand;
  final int weight;
  final String warrantyInfo;
  final String shippingInfo;
  final String availabilityStatus;
  final List<Reviews> reviews;
  final String returnPolicy;
  final int minOrderQuantity;
  final List<String> images;
  final String thumbnail;

  const ProductModel({
    required this.id,
    required this.title,
    required this.description,
    required this.category,
    required this.price,
    required this.discountPercentage,
    required this.rating,
    required this.stockLeft,
    required this.tags,
    required this.brand,
    required this.weight,
    required this.warrantyInfo,
    required this.shippingInfo,
    required this.availabilityStatus,
    required this.reviews,
    required this.returnPolicy,
    required this.minOrderQuantity,
    required this.images,
    required this.thumbnail,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    final reviews = json['reviews'] as List<Map<String, dynamic>>;

    final reviewsDecoded = reviews
        .map((review) => Reviews.fromJson(review))
        .toList();

    return ProductModel(
      id: json['id'],
      title: json['title'],
      description: json['description'],
      category: json['category'],
      price: json['price'],
      discountPercentage: json['discountPercentage'],
      rating: json['rating'],
      stockLeft: json['stock'],
      tags: json['tags'],
      brand: json['brand'],
      weight: json['weight'],
      warrantyInfo: json['warrantyInformation'],
      shippingInfo: json['shippingInformation'],
      availabilityStatus: json['availabilityStatus'],
      reviews: reviewsDecoded,
      returnPolicy: json['returnPolicy'],
      minOrderQuantity: json['minimumOrderQuantity'],
      images: json['images'],
      thumbnail: json['thumbnail'],
    );
  }
}
