import 'package:app_test_movil/infrastructure/models/cat_breeds_response_model.dart';
import 'package:dio/dio.dart';

import 'package:app_test_movil/config/constants/environment.dart';
import 'package:app_test_movil/domains/datasources/cat_breeds_datasource.dart';
import 'package:app_test_movil/domains/entities/cat_breeds.dart';
import 'package:app_test_movil/infrastructure/mappers/cat_breeds_mapper.dart';

class CatBreedsApiDatasources extends CatBreedsDatasource {

  final dio = Dio(BaseOptions(
    baseUrl: Environment.urlApiCatBreeds,
    queryParameters: {
      'x-api-key': Environment.keyApiCatBreeds,
    }
    
  ));

  @override
  Future<List<CatBreeds>> getCatBreeds({int limit = 10, int page = 0}) async {
    final response = await dio.get('/breeds',
      queryParameters: {
        'limit': limit,
        'page': page
      }
    );
    final List<dynamic> dataResponse =  response.data;
    final List<CatBreedsResponse> catBreendsResponse = dataResponse.map(
      (cat) => CatBreedsResponse.fromJson(cat)).toList();
    final List<CatBreeds> catsList = CatBreedsMapper.catBreedListToEntity(catBreendsResponse);
    return catsList;
  }
}