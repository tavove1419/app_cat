import 'package:flutter/material.dart';

class ImageCats extends StatelessWidget {

  final String urlImage;
  final double paddingH;

  const ImageCats({
    super.key,
    required this.urlImage,
    required this.paddingH
  });

  @override
  Widget build(BuildContext context) {

    final size = MediaQuery.of(context).size;

        return Container(
          height: size.height * 0.35,
          width: double.infinity,
          padding: EdgeInsets.symmetric(horizontal: paddingH),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Image.network(
              urlImage,
              fit: BoxFit.cover,
              loadingBuilder: (context, child, loadingProgress) {
              if(loadingProgress != null) {
                  return const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Center(child: CircularProgressIndicator(strokeWidth: 2,)),
                  );
                }
                return child;
              },
            ),
          ),
        );
  }
}