import 'package:flutter_riverpod/legacy.dart';

import 'package:app_test_movil/domains/entities/cat_breeds.dart';
import 'package:app_test_movil/presentation/providers/cats/cat_breeds_repository_provider.dart';

final getCatBreendsProvider = StateNotifierProvider<CatBreendsNotifier, List<CatBreeds>>((ref) {

  final fechtMoreCatBreends = ref.watch(catBreedsRepositoryProvider).getCatBreeds;

  return CatBreendsNotifier(
    fechtMoreCatBreends: fechtMoreCatBreends
  );
});


typedef CatBreendsCallback = Future<List<CatBreeds>> Function({int limit, int page});

class CatBreendsNotifier extends StateNotifier<List<CatBreeds>> {
  int currentPage = 0;
  int limit = 4;

  CatBreendsCallback fechtMoreCatBreends;

  CatBreendsNotifier({
    required this.fechtMoreCatBreends
  }): super([]);

  Future<void> loadNextPage() async {

    currentPage++;

    final List<CatBreeds> cats = await fechtMoreCatBreends(limit: limit, page: currentPage);
    state = [...state, ...cats];

  }

}