import 'package:flutter/material.dart';
import 'package:store/models/product_model.dart';
import 'package:store/screens/upgrade_product_page.dart';

import 'navigate_to.dart';

class CustomCard extends StatelessWidget {
  CustomCard({super.key,required this.product});
  ProductModel product;
  @override
  Widget build(BuildContext context) {
    double sizeHeight = MediaQuery.of(context).size.height;
    double sizeWidth = MediaQuery.of(context).size.width;
    return GestureDetector(
      onTap: ()
      {
        NavigateTo().navigateTo(context: context,id:  UpgradePage.id,arguments: product);
      },
      child: Container(
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              blurRadius: 40,
              spreadRadius: 0,
              color: Colors.grey.withOpacity(0.2),
              offset: Offset(10,10),
            ),
          ],
        ),
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            Card(
              elevation: 10,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16,vertical: 8),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '${product.title!.substring(0,12)}',
                      style: TextStyle(
                          color: Colors.grey,
                          fontSize: 16
                      ),
                    ),
                    SizedBox(height: 5,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(r'$''${product.price}',
                        style: TextStyle(
                          fontSize: 16,
                        ),),
                        Icon(
                          Icons.favorite,
                          color: Colors.red,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
              top: -58,
              left: 78 ,
              child: Image.network(
                '${product.image}',
                height: sizeHeight*0.13,
                width: sizeWidth*0.2,
              ),
            )
          ],
        ),
      ),
    );
  }
}