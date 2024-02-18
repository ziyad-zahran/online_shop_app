import 'package:store/models/product_model.dart';

import '../helper/api.dart';

class AddProduct
{
  String? title;
  String? price;
  String? description;
  String? image;
  String? category;
  Future<ProductModel> postProduct () async
  {
    Map<String,dynamic> data =await Api().post(
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