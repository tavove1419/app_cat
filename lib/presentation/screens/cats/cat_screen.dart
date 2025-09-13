import 'package:app_test_movil/presentation/widgets/widgets.dart';
import 'package:flutter/material.dart';

import 'package:app_test_movil/domains/entities/cat_breeds.dart';

class CatScreen extends StatelessWidget {

  static const name = 'cat-screen';
  final CatBreeds cat;

  const CatScreen({
    super.key,
    required this.cat
  });

  @override
  Widget build(BuildContext context) {

   
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text(cat.name)),
        elevation: 0,
        backgroundColor: Colors.transparent,
        foregroundColor: Colors.black,
      ),
      body: Column(
        children: [
          ImageCats(urlImage: cat.referenceImageId, paddingH: 20),
          SizedBox(height: 20),
          Expanded(
            child: SingleChildScrollView(
              child: _InformationSliverCat(informationCat: cat),
            )
          )
        ],
      ),
    );
  }
}

class _InformationSliverCat extends StatelessWidget {

  final CatBreeds informationCat;

  const _InformationSliverCat({
    required this.informationCat
  });

  @override
  Widget build(BuildContext context) {

    
    final stylesGeneral = Theme.of(context).textTheme;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: double.infinity,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(informationCat.description, style: stylesGeneral.titleMedium,)
                  ],
                ),
              ),
            ],
          ),
        ),

        //Items Information
        Padding(
          padding: EdgeInsets.all(8),
          child: Wrap(
            crossAxisAlignment: WrapCrossAlignment.center,
            spacing: 8.0,
            runSpacing: 4.0,
            children: [
              _InformationChip(informationCat: 'Origin: ${informationCat.origin}'),
              _InformationChip(informationCat: 'Intelligence: ${informationCat.intelligence.toString()}'),
              _InformationChip(informationCat: 'Adaptability: ${informationCat.adaptability.toString()}'),
              _InformationChip(informationCat: 'Life Span: ${informationCat.lifeSpan.toString()}'),
            ],
          ),
        ),

        SizedBox(height: 100)        
      ],
    );
  }
}

class _InformationChip extends StatelessWidget {
  const _InformationChip({
    required this.informationCat,
  });

  final String informationCat;

  @override
  Widget build(BuildContext context) {
    return Chip(
      label: Text(informationCat),
      shape: RoundedRectangleBorder(borderRadius: BorderRadiusGeometry.circular(20)),
    );
  }
}