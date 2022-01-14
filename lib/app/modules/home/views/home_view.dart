import 'package:flutter/material.dart';
import 'package:flutter_food_shop_implement_restapi/app/data/models/section_component_model.dart';
import 'package:flutter_food_shop_implement_restapi/app/modules/detail/views/detail_view.dart';
import 'package:flutter_food_shop_implement_restapi/app/modules/home/widgets/card_recipe.dart';
import 'package:flutter_food_shop_implement_restapi/app/routes/app_pages.dart';

import 'package:get/get.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  @override
  var _controller = Get.find<HomeController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'RecipeApp',
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.white,
      ),
      body: Column(
        children: [
          Expanded(
            child: Obx(
              () {
                if (_controller.isLoading.value) {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                } else {
                  return ListView.separated(
                    padding: EdgeInsets.only(bottom: 16),
                    itemCount: _controller.resep.length,
                    itemBuilder: (context, index) {
                      return InkWell(
                        onTap: () {
                          Get.toNamed(Routes.DETAIL,
                              arguments: _controller.resep[index]);
                        },
                        child: CardRecipe(
                          titleMenu: _controller.resep[index].name,
                          cookTime: _controller.resep[index].cookTime,
                          imgUrl: _controller.resep[index].image,
                          rating: _controller.resep[index].country,
                          description: _controller.resep[index].description,
                          videoURL: _controller.resep[index].videoURL,
                          instructions: _controller.resep[index].instructions,
                          sections: _controller.resep[index].sections,
                        ),
                      );
                    },
                    separatorBuilder: (context, index) => SizedBox(
                      height: 8,
                    ),
                  );
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
