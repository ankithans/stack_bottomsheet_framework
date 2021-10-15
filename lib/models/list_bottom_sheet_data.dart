import 'dart:convert';

List<BottomSheetData> bottomSheetDataFromJson(String str) =>
    List<BottomSheetData>.from(
        json.decode(str).map((x) => BottomSheetData.fromJson(x)));

String bottomSheetDataToJson(List<BottomSheetData> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class BottomSheetData {
  BottomSheetData({
    required this.title,
    required this.description,
    required this.button,
    required this.afterTitle,
    required this.afterDescription,
  });

  late String title;
  late String description;
  late String button;
  late String afterTitle;
  late String afterDescription;

  factory BottomSheetData.fromJson(Map<String, dynamic> json) =>
      BottomSheetData(
        title: json["title"],
        description: json["description"],
        button: json["button"],
        afterTitle: json["after_title"],
        afterDescription: json["after_description"],
      );

  Map<String, dynamic> toJson() => {
    "title": title,
    "description": description,
    "button": button,
    "after_title": afterTitle,
    "after_description": afterDescription,
  };
}
