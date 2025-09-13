import 'package:app_test_movil/domains/datasources/cat_breeds_datasource.dart';
import 'package:app_test_movil/domains/entities/cat_breeds.dart';
import 'package:app_test_movil/domains/repositories/cat_breeds_repository.dart';

class CatBreedsRepositoryImpl extends CatBreedsRepository {

  final CatBreedsDatasource datasource;

  CatBreedsRepositoryImpl(this.datasource);

  @override
  Future<List<CatBreeds>> getCatBreeds({int limit = 10, int page = 0}) {
    try {
      return datasource.getCatBreeds(limit: limit, page: page);
    } catch (e) {
      throw UnimplementedError(e.toString());
    }
  }
  
}