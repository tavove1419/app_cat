import 'package:app_test_movil/domains/entities/cat_breeds.dart';
import 'package:app_test_movil/presentation/delegates/search_cat_delegate.dart';
import 'package:app_test_movil/presentation/providers/providers.dart';
import 'package:app_test_movil/presentation/screens/screens.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class CustomAppBar extends ConsumerWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    final colors = Theme.of(context).colorScheme;
    final titleStyle = Theme.of(context).textTheme.titleMedium;

    return SafeArea(
      bottom: false,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: SizedBox(
          width: double.infinity,
          child: Row(
            children: [
              Icon(Icons.pets_outlined, color: colors.primary),
              SizedBox(width: 5),
              Text('Cats Breends', style: titleStyle),
              const Spacer(),
              IconButton(
                onPressed: (){
                  final catsBreedsRepository = ref.read(catBreedsRepositoryProvider);
                  showSearch<CatBreeds?>(
                    context: context,
                    delegate: SearchCatDelegate(
                      searchCat: catsBreedsRepository.searchCatBreeds
                    )).then((cat) {
                      if (cat == null) return;
                      if(context.mounted) {
                        context.goNamed(
                          CatScreen.name,
                          extra: cat
                        );
                      }
                    });
                },
                icon: Icon(Icons.search)
              )
            ],
          ),
        ),
      )
    );
  }
}