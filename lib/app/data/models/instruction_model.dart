// Dibuat dengan QuicType => https://app.quicktype.io/

class Instruction {
  final String displayText;

  Instruction({
    required this.displayText,
  });

  factory Instruction.fromJson(Map<String, dynamic> json) => Instruction(
        displayText: json["display_text"] == null ? '' : json["display_text"],
      );

  Map<String, dynamic> toJson() => {
        "display_text": displayText == null ? '' : displayText,
      };
}
