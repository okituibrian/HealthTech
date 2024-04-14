import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:workarea_patient/Bloc/cart_state.dart';
import 'package:workarea_patient/presentation/cart_provider.dart';

import '../presentation/cart_model.dart';

class CartEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class NavigateToCartScreenEvent extends CartEvent {}

class CartBloc extends Bloc<CartEvent, CartState> {
  final BuildContext context; // Add context variable

  CartBloc(this.context) : super(CartInitial()); // Pass context in constructor

  @override
  Stream<CartState> mapEventToState(CartEvent event) async* {
    if (event is NavigateToCartScreenEvent) {
      // Get the cart provider instance using Provider
      CartProvider cartProvider = Provider.of<CartProvider>(context, listen: false);

      // Get the list of cart items from the cart provider
      List<Cart> cartItems = await cartProvider.getData();

      // Emit the CartLoaded state with the list of items
      yield CartLoaded(cartItems);
    }
  }
}
