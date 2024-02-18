import 'package:store/helper/api.dart';
import '../models/product_model.dart';

class GetAllProducts
{
  Future<List<ProductModel>> getAllProducts() async
  {
      List<dynamic> data = await Api().get(url: 'https://fakestoreapi.com/products');
      List<ProductModel> products=[];
      for(int i=0 ; i< data.length ; i++)
        {
          products.add(ProductModel.fromJson(data[i]));
        }
      return products;
  }

}