import 'package:acme/src/modules/products/domain/entities/product_entity.dart';
import 'package:acme/src/modules/products/domain/repositories/product_repository_base.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'product_event.dart';
part 'product_state.dart';

class ProductBloc extends Bloc<ProductEvent, ProductState> {
  final List<ProductEntity> _products = <ProductEntity>[];

  List<ProductEntity> get products => _products;

  final ProductRepositoryBase _productRepository;

  ProductBloc({required ProductRepositoryBase productRepository})
      : _productRepository = productRepository,
        super(ProductInitial()) {
    on<FetchProducts>(_fetchProducts);
    on<ClearProducts>(_clearProducts);
  }

  void _fetchProducts(FetchProducts event, Emitter<ProductState> emitter) async {
    final productStream = _productRepository.fetchProducts();

    emitter(ProductsLoading());

    await productStream.forEach((product) {
      _products.add(product);

      emitter(ProductsUpdated(products.toList(), products.length - 1));
    });

    emitter(ProductsFetched(_products));
  }

  void _clearProducts(ClearProducts event, Emitter<ProductState> emitter) async {
    emitter(ProductsCleared());
  }
}
