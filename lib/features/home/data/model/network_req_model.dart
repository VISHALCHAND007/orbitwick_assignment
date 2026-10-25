import 'package:orbitwick_assignment/core/models/response.dart';
import 'package:orbitwick_assignment/features/home/model/product_model.dart';

class NetworkReqModel {
  late Response response;
  String? errorMessage;
  late List<ProductModel> products;

  NetworkReqModel({
    Response? response,
    String? errorMsg,
    List<ProductModel>? products,
  }) {
    this.response = response ?? Response.none;
    errorMessage = errorMsg ?? '';
    this.products = products ?? [];
  }

  NetworkReqModel copyWith({
    Response? response,
    String? errorMessage,
    List<ProductModel>? products,
  }) {
    return NetworkReqModel(
      response: response ?? this.response,
      errorMsg: errorMessage ?? this.errorMessage,
      products: products ?? this.products,
    );
  }
}
