import 'package:app_test_movil/domains/entities/cat_breeds.dart';
import 'package:flutter/material.dart';

typedef SearchCatCallback = Future<List<CatBreeds>>Function(String name);

class SearchCatDelegate extends SearchDelegate<CatBreeds?> {

  final SearchCatCallback searchCat;

  SearchCatDelegate({
    required this.searchCat
  });

  @override
  String get searchFieldLabel => 'Search cat';

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      if(query.isNotEmpty)
        IconButton(
          onPressed: () => query = '',
          icon: const Icon(Icons.clear_rounded)
        )
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      onPressed: () => close(context, null),
      icon: Icon(Icons.arrow_back_ios_new_outlined)
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    return Text('Results');
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return FutureBuilder(
      future: searchCat(query), 
      builder: (context, snapshot) {

        final cats = snapshot.data ?? [];

        return ListView.builder(
          itemCount: cats.length,
          itemBuilder: (context, index) {
            return _ItemsCat(
              cat: cats[index],
              catSelection: close
            );
          },
        );
      },
    );
  }

}

class _ItemsCat extends StatelessWidget {

  final CatBreeds cat;
  final Function catSelection;

  const _ItemsCat({required this.cat, required this.catSelection});

  @override
  Widget build(BuildContext context) {

    final styleText = Theme.of(context).textTheme;
    final size = MediaQuery.of(context).size;

    return GestureDetector(
      onTap: () {
        catSelection(context, cat);
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
        child: Row(
          children: [
            SizedBox(
              width: size.width * 0.2,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Image.network(cat.referenceImageId),
              ),
            ),
            SizedBox(width: 10),
      
            SizedBox(
              width: size.width * 0.7,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(cat.name, style: styleText.titleMedium),
                  Text(cat.origin, style: styleText.bodySmall,)
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}