import 'package:app_test_movil/domains/entities/cat_breeds.dart' show CatBreeds;

abstract class CatBreedsDatasource {

  Future<List<CatBreeds>> getCatBreeds({int limit = 10, int page = 0});
  
}