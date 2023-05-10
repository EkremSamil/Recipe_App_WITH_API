import 'package:chopper/chopper.dart';
import 'recipe_model.dart';
import 'model_response.dart';
import 'model_converter.dart';
part 'recipe_service.chopper.dart';

const String apiKey = '3422c51d9197653a1e7f57d3ed2d3a4e';
const String apiId = '6ea5d229';
const String apiUrl = 'https://api.edamam.com';

@ChopperApi()
abstract class RecipeService extends ChopperService {
  @Get(path: "search")
  Future<Response<Result<APIRecipeQuery>>> queryRecipes(
      @Query('q') String query, @Query('from') int from, @Query('to') int to);

  //
  static Request _addQuery(Request req) {
    final params = Map<String, dynamic>.from(req.parameters);
    params['app_id'] = apiId;
    params['app_key'] = apiKey;
    return req.copyWith(parameters: params);
  }

  static RecipeService create() {
    final client = ChopperClient(
      baseUrl: Uri.parse(apiUrl),
      interceptors: [_addQuery, HttpLoggingInterceptor()],
      converter: ModelConverter(),
      errorConverter: const JsonConverter(),
      services: [
        _$RecipeService(),
      ],
    );
    return _$RecipeService(client);
  }
}

// HTTP Package

// import 'package:http/http.dart';
//
// const String apiKey = '3422c51d9197653a1e7f57d3ed2d3a4e';
// const String apiId = '6ea5d229';
// const String apiUrl = 'https://api.edamam.com/search';
//
// class RecipeService {
//   Future getData(String url) async {
//     final response = await get(Uri.parse(url));
//     if (response.statusCode == 200) {
//       return response.body;
//     } else {
//       print(response.body);
//     }
//   }
//
//   Future<dynamic> getRecipes(String query, int from, int to) async {
//     final recipeData = await getData('$apiUrl?app_id=$apiId&app_key=$apiKey&q=$query&from=$from&to=$to');
//     return recipeData;
//   }
// }

// 1
