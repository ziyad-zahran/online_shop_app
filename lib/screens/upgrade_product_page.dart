import 'package:flutter/material.dart';
import 'package:store/helper/show_snack_bar.dart';
import 'package:store/models/product_model.dart';
import 'package:store/services/update_product_service.dart';
import 'package:store/widgets/custom_button.dart';
import 'package:store/widgets/custom_text_field.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class UpgradePage extends StatefulWidget {
  UpgradePage({Key? key}) : super(key: key);
  static String id = 'Upgrade Screen';

  @override
  State<UpgradePage> createState() => _UpgradePageState();
}

class _UpgradePageState extends State<UpgradePage> {
  String? productName,price,description,image;

  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    ProductModel product = ModalRoute.of(context)!.settings.arguments as ProductModel;
    return ModalProgressHUD(
      inAsyncCall: isLoading,
      child: Scaffold(
          appBar: AppBar(
            centerTitle: true,
            title: Text('Update Product'),
          ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CustomTextField
                (hint: 'Add Product',
              onChanged: (data)
                {
                  productName= data;
                },
              ),
              SizedBox(height: 12,),
              CustomTextField(hint: 'Add Description',
                onChanged: (data)
                {
                  description = data;
                },
              ),
              SizedBox(height: 12,),
              CustomTextField(hint: 'Add Image',
                onChanged: (data)
                {
                  image = data;
                },
              ),
              SizedBox(height: 12,),
              CustomTextField(hint: 'Add Price',
                onChanged: (data)
                {
                  price = data;
                },
              ),
              SizedBox(height: 50,),
              CustomButton(text: 'Update',
              onTap: ()
              {
                isLoading = true;
                setState(() {

                });
                try {
                  updateProduct(product);
                  showSnackBar(context, 'Success');
                }catch (e) {
                  print(e.toString());
                }
                isLoading = false;
                setState(() {

                });
              },
              ),
            ],
          ),
        ),
      ),
    );
  }

  void updateProduct(ProductModel product) {
    UpdateProductService().updateProduct(
        title: productName == null ? product.title !: productName !,
        price: price == null ? (product.price).toString(): price !,
        description: description == null ? product.description !: description !,
        image: image == null ? product.image !: image !,
        category: product.category!);
  }
}
