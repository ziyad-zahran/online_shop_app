import 'package:store/models/product_model.dart';

import '../helper/api.dart';

class UpdateProductService
{
  String? title;
  String? price;
  String? description;
  String? image;
  String? category;
  Future<ProductModel> updateProduct (
      {
    required  String title,
    required  String price,
    required  String description,
    required  String image,
    required  String category,
  }) async
  {
    List<dynamic> data =await Api().put(
      url: 'https://fakestoreapi.com/products',
      body:{
        'title': title,
        'price': price,
        'description': description,
        'image': image,
        'category': category,
      },
    );
    return ProductModel.fromJson(data);
  }
}