import 'package:app_test_movil/infrastructure/datasources/catbreedsapi_datasources.dart';
import 'package:app_test_movil/infrastructure/repositories/cat_breeds_repository_impl.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final catBreedsRepositoryProvider = Provider((ref) {

  return CatBreedsRepositoryImpl(CatBreedsApiDatasources());

});