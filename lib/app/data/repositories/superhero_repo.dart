import 'package:superhero/app/data/models/superhero_response.dart';
import 'package:superhero/app/data/repositories/api_repo.dart';

class SuperheroService {
  final ApiService _apiService = ApiService();

  Future<SuperheroResponse?> getCharactersDetails() async {
    try {
      final dynamic response = await _apiService.get(ApiConstants.getSuperhero);

      if (response != null) {
        final SuperheroResponse superheroData =
            SuperheroResponse.fromJson(response);

        return superheroData;
      }
    } catch (e) {
      rethrow;
    }
  }
}

class ApiConstants {
  static const String scheme = 'https';
  static const String baseUrl = 'superheroapi.com';
  static const String token = '1900121036863469';
  static const int superHeroId = 644;

  static Uri get getSuperhero =>
      Uri(host: baseUrl, scheme: scheme, path: '/api/$token/$superHeroId');
}
