class Section {
    Section({
        required this.components,
    });

    final List<Component> components;

    factory Section.fromJson(Map<String, dynamic> json) => Section(
        components: json["components"] != null ? List<Component>.from(json["components"].map((x) => Component.fromJson(x))) : [] 
    );

    Map<String, dynamic> toJson() => {
        "components": components != null ? List<dynamic>.from(components.map((x) => x.toJson())) : [] ,
    };
}

class Component {
    Component({
        required this.rawText,
    });

    final String rawText;

    factory Component.fromJson(Map<String, dynamic> json) => Component(
        rawText: json["raw_text"] != null ?  json["raw_text"] : '',
    );

    Map<String, dynamic> toJson() => {
        "raw_text": rawText != null ? rawText : '',
    };
}