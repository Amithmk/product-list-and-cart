import 'package:flutter/material.dart';
import 'package:kaynesappnew/blocs/cart_bloc.dart';
import 'package:kaynesappnew/blocs/categories_bloc.dart';
import 'package:kaynesappnew/pages/home_page.dart';
import 'package:kaynesappnew/widgets/bloc_provider.dart';

void main() =>
  runApp(
    BlocProvider<CartBloc>(
      child: MyApp(),
      bloc: CartBloc(),
    )
  );

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: BlocProvider<CategoriesBloc>(
        bloc: CategoriesBloc(),
        child: HomePage(),
      ),
    );
  }
}