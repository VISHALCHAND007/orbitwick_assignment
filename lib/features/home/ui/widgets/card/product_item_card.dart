import 'package:flutter/material.dart';
import 'package:orbitwick_assignment/core/static_data/my_strings.dart';
import 'package:orbitwick_assignment/features/home/model/product_model.dart';
import 'package:orbitwick_assignment/features/home/ui/pages/product_details_screen.dart';
import 'package:orbitwick_assignment/features/home/ui/widgets/indicator/rating_indicator.dart';
import 'package:orbitwick_assignment/features/home/ui/widgets/text/text_subtitle.dart';
import 'package:orbitwick_assignment/features/home/ui/widgets/text/text_title.dart';

class ProductItemCard extends StatelessWidget {
  final ProductModel product;

  const ProductItemCard({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: InkWell(
        borderRadius: .circular(10),
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (_) => ProductDetailsScreen(product: product),
            ),
          );
        },
        child: Stack(
          children: [
            ///image
            Hero(
              tag: product.id,
              child: Image.network(product.thumbnail, fit: .contain),
            ),

            ///if product is not available
            if (product.availabilityStatus != MyStrings.available)
              Positioned(
                top: 5,
                left: 5,
                child: Text(
                  MyStrings.notAvailable,
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: .bold,
                    color: Colors.deepOrange,
                  ),
                ),
              ),

            ///rating
            Positioned(
              top: 5,
              right: 5,
              child: RatingIndicator(rating: product.rating.toString()),
            ),

            ///text with overlay
            Positioned(
              bottom: 8,
              left: 0,
              right: 0,
              child: Container(
                color: Colors.black54,
                padding: const .symmetric(horizontal: 15, vertical: 6),
                child: Column(
                  crossAxisAlignment: .stretch,
                  children: [
                    TextTitle(title: product.title),

                    ///price
                    TextSubtitle(text: 'Price: \$${product.price}'),

                    /// discount
                    TextSubtitle(
                      text: 'Discount: ${product.discountPercentage} %',
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
