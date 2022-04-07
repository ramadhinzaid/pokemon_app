import 'moves_model.dart';

class TypesModel {
  TypesModel({
    this.slot,
    this.type,
  });

  int? slot;
  Move? type;

  factory TypesModel.fromJson(Map<String, dynamic> json) => TypesModel(
        slot: json["slot"],
        type: Move.fromJson(json["type"]),
      );

  Map<String, dynamic> toJson() => {
        "slot": slot,
        "type": type?.toJson(),
      };
}
