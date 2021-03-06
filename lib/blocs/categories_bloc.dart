import 'dart:async';

import 'package:kaynesappnew/api/db_api.dart';
import 'package:kaynesappnew/models/category.dart';
import 'package:kaynesappnew/widgets/bloc_provider.dart';

class CategoriesBloc implements BlocBase{
  List<Category> _categories;

  StreamController<List<Category>> _categoriesController = StreamController<List<Category>>();
  Sink<List<Category>> get _inCategories => _categoriesController.sink;
  Stream<List<Category>> get outCategories => _categoriesController.stream;

  CategoriesBloc(){
    _getCategories();
  }

  void _getCategories(){
    DbApi dbApi = DbApi();
    _categories = dbApi.getCategories();
    _inCategories.add(_categories);
  }

  @override
  void dispose() {
    _categoriesController.close();
  }

}