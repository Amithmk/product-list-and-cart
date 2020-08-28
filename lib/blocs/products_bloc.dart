import 'dart:async';

import 'package:kaynesappnew/api/db_api.dart';
import 'package:kaynesappnew/models/category.dart';
import 'package:kaynesappnew/models/product.dart';
import 'package:kaynesappnew/widgets/bloc_provider.dart';

class ProductsBloc implements BlocBase {
  List<Product> _products;

  final _productsController = StreamController<List<Product>>();
  Sink<List<Product>> get _inProducts => _productsController.sink;
  Stream<List<Product>> get outProducts => _productsController.stream;

  ProductsBloc(Category category) {
    getProducts(category);
  }

  void getProducts(Category category) {
    DbApi dbApi = DbApi();
    _products = dbApi.getProducts(category);
    _inProducts.add(_products);
  }

  @override
  void dispose() {
    _productsController.close();
  }

}