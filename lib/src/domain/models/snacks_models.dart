// ignore_for_file: public_member_api_docs, sort_constructors_first
class SnacksModels {
  int? id;
  String? name;
  String? descricao;
  double? price;
  int? kcal;
  double? proteins;
  double? fats;
  double? carbo;
  SnacksModels({
    this.id,
    this.name,
    this.descricao,
    this.price,
    this.kcal,
    this.proteins,
    this.fats,
    this.carbo,
  });

  SnacksModels.fromJson(Map<String, dynamic> json) {
    id = json["id"];
    name = json["name"];
    descricao = json["descricao"];
    price = json["price"];
    kcal = json["kcal"];
    proteins = json["proteins"];
    fats = json["fats"];
    carbo = json["carbo"];
  }

  Map<String, dynamic> toJson() {
    Map<String, dynamic> data = {};
    data["name"] = name;
    data["descricao"] = descricao;
    data["price"] = price;
    data["kcal"] = kcal;
    data["proteins"] = proteins;
    data["fats"] = fats;
    data["carbo"] = carbo;

    return data;
  }
}
