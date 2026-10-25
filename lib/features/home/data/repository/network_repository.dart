import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:orbitwick_assignment/core/static_data/url.dart';
import 'package:orbitwick_assignment/features/home/model/product_model.dart';

abstract class NetworkRepository {
  void fetchProducts();
}

class NetworkRepositoryImpl implements NetworkRepository {
  @override
  Future<List<ProductModel>> fetchProducts() async {
    final res = await http.get(Uri.parse(Url.fetchProducts));
    if (res.statusCode == 200) {
      final data = jsonDecode(res.body) as List;
      if (kDebugMode) {
        print(data);
      }
      return data.map((product) => ProductModel.fromJson(product)).toList();
    }
    throw Exception('Error: ${res.statusCode}');
  }
}
