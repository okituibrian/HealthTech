import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

import '../../e-dawa cart/cart_model.dart';


// Import the Item class if it's defined in a separate file
// import 'item.dart';

@immutable
abstract class CartState extends Equatable {
  const CartState();

  @override
  List<Object> get props => [];
}

class CartInitial extends CartState {}

class CartLoading extends CartState {}

class CartLoaded extends CartState {
  final List<Cart> items;

  CartLoaded(this.items);

  @override
  List<Object> get props => [items];
}

class CartError extends CartState {
  final String message;

  CartError(this.message);

  @override
  List<Object> get props => [message];
}
