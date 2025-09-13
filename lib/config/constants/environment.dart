import 'package:flutter_dotenv/flutter_dotenv.dart';

class Environment {

  static String keyApiCatBreeds = dotenv.env['API_KEY_CAT_BREEDS'] ?? 'Es necesario configurar Api Key para uso de la variable';
  static String urlApiCatBreeds = dotenv.env['API_CAT_BREEDS'] ?? 'Es necesario configurar URL para consumo de la Api';

}