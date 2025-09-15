import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:app_test_movil/presentation/screens/screens.dart'; 
import 'package:app_test_movil/presentation/widgets/widgets.dart';
import 'package:app_test_movil/presentation/providers/providers.dart';

class LandingScreen extends StatelessWidget {

  static const name = 'landing-screen';

  const LandingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: _LandingView(),
    );
  }
}

class _LandingView extends ConsumerStatefulWidget {
  const _LandingView();

  @override
  _LandingViewState createState() => _LandingViewState();
}

class _LandingViewState extends ConsumerState<_LandingView> {

  @override
  void initState() {
    super.initState();
    ref.read(getCatBreendsProvider.notifier).loadNextPage();
  }

  @override
  Widget build(BuildContext context) {

    final initialLoading = ref.watch(initialLoadingProvider);

    if (initialLoading) return FullScreen();

    final getCatBreends = ref.watch(getCatBreendsProvider);

    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          children: [
            CustomAppBar(),
            CatsSlideShow(catsBreends: getCatBreends)
          ],
        ),
      ),
    );
  }
}
