import 'package:flutter_food_shop_implement_restapi/app/data/models/recipe_model.dart';
import 'package:flutter_food_shop_implement_restapi/app/data/services/recipe_api.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  late List<ResepModel> resep = <ResepModel>[].obs;
  var isLoading = true.obs;

  @override
  void onInit() {
    fetchRecipe();
    super.onInit();
  }

  void fetchRecipe() async {
    try {
      isLoading(true);
      var recipeFromAPI = await RecipeAPI.getResepFromAPI();

      if (recipeFromAPI != null) {
        resep = recipeFromAPI;
      }
    } catch (e) {
      print(e);
    } finally {
      isLoading(false);
    }
  }
}
