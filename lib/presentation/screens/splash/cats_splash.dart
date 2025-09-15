import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SplashCats extends StatefulWidget {

  static const name = 'splash-cat';

  const SplashCats({super.key});

  @override
  State<SplashCats> createState() => _SplashCatsState();
}

class _SplashCatsState extends State<SplashCats> {

  @override
  void initState() {
    super.initState();
    _initialApp();
  }

  Future<void> _initialApp() async {
    await Future.delayed(const Duration(seconds: 5));
    if(mounted) {
      context.go('/');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Catsbreeds', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            SizedBox(height: 100),
            Image.asset('assets/logo.jpg')
          ],
        ),
      ),
    );
  }
}