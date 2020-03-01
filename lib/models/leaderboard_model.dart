// To parse this JSON data, do
//
//     final leaderBoardModel = leaderBoardModelFromJson(jsonString);

import 'dart:convert';

LeaderBoardModel leaderBoardModelFromJson(String str) => LeaderBoardModel.fromJson(json.decode(str));

String leaderBoardModelToJson(LeaderBoardModel data) => json.encode(data.toJson());

class LeaderBoardModel {
    List<LeaderboardDatum> data;

    LeaderBoardModel({
        this.data,
    });

    factory LeaderBoardModel.fromJson(Map<String, dynamic> json) => LeaderBoardModel(
        data: List<LeaderboardDatum>.from(json["data"].map((x) => LeaderboardDatum.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
    };
}

class LeaderboardDatum {
    int id;
    int totalPoints;
    DateTime createdAt;
    DateTime updatedAt;
    dynamic deletedAt;
    int nameId;
    Name name;

    LeaderboardDatum({
        this.id,
        this.totalPoints,
        this.createdAt,
        this.updatedAt,
        this.deletedAt,
        this.nameId,
        this.name,
    });

    factory LeaderboardDatum.fromJson(Map<String, dynamic> json) => LeaderboardDatum(
        id: json["id"],
        totalPoints: json["total_points"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        deletedAt: json["deleted_at"],
        nameId: json["name_id"],
        name: Name.fromJson(json["name"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "total_points": totalPoints,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
        "deleted_at": deletedAt,
        "name_id": nameId,
        "name": name.toJson(),
    };
}

class Name {
    int id;
    String name;
    String email;
    dynamic emailVerifiedAt;
    DateTime createdAt;
    DateTime updatedAt;
    dynamic deletedAt;

    Name({
        this.id,
        this.name,
        this.email,
        this.emailVerifiedAt,
        this.createdAt,
        this.updatedAt,
        this.deletedAt,
    });

    factory Name.fromJson(Map<String, dynamic> json) => Name(
        id: json["id"],
        name: json["name"],
        email: json["email"],
        emailVerifiedAt: json["email_verified_at"],
        createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
        deletedAt: json["deleted_at"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "email": email,
        "email_verified_at": emailVerifiedAt,
        "created_at": createdAt == null ? null : createdAt.toIso8601String(),
        "updated_at": updatedAt == null ? null : updatedAt.toIso8601String(),
        "deleted_at": deletedAt,
    };
}