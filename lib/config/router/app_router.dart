
import 'package:app_test_movil/domains/entities/cat_breeds.dart';
import 'package:go_router/go_router.dart';

import 'package:app_test_movil/presentation/screens/screens.dart';

final appRouter = GoRouter(
  initialLocation: '/splash',
  routes: [
    GoRoute(
      path: '/splash',
      name: SplashCats.name,
      builder: (context, state) => SplashCats()
    ),

    GoRoute(
      path: '/',
      name: LandingScreen.name,
      builder: (context, state) => const LandingScreen(),
      routes: [
        GoRoute(
          path: 'cat',
          name: CatScreen.name,
          builder: (context, state) {
            final cat = state.extra as CatBreeds;
            return CatScreen(cat: cat);
          }
        )
      ]
    )   
  ]
);