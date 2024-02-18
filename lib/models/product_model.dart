class ProductModel {
  int? id;
  String? title;
  num? price;
  String? description;
  String? category;
  String? image;
  RatingModel? rate;

  ProductModel(
      {this.id,
      this.title,
      this.price,
      this.description,
      this.category,
      this.image,
      this.rate,
      });

  factory ProductModel.fromJson(jsonData)
  {
    return ProductModel
      (
        id: jsonData['id'],
        title: jsonData['title'],
        price: jsonData['price'],
        description: jsonData['description'],
        category: jsonData['category'],
        image: jsonData['image'],
        rate: RatingModel.fromJSon(jsonData['rating']),
      );
  }
}
class RatingModel
{
  num? rate;
  int? count;
  RatingModel({this.rate,this.count});
  factory RatingModel.fromJSon(jsonData)
  {
    return RatingModel(
      rate: jsonData['rate'],
      count: jsonData['count'],
    );
  }
}