import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:orbitwick_assignment/core/static_data/my_strings.dart';
import 'package:orbitwick_assignment/features/home/data/viewmodel/network_view_model.dart';
import 'package:orbitwick_assignment/features/home/ui/widgets/card/product_item_card.dart';

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({super.key});

  @override
  ConsumerState<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (!mounted) return;
      fetchProducts();
    });
  }

  void fetchProducts() async {
    await ref.watch(networkViewModelProvider.notifier).fetchProducts();
  }

  @override
  Widget build(BuildContext context) {
    final networkViewModel = ref.watch(networkViewModelProvider);
    final products = ref.watch(networkViewModelProvider).products;

    return Scaffold(
      appBar: AppBar(title: Text(MyStrings.productExplorer)),
      body: Padding(
        padding: const .symmetric(vertical: 15, horizontal: 8),
        child: networkViewModel.response == .loading
            ? Center(child: CircularProgressIndicator())
            : networkViewModel.response == .error
            ? Text('Error: ${networkViewModel.errorMessage}')
            : products.isEmpty
            ? Center(child: Text('No product found'))
            : GridView.builder(
                itemCount: products.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 8,
                  crossAxisSpacing: 5
                ),
                itemBuilder: (context, index) =>
                    ProductItemCard(product: products[index]),
              ),
      ),
    );
  }
}
