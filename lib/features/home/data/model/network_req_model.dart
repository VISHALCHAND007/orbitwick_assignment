import 'package:orbitwick_assignment/core/models/response.dart';
import 'package:orbitwick_assignment/features/home/model/product_model.dart';

class NetworkReqModel {
  late Response response;
  String? errorMessage;
  List<ProductModel> products = [];

  NetworkReqModel({
    Response? response,
    String? errorMsg,
    required List<ProductModel> products,
  }) {
    this.response = response ?? Response.none;
    errorMessage = errorMsg ?? '';
  }
}
