import 'package:app_test_movil/presentation/providers/providers.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final initialLoadingProvider = Provider<bool>((ref) {

  final step1 = ref.watch(getCatBreendsProvider).isEmpty;

  return  step1 ? true : false;
  
});