
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

import '../models/products_model.dart';
import '../repo/products_repo.dart';

part 'products_event.dart';
part 'products_state.dart';

class ProductsBloc extends Bloc<ProductsLoadedEvent, ProductsState> {
  final ProductsRepo productsRepo;
  ProductsBloc(this.productsRepo) : super(LoadingState()) {
    on<ProductsLoadedEvent>((event, emit) async {
      // TODO: implement event handler
      try{
        emit(LoadingState());
        var data = await productsRepo.getProducts();
        emit(LoadedState(data));
      } catch(e) {
        emit(ErrorState(e.toString()));
        debugPrint(e.toString());
      }
    });
  }
}
