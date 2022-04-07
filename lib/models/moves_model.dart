class MovesModel {
  MovesModel({
    this.move,
    this.versionGroupDetails,
  });

  Move? move;
  List<VersionGroupDetail>? versionGroupDetails;

  factory MovesModel.fromJson(Map<String, dynamic> json) => MovesModel(
        move: Move.fromJson(json["move"]),
        versionGroupDetails: List<VersionGroupDetail>.from(
            json["version_group_details"]
                .map((x) => VersionGroupDetail.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "move": move?.toJson(),
        "version_group_details":
            List<dynamic>.from(versionGroupDetails!.map((x) => x.toJson())),
      };
}

class Move {
  Move({
    this.name,
    this.url,
  });

  String? name;
  String? url;

  factory Move.fromJson(Map<String, dynamic> json) => Move(
        name: json["name"],
        url: json["url"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "url": url,
      };
}

class VersionGroupDetail {
  VersionGroupDetail({
    this.levelLearnedAt,
    this.moveLearnMethod,
    this.versionGroup,
  });

  int? levelLearnedAt;
  Move? moveLearnMethod;
  Move? versionGroup;

  factory VersionGroupDetail.fromJson(Map<String, dynamic> json) =>
      VersionGroupDetail(
        levelLearnedAt: json["level_learned_at"],
        moveLearnMethod: Move.fromJson(json["move_learn_method"]),
        versionGroup: Move.fromJson(json["version_group"]),
      );

  Map<String, dynamic> toJson() => {
        "level_learned_at": levelLearnedAt,
        "move_learn_method": moveLearnMethod?.toJson(),
        "version_group": versionGroup?.toJson(),
      };
}
