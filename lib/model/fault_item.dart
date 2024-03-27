class FaultItem {
  String? id;
  String? title;
  String? subtitle;

  FaultItem({this.id, this.title, this.subtitle});

  factory FaultItem.fromJson(Map<String, dynamic> parsedJson) {
    return FaultItem(
      id: parsedJson['id'] ?? '',
      title: parsedJson['title'] ?? "",
      subtitle: parsedJson['subtitle'] ?? "",
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      "title": title,
      "subtitle": subtitle,
    };
  }
}
