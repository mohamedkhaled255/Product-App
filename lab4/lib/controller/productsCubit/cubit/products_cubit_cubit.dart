import 'package:bloc/bloc.dart';
import 'package:lab4/api/api_provider.dart';
import 'package:lab4/models/products_model.dart';
import 'package:meta/meta.dart';

part 'products_cubit_state.dart';

class productsCubit extends Cubit<ProductsState> {
  productsCubit() : super(ProductsCubitInitial()){
    getProducts();
  }

  late ProductsModel productsModel;

  getProducts() async{
    try{
      emit(ProductsLoading());
      productsModel = await ApiProvider().getAllProduct();
      emit(ProductsSuccess(productsModel));
    }catch (e){
      emit(ProductsError(e.toString()));
    }
  }
}
