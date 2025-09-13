import 'package:flutter/material.dart';
import 'package:app_test_movil/presentation/widgets/widgets.dart';
import 'package:app_test_movil/domains/entities/cat_breeds.dart';

class CatsSlideShow extends StatefulWidget {

  final List<CatBreeds> catsBreends;
  final String? title;
  final VoidCallback? loadNextPage;

  const CatsSlideShow({
    super.key,
    required this.catsBreends,
    this.title,
    this.loadNextPage
  });

  @override
  State<CatsSlideShow> createState() => _CatsSlideShowState();
}

class _CatsSlideShowState extends State<CatsSlideShow> {

  final scollController = ScrollController();


  @override
  void initState() {
    super.initState();
    
    scollController.addListener(() {

      if (widget.loadNextPage == null ) return;

      if ((scollController.position.pixels + 200) >= scollController.position.maxScrollExtent) {
        widget.loadNextPage!();
      }

    });
  }

  @override
  void dispose() {
    scollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    

    return Expanded(
      child: ListView.builder(
        itemCount: widget.catsBreends.length,
        scrollDirection: Axis.vertical,
        physics: BouncingScrollPhysics(),
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: _CatBreedCard(cats: widget.catsBreends[index]),
            
          );
        },
      )
    );
  }
}

class _CatBreedCard extends StatelessWidget {

  final CatBreeds cats;

  const _CatBreedCard({
    required this.cats,
  });

  @override
  Widget build(BuildContext context) {

      return Container(
        margin: EdgeInsets.symmetric(horizontal: 8),
        child: Card(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TitleCards(title: cats.name, currentCat: cats),
          
              SizedBox(height: 5),
          
              ImageCats(urlImage: cats.referenceImageId, paddingH: 0),
          
              SizedBox(height: 5),
          
              FooterCards(origin: cats.origin, intelligence: cats.intelligence),
          
              SizedBox(height: 10),
              
            ],
          ),
        )
        
      );
  }
}