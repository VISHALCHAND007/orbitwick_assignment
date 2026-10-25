import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:orbitwick_assignment/features/home/model/product_model.dart';
import 'package:orbitwick_assignment/features/home/model/reviews.dart';
import 'package:orbitwick_assignment/features/home/ui/widgets/indicator/rating_indicator.dart';
import 'package:orbitwick_assignment/features/home/ui/widgets/text/text_subtitle.dart';
import 'package:orbitwick_assignment/features/home/ui/widgets/text/text_title.dart';
import 'package:readmore/readmore.dart';

class ProductDetailsScreen extends StatelessWidget {
  final ProductModel product;

  const ProductDetailsScreen({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Padding(
        padding: const .symmetric(vertical: 15, horizontal: 8),
        child: Column(
          children: [
            Stack(
              children: [
                ///product image
                Hero(
                  tag: product.id,
                  child: Image.network(
                    product.images[0],
                    height: screenHeight * .45,
                  ),
                ),

                ///rating indicator
                Positioned(
                  top: 50,
                  right: 20,
                  child: RatingIndicator(rating: product.rating.toString()),
                ),
              ],
            ),

            ///title
            TextTitle(
              title: product.title,
              textColor: Colors.black,
              fontSize: 18,
            ),
            SizedBox(height: 10),

            Row(
              mainAxisAlignment: .spaceBetween,
              children: [
                ///brand
                TextTitle(
                  title: 'Brand: ${product.brand}',
                  textColor: Colors.black54,
                ),

                ///price
                TextSubtitle(
                  text: 'Price: \$${product.price}',
                  textColor: Colors.black,
                ),
              ],
            ),

            SizedBox(height: 5),

            Row(
              mainAxisAlignment: .spaceBetween,
              children: [
                ///category
                TextTitle(
                  title: 'Category: ${product.category.toUpperCase()}',
                  textColor: Colors.black54,
                ),

                ///discount
                TextSubtitle(
                  text: 'Discount: ${product.discountPercentage} %',
                  textColor: Colors.black,
                ),
              ],
            ),
            SizedBox(height: 10),

            ///description
            ReadMoreText(
              product.description,
              style: TextStyle(color: Colors.black54, fontSize: 15),
              isExpandable: true,
              trimLines: 3,
              trimMode: .Line,
            ),
            SizedBox(height: 10),

            ///return policy
            Divider(),
            TextTitle(
              title: 'Return Policy: ${product.returnPolicy}',
              textColor: Colors.black54,
            ),
            Divider(),

            ///reviews
            TextTitle(title: 'Reviews', textColor: Colors.black54),
            Expanded(
              child: ListView.builder(
                padding: .zero,
                itemCount: product.reviews.length,
                itemBuilder: (ctx, ind) => Review(review: product.reviews[ind]),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class Review extends StatelessWidget {
  final Reviews review;

  const Review({super.key, required this.review});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: .symmetric(vertical: 2, horizontal: 8),
      child: Column(
        mainAxisSize: .max,
        mainAxisAlignment: .start,
        children: [
          Row(
            children: [
              ///icon: representing user image
              CircleAvatar(radius: 20, child: Icon(Icons.person)),
              SizedBox(width: 15),

              Column(
                crossAxisAlignment: .start,
                children: [
                  Row(
                    children: [
                      ///username
                      TextTitle(
                        title: review.reviewerName,
                        textColor: Colors.black54,
                        fontSize: 15,
                      ),
                      SizedBox(width: 10,),

                      ///rating
                      RatingBar.builder(
                        itemSize: 18,
                        minRating: 0,
                        maxRating: 5,
                        initialRating: review.rating.toDouble(),
                        itemBuilder: (ctx, _) =>
                            Icon(Icons.star, color: Colors.green,),
                        onRatingUpdate: (_) {},
                      ),
                    ],
                  ),

                  ///email
                  TextSubtitle(
                    text: review.reviewerEmail,
                    textColor: Colors.grey,
                  ),
                  SizedBox(height: 4),

                  ///comment
                  TextSubtitle(text: review.comment, textColor: Colors.black87),
                ],
              ),
            ],
          ),
          Row(
            mainAxisAlignment: .end,
            children: [
              ///date of comment
              TextSubtitle(
                text: review.date.split('T')[0],
                textColor: Colors.grey,
              ),
            ],
          ),
          SizedBox(height: 5),
        ],
      ),
    );
  }
}
