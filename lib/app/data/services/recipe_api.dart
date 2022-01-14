import 'dart:convert';
import 'package:flutter_food_shop_implement_restapi/app/data/models/recipe_model.dart';
import 'package:http/http.dart' as http;

class RecipeAPI {
// var req = unirest("GET", "https://tasty.p.rapidapi.com/recipes/list");

// req.query({
  // "from": "0",
  // "size": "20",
  // "tags": "under_30_minutes"
// });

// req.headers({
  // "x-rapidapi-host": "tasty.p.rapidapi.com",
  // "x-rapidapi-key": "9a7f974f5dmsh28017925e18b103p196fe2jsnf46319e43e22",
  // "useQueryString": true
// });

  static Future<List<ResepModel>> getResepFromAPI() async {
    var uri = Uri.https(
      "tasty.p.rapidapi.com",
      '/recipes/list',
      {
        "from": "0",
        "size": "20",
        "tags": "under_30_minutes",
      },
    );

    final response = await http.get(
      uri,
      headers: {
        "x-rapidapi-host": "tasty.p.rapidapi.com",
        "x-rapidapi-key": "9a7f974f5dmsh28017925e18b103p196fe2jsnf46319e43e22",
        "useQueryString": "true"
      },
    );

    Map data = jsonDecode(response.body);

    List _temp = [];

    for (var item in data['results']) {
      _temp.add(item);
    }

    // Masukan List _temp ke dalam static method resepFromSnapshot
    return ResepModel.resepFromSnapshot(_temp);
  }
}
