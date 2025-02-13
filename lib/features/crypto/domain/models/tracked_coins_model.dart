class TrackedAssetsModel {
  String? name;
  double? amount;

  TrackedAssetsModel({this.name, this.amount});

  TrackedAssetsModel.fromJson(Map<String, dynamic> json) {
    name = json["name"];
    amount = json["amount"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["name"] = name;
    data["amount"] = amount;
    return data;
  }
}
