import 'package:store/helper/api.dart';
import 'package:store/models/product_model.dart';

class GetCategory
{
  Future<List<ProductModel>> getCategory({required String categoryName}) async{
      List<dynamic> data = await Api().get(url: 'https://fakestoreapi.com/products/category/$categoryName');
      List<ProductModel> categories=[];
      for(int i=0 ; i< data.length ; i++)
      {
        categories.add(ProductModel.fromJson(data[i]));
      }
      return categories;
    }
}
