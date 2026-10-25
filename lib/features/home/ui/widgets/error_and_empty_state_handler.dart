import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:orbitwick_assignment/core/static_data/my_strings.dart';
import 'package:orbitwick_assignment/features/home/data/viewmodel/network_view_model.dart';
import 'package:orbitwick_assignment/features/home/ui/widgets/text/text_title.dart';

enum StateType { error, empty }

class ErrorAndEmptyStateHandler extends StatelessWidget {
  final StateType stateType;
  static final String imgUrl = 'assets/images/error.png';

  const ErrorAndEmptyStateHandler({super.key, required this.stateType});

  @override
  Widget build(BuildContext context) {
    return stateType == .error
        ? ImageWithTextWidget(imageUrl: imgUrl, text: MyStrings.error)
        : ImageWithTextWidget(imageUrl: imgUrl, text: MyStrings.noProductFound);
  }
}

class ImageWithTextWidget extends ConsumerWidget {
  final String imageUrl;
  final String text;

  const ImageWithTextWidget({
    super.key,
    required this.imageUrl,
    required this.text,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final screenHeight = MediaQuery.of(context).size.height;
    final networkViewModelNotifier = ref.watch(
      networkViewModelProvider.notifier,
    );

    return Center(
      child: Column(
        mainAxisAlignment: .center,
        mainAxisSize: .min,
        children: [
          ///image
          Image.asset(imageUrl, height: screenHeight * .4),

          ///space
          SizedBox(height: 10),

          ///text
          TextTitle(title: text, textColor: Colors.black87, fontSize: 20),

          if (text == MyStrings.error)
            TextButton.icon(
              icon: Icon(Icons.refresh, size: 25, color: Colors.black87),
              onPressed: () async {
                await networkViewModelNotifier.fetchProducts();
              },
              label: Text(
                'Retry',
                style: TextStyle(fontSize: 20, color: Colors.black87),
              ),
            ),
        ],
      ),
    );
  }
}
