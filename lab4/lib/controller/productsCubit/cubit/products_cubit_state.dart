part of 'products_cubit_cubit.dart';

@immutable
sealed class ProductsState {}

final class ProductsCubitInitial extends ProductsState {}
final class ProductsLoading extends ProductsState {}
final class ProductsSuccess extends ProductsState {
  late final ProductsModel productsModel;
  ProductsSuccess(this.productsModel);
}
final class ProductsError extends ProductsState {
  final String message;

  ProductsError( this.message);
  @override
  String toString()=> "ProductsError : $message";

}
