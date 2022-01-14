import 'package:flutter/material.dart';
import 'package:flutter_food_shop_implement_restapi/app/data/models/instruction_model.dart';
import 'package:flutter_food_shop_implement_restapi/app/data/models/section_component_model.dart';
import 'package:flutter_food_shop_implement_restapi/app/routes/app_pages.dart';
import 'package:get/get.dart';

class CardRecipe extends StatelessWidget {
  final String titleMenu, cookTime, imgUrl, rating, description, videoURL;
  final List<Instruction> instructions;
  final List<Section> sections;
  final List<Component>? components;

  const CardRecipe({
    Key? key,
    required this.titleMenu,
    required this.cookTime,
    required this.imgUrl,
    required this.rating,
    required this.description,
    required this.videoURL,
    required this.instructions,
    required this.sections,
    this.components,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        top: 8,
        right: 16,
        left: 16,
      ),
      width: Get.width,
      height: Get.height / 3.5,
      decoration: BoxDecoration(
        color: Colors.black,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.6),
            offset: Offset(0.0, 10.0),
            blurRadius: 10.0,
            spreadRadius: -6.0,
          )
        ],
        image: DecorationImage(
          image: NetworkImage(imgUrl),
          fit: BoxFit.cover,
          colorFilter: ColorFilter.mode(
              Colors.black.withOpacity(0.35), BlendMode.multiply),
        ),
      ),
      child: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Center(
              child: Text(
                titleMenu,
                textAlign: TextAlign.center,
                overflow: TextOverflow.ellipsis,
                maxLines: 2,
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomLeft,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // -> Play Video
                (videoURL.isEmpty)
                    ? Text('')
                    : InkWell(
                        onTap: () {
                          Get.toNamed(Routes.VIDEO, arguments: videoURL);
                        },
                        child: Container(
                          margin: EdgeInsets.only(left: 8, bottom: 8),
                          padding: EdgeInsets.all(6),
                          decoration: BoxDecoration(
                            color: Colors.black.withOpacity(0.4),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Row(
                            children: [
                              Icon(
                                Icons.play_arrow_rounded,
                                color: Colors.yellow,
                              ),
                              SizedBox(width: 4),
                              Text(
                                'play video',
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w700,
                                  color: Colors.white60,
                                ),
                              )
                            ],
                          ),
                        ),
                      ),

                //
                // -> Waktu Menunggu
                Container(
                  margin: EdgeInsets.only(right: 8, bottom: 8),
                  padding: EdgeInsets.all(6),
                  decoration: BoxDecoration(
                    color: Colors.black.withOpacity(0.4),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Row(
                    children: [
                      Icon(
                        Icons.schedule,
                        color: Colors.yellow,
                      ),
                      SizedBox(width: 4),
                      Text(
                        cookTime,
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w700,
                          color: Colors.white60,
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
