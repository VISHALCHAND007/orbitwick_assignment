import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/legacy.dart';
import 'package:orbitwick_assignment/features/home/data/model/network_req_model.dart';
import 'package:orbitwick_assignment/features/home/data/repository/network_repository.dart';
import 'package:orbitwick_assignment/features/home/model/product_model.dart';

import '../../../../core/models/response.dart';

class NetworkViewModel extends StateNotifier<NetworkReqModel> {
  NetworkViewModel(this.networkRepository)
    : super(NetworkReqModel(products: []));

  final NetworkRepositoryImpl networkRepository;

  //general methods used
  void setError(String message) {
    state = state.copyWith(errorMessage: message, response: Response.error);
  }

  void clearError() {
    state = state.copyWith(errorMessage: null, response: Response.none);
  }

  void setLoading() {
    state = state.copyWith(response: Response.loading);
  }

  void setNone() {
    state = state.copyWith(response: Response.none);
  }

  void setData(List<ProductModel> products) {
    if(kDebugMode) {
      print('setting: $products');
      print('size: ${products.length}');
    }
    state = state.copyWith(response: Response.data, products: products);
    print(state.products.length);
  }

  Future<void> fetchProducts() async {
    try {
      setLoading();
      final products = await networkRepository.fetchProducts();

      setData(products);
    } catch (error) {
      if (kDebugMode) {
        print('Some error occurred: $error');
      }
      setError(error.toString());
    }
  }
}

final networkRepositoryProvider = Provider((ref) {
  return NetworkRepositoryImpl();
});

final networkViewModelProvider = StateNotifierProvider((ref) {
  final networkRepository = ref.watch(networkRepositoryProvider);
  return NetworkViewModel(networkRepository);
});
