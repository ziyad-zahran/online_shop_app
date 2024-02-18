import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:store/models/product_model.dart';
import 'package:store/screens/upgrade_product_page.dart';
import 'package:store/services/get_all_products_services.dart';
import 'package:store/widgets/custom_card.dart';
import 'package:store/widgets/navigate_to.dart';


class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);
  static String id = 'HomePage';
  @override
  Widget build(BuildContext context) {
    double sizeHeight = MediaQuery.of(context).size.height;
    double sizeWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        actions: [
          IconButton(onPressed: (){}, icon: Icon(
              FontAwesomeIcons.cartPlus,
              color: Colors.black,
          ))
        ],
        title: Text(
            'New Trend',
        style: TextStyle(
          color: Colors.black
        ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(
          left: 8,
          right: 8,
          top: 96,
        ),
        child: FutureBuilder<List<ProductModel>>
          (
          future: GetAllProducts().getAllProducts(),
          builder: (context,snapshot)
          {
            if (snapshot.hasData) {
              List<ProductModel> products=snapshot.data!;
              return GridView.builder(
                itemCount: products.length,
                  clipBehavior: Clip.none,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 1.6,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 85,
                  ),
                  itemBuilder: (context,index)
                  {
                    return CustomCard(
                    product: products[index],
                      );
                    }
              );
            }
            else
              {
                return Center(child: CircularProgressIndicator());
              }
          },
        ),
      )
    );
  }

}


