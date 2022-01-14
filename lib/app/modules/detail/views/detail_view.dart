import 'package:flutter/material.dart';
import 'package:flutter_food_shop_implement_restapi/app/data/models/section_component_model.dart';
import 'package:flutter_food_shop_implement_restapi/app/modules/home/widgets/card_recipe.dart';

import 'package:get/get.dart';

import '../controllers/detail_controller.dart';

class DetailView extends GetView<DetailController> {
  @override
  Widget build(BuildContext context) {
    // get data dari setiap card yang di klik
    var _resepSpesific = Get.arguments;
    print(_resepSpesific);

    // Manipulasi untuk mengambil component di dalam section sesuai dengan indeks
    List<Component> component =
        List.from(_resepSpesific.sections[0].components);
    print(component);

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Get.back(),
        ),
        title: Text(
          'RecipeApp',
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.white,
      ),
      body: SafeArea(
        child: ListView(
          children: [
            CardRecipe(
              titleMenu: _resepSpesific.name,
              cookTime: _resepSpesific.cookTime,
              imgUrl: _resepSpesific.image,
              rating: _resepSpesific.country.toString(),
              description: _resepSpesific.description,
              videoURL: _resepSpesific.videoURL,
              instructions: _resepSpesific.instructions,
              sections: _resepSpesific.sections,
            ),
            SizedBox(height: 24),
            //
            // ==> NAMA MENU
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Text(
                '${_resepSpesific.name}',
                textAlign: TextAlign.left,
                style: TextStyle(
                  fontSize: 24,
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(height: 32),
            // ==> DESKRIPSI RECIPE
            Text(
              'Description',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 20,
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
            //
            SizedBox(height: 8),
            //
            Container(
              margin: EdgeInsets.symmetric(horizontal: 16),
              width: Get.width,
              child: Text(
                (_resepSpesific.description == '')
                    ? 'No description available'
                    : '${_resepSpesific.description}',
                style: TextStyle(fontSize: 16),
                textAlign: TextAlign.left,
                overflow: TextOverflow.ellipsis,
                maxLines: 20,
              ),
            ),
            //
            SizedBox(height: 32),
            //
            // ==> INSTRUCTION
            Text(
              'Instruction',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 20,
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
            //
            SizedBox(height: 8),
            //
            SizedBox(
              child: ListView.builder(
                shrinkWrap: true,
                physics: ScrollPhysics(),
                itemCount: _resepSpesific.instructions.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(_resepSpesific.instructions[index].displayText),
                  );
                },
              ),
            ),
            //
            SizedBox(height: 32),

            // ==> INGREDIENT
            Text(
              'Ingredient',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 20,
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
            //
            SizedBox(height: 8),
            // //
            SizedBox(
              child: ListView.builder(
                shrinkWrap: true,
                physics: ScrollPhysics(),
                itemCount: component.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(component[index].rawText),
                  );
                },
              ),
            ),
            //
            SizedBox(height: 32),
            //
            Center(
              child: Text(
                'HAPPY COOKING...',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
            ),
            //
            SizedBox(height: 32),
            //
          ],
        ),
      ),
    );
  }
}
