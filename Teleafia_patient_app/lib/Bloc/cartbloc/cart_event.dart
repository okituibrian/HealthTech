import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

import '../../e-dawa cart/cart_model.dart';



@immutable
abstract class CartEvent extends Equatable {
  const CartEvent();

  @override
  List<Object> get props => [];
}

class AddItemEvent extends CartEvent {
  final Cart item;

  const AddItemEvent(this.item);

  @override
  List<Object> get props => [item];
}

class RemoveItemEvent extends CartEvent {
  final Cart item;

  const RemoveItemEvent(this.item);

  @override
  List<Object> get props => [item];
}

class NavigateToCartScreenEvent extends CartEvent {}
