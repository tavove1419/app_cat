import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {

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
                onPressed: (){},
                icon: Icon(Icons.search)
              )
            ],
          ),
        ),
      )
    );
  }
}