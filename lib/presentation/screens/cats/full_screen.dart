import 'package:flutter/material.dart';

class FullScreen extends StatelessWidget {
  const FullScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CircularProgressIndicator(strokeWidth: 5)
        ],
      ),
    );
  }
}