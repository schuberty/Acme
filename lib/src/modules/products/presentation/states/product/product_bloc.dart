import 'package:acme/src/modules/products/domain/entities/product_entity.dart';
import 'package:acme/src/modules/products/domain/repositories/product_repository_base.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'product_event.dart';
part 'product_state.dart';

class ProductBloc extends Bloc<ProductEvent, ProductState> {
  final ProductRepositoryBase _productRepository;

  ProductBloc({required ProductRepositoryBase productRepository})
      : _productRepository = productRepository,
        super(ProductInitial()) {
    on<FetchProducts>(_fetchproducts);
  }

  void _fetchproducts(FetchProducts event, Emitter<ProductState> emitter) async {
    final productStream = _productRepository.fetchProducts();

    await productStream.forEach((product) => emitter(ProductAdded(product)));
  }
}
