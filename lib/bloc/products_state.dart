part of 'products_bloc.dart';

abstract class ProductsState extends Equatable {
  const ProductsState();

  @override
  List<Object> get props => [];
}

class ProductsInitial extends ProductsState {}

class LoadingState extends ProductsState {}

class LoadedState extends ProductsState {
  final List<ProductsModel> productsModel;
  const LoadedState(this.productsModel);

  @override
  List<Object> get props => [productsModel];
}

class ErrorState extends ProductsState {
  final String errorMsg;
  const ErrorState(this.errorMsg);

  @override
  List<Object> get props => [errorMsg];

}


