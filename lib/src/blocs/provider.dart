import 'package:flutter/material.dart';
import 'package:form_validation_bloc/src/blocs/login_bloc.dart';
import 'package:form_validation_bloc/src/blocs/products_bloc.dart';
export 'package:form_validation_bloc/src/blocs/login_bloc.dart';
export 'package:form_validation_bloc/src/blocs/products_bloc.dart';

class Provider extends InheritedWidget {
  final loginBloc = LoginBloc();
  final _productsBloc = ProductsBloc();

  static Provider _instance;

  factory Provider({Key key, Widget child}) {
    if (_instance == null) {
      _instance = new Provider._internal(key: key, child: child);
    }

    return _instance;
  }

  Provider._internal({Key key, Widget child}) : super(key: key, child: child);
  // Provider({Key key, Widget child}) : super(key: key, child: child);   //*** Direct Constructor, we will not use it, we'll use the Singleton implemented

  @override
  bool updateShouldNotify(InheritedWidget oldWidget) => true;

  static LoginBloc of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<Provider>().loginBloc;
  }

  static ProductsBloc productsBloc(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<Provider>()._productsBloc;
  }
}
