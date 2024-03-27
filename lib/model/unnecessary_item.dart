enum EState {
  usedType("A used thing"),
  newType("A new thing");

  const EState(this.text);
  final String text;
}

class UnnecessaryItem {
  String? id;
  String? name;
  EState? state;
  double? price;

  UnnecessaryItem({this.id, this.name, this.price, this.state});

  factory UnnecessaryItem.fromJson(Map<String, dynamic> parsedJson) {
    return UnnecessaryItem(
      id: parsedJson['id'] ?? "",
      name: parsedJson['name'] ?? "",
      price: parsedJson['price'],
      state: EState.values.byName(parsedJson['state']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "name": name,
      "price": price,
      "state": state!.name,
    };
  }
}
