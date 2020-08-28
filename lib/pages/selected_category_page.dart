import 'package:flutter/material.dart';
import 'package:kaynesappnew/blocs/cart_bloc.dart';
import 'package:kaynesappnew/blocs/products_bloc.dart';
import 'package:kaynesappnew/models/product.dart';
import 'package:kaynesappnew/widgets/bloc_provider.dart';
import 'package:kaynesappnew/widgets/cart_button.dart';

class SelectedCategoryPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    final ProductsBloc _productsBloc = BlocProvider.of<ProductsBloc>(context);
    final _cartBloc = BlocProvider.of<CartBloc>(context);
    return Scaffold(
      appBar: AppBar(
        actions: <Widget>[
          CartButton(),
        ],
      ),
      body: StreamBuilder<List<Product>>(
        stream: _productsBloc.outProducts,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
              itemCount: snapshot.data.length,
              itemBuilder: (BuildContext context, int index) {
                final product = snapshot.data[index];
                return InkWell(
                  onTap: () => _cartBloc.addProduct(product),
                  child: Center(
                    child: Text(snapshot.data[index].name),
                  ),
                );
              },
            );
          }
          return SizedBox();
        },
      ),
    );
  }
}