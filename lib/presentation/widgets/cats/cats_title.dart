import 'package:app_test_movil/presentation/screens/screens.dart';
import 'package:flutter/material.dart';
import 'package:app_test_movil/domains/entities/cat_breeds.dart';
import 'package:go_router/go_router.dart';

class TitleCards extends StatelessWidget {

  final String title;
  final CatBreeds currentCat;

  const TitleCards({
    super.key,
    required this.title,
    required this.currentCat
  });

  @override
  Widget build(BuildContext context) {
    
    final titleStyle = Theme.of(context).textTheme.titleMedium;

    return Container(
      padding: EdgeInsets.only(top: 10),
      margin: EdgeInsets.symmetric(horizontal: 10),
      child: Row(
        children: [
          SizedBox(
            width: 150,
            child: Text(title, style: titleStyle, maxLines: 2)
          ),

          const Spacer(),

          FilledButton.tonal(
            onPressed: (){
              context.goNamed(
                CatScreen.name,
                extra: currentCat
              );
            },
            child: Text('Mas..')
          )
        ],
      ),
    );
  }
}