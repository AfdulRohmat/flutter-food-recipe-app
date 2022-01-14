import 'package:flutter_food_shop_implement_restapi/app/data/models/instruction_model.dart';
import 'package:flutter_food_shop_implement_restapi/app/data/models/section_component_model.dart';

class ResepModel {
  final String name, image, cookTime, country, description, videoURL;
  final List<Instruction> instructions;
  final List<Section> sections;
  // List<Component>? component;
  ResepModel({
    required this.name,
    required this.image,
    required this.country,
    required this.cookTime,
    required this.description,
    required this.videoURL,
    required this.instructions,
    required this.sections,
    // this.component,
  });

  // Membuat fakctory constructor untuk mengasosiasikan field model dengan key API
  factory ResepModel.fromJson(dynamic json) {
    return ResepModel(
      name: json['name'] as String,
      image: json['thumbnail_url'] as String,
      country: json['country'] as String,
      cookTime: json['total_time_minutes'] != null
          ? json['total_time_minutes'].toString() + ' mnt'
          : 'a few minutes',
      description:
          json['description'] != null ? json['description'].toString() : '',
      videoURL: json['original_video_url'] != null
          ? json['original_video_url'].toString()
          : '',
      instructions: json["instructions"] != null
          ? List<Instruction>.from(
              json["instructions"].map((x) => Instruction.fromJson(x)))
          : [],
      sections: json["sections"] != null
          ? List<Section>.from(json["sections"].map((x) => Section.fromJson(x)))
          : [],
      // component: json["raw_text"] != null ? json["raw_text"] : [],
    );
  }

  // Membuat static method bertipe List yang akan ngemapping setiap data ke dalam factory constructor
  static List<ResepModel> resepFromSnapshot(List snapshot) {
    return snapshot.map((data) {
      return ResepModel.fromJson(data);
    }).toList();
  }

  // override methdd toString
  @override
  String toString() {
    return 'ResepModel {name : $name, image : $image, country: $country, cookTime:$cookTime, description : $description}, video : $videoURL, instructions: ${instructions.toString()}., sections: ${sections.toString()}';
  }
}
