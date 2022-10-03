part of 'cart_cubit.dart';

abstract class CartState extends Equatable {
  const CartState();

  @override
  List<Object> get props => [];
}

class CartInitial extends CartState {}

class CartUpdated extends CartState {
  final int productID;
  final int updatedAmmount;

  const CartUpdated({required this.productID, required this.updatedAmmount});

  @override
  List<Object> get props => [productID, updatedAmmount];
}

class CartCleared extends CartState {}
