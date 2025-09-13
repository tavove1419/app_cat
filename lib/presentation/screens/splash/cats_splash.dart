import 'package:flutter/material.dart';

class SplashCats extends StatelessWidget {
  const SplashCats({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('Catsbreeds'),
          SizedBox(height: 10)
        ],
      ),
    );
  }
}