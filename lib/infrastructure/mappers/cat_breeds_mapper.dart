import 'package:app_test_movil/domains/entities/cat_breeds.dart';
import 'package:app_test_movil/infrastructure/models/cat_breeds_response_model.dart' show CatBreedsResponse;

class CatBreedsMapper {

  static CatBreeds catBreedsToEntity(CatBreedsResponse catBreends) => CatBreeds(
    id: catBreends.id,
    name: catBreends.name,
    temperament: catBreends.temperament,
    origin: catBreends.origin,
    description: catBreends.description,
    lifeSpan: catBreends.lifeSpan,
    intelligence: catBreends.intelligence,
    adaptability: catBreends.adaptability,
    wikipediaUrl: catBreends.wikipediaUrl,
    referenceImageId: (catBreends.referenceImageId != '')
    ? 'https://cdn2.thecatapi.com/images/${catBreends.referenceImageId}.jpg'
    : 'https://st.depositphotos.com/3097111/4720/v/450/depositphotos_47208671-stock-illustration-photo-coming-soon-image-vector.jpg'
  );


  static List<CatBreeds> catBreedListToEntity(List<CatBreedsResponse> response) {
    return response.map((cat) => catBreedsToEntity(cat)).toList();
  }
}